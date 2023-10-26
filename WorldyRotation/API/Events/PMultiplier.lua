local api = WR.api
local unit = api.unit
local player = unit.player
local spell = api.spell

local listenedSpells = {}
local listenedAuras = {}

function spell:RegisterPMultiplier(...)
  local args = { ... }

  local spellAura = self:ID()
  local firstArg = args[1]
  if type(firstArg) == "table" and firstArg.spellID then
    spellAura = table.remove(args, 1).spellID
  end

  listenedAuras[spellAura] = self.spellID
  listenedSpells[self.spellID] = { buffs = args, units = {} }
end

local function SpellRegisterError(spell)
  local spellName = spell:Name()
  if spellName then
    return "You forgot to register the spell: " .. spellName .. " in PMultiplier handler."
  else
    return "You forgot to register the spell object."
  end
end

local function ComputePMultiplier(listenedSpell)
  local pMultiplier = 1
  for j = 1, #listenedSpell.buffs do
    local buff = listenedSpell.buffs[j]
    if type(buff) == "function" then
      pMultiplier = pMultiplier * buff()
    else
      local thisSpell = buff[1]
      local modifier = buff[2]

      if player:BuffUp(thisSpell) or thisSpell:TimeSinceLastRemovedOnPlayer() < 0.1 then
        local modifierType = type(modifier)

        if modifierType == "number" then
          pMultiplier = pMultiplier * modifier
        elseif modifierType == "function" then
          pMultiplier = pMultiplier * modifier()
        end
      end
    end
  end

  return pMultiplier
end

api:RegisterForSelfCombatEvent(
    function(_, _, _, _, _, _, _, destGUID, _, _, _, spellID)
      local listenedSpell = listenedSpells[spellID]
      if not listenedSpell then
        return
      end

      local pMultiplier = ComputePMultiplier(listenedSpell)
      local dot = listenedSpell.units[destGUID]
      if dot then
        dot.pMultiplier = pMultiplier
        dot.time = GetTime()
      else
        listenedSpell.units[destGUID] = { pMultiplier = pMultiplier, time = GetTime(), applied = false }
      end
    end,
    "SPELL_CAST_SUCCESS"
)

api:RegisterForSelfCombatEvent(
    function(_, _, _, _, _, _, _, destGUID, _, _, _, spellID)
      local listenedAura = listenedAuras[spellID]
      if not listenedAura then
        return
      end

      local listenedSpell = listenedSpells[listenedAura]
      if not listenedSpell then
        return
      end

      local dot = listenedSpell.units[destGUID]
      if dot then
        dot.applied = true
      else
        listenedSpell.units[destGUID] = { pMultiplier = 0, time = GetTime(), applied = true }
      end
    end,
    "SPELL_AURA_APPLIED", "SPELL_AURA_REFRESH"
)

api:RegisterForSelfCombatEvent(
    function(_, _, _, _, _, _, _, destGUID, _, _, _, spellID)
      local listenedAura = listenedAuras[spellID]
      if not listenedAura then
        return
      end

      local listenedSpell = listenedSpells[listenedAura]
      if not listenedSpell then
        return
      end

      local dot = listenedSpell.units[destGUID]
      if dot then
        dot.applied = false
      end
    end,
    "SPELL_AURA_REMOVED"
)

api:RegisterForCombatEvent(
    function(_, _, _, _, _, _, _, destGUID)
      for _, listenedSpell in pairs(listenedSpells) do
        if listenedSpell.units[destGUID] then
          listenedSpell.units[destGUID] = nil
        end
      end
    end,
    "UNIT_DIED", "UNIT_DESTROYED"
)

function unit:PMultiplier(thisSpell)
  local listenedSpell = listenedSpells[thisSpell:ID()]
  if not listenedSpell then
    error(SpellRegisterError(thisSpell))
  end

  local units = listenedSpell.units
  local dot = units[self:GUID()]

  return (dot and dot.applied and dot.pMultiplier) or 0
end

function player:PMultiplier(thisSpell)
  local listenedSpell = listenedSpells[thisSpell:ID()]
  if not listenedSpell then
    error(SpellRegisterError(thisSpell))
  end

  return ComputePMultiplier(listenedSpell)
end
