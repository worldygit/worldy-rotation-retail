local api = WR.api
local unit = api.unit
local player = unit.player
local target = unit.target
local spell = api.spell

local trackedSpells = {}
local effectMap = {}

function spell:RegisterInFlightEffect(effectID)
  self.inFlightEffectID = effectID
end

function spell:InFlightEffect()
  return self.inFlightEffectID
end

function spell:RegisterInFlight(...)
  local args = { ... }
  local spellID = self.spellID

  local trackedSpell = { inflight = false, destGUID = nil, count = 0, auras = {} }
  trackedSpells[spellID] = trackedSpell
  for _, auraSpell in pairs(args) do
    if auraSpell:ID() then
      trackedSpell.auras[auraSpell] = false
    end
  end

  local inFlightEffectID = self:InFlightEffect()
  if inFlightEffectID then
    effectMap[inFlightEffectID] = spellID
  end
end

api:RegisterForSelfCombatEvent(
  function(_, _, _, _, _, _, _, destGUID, _, _, _, spellID)
    local trackedSpell = trackedSpells[spellID]
    if not trackedSpell then return end

    if destGUID == "" then
      trackedSpell.destGUID = target:GUID()
    else
      trackedSpell.destGUID = destGUID
    end

    trackedSpell.inflight = true
    trackedSpell.count = trackedSpell.count + 1
    for auraSpell, _ in pairs(trackedSpell.auras) do
      trackedSpell.auras[auraSpell] = player:BuffUp(auraSpell) or auraSpell:TimeSinceLastRemovedOnPlayer() < 0.1
    end
  end,
  "SPELL_CAST_SUCCESS"
)

api:RegisterForSelfCombatEvent(
  function(_, _, _, _, _, _, _, destGUID, _, _, _, spellID)
    local effectSpellID = effectMap[spellID]
    local trackedSpell = (effectSpellID and trackedSpells[effectSpellID]) or trackedSpells[spellID]
    if not trackedSpell then return end

    if trackedSpell.destGUID == destGUID then
      trackedSpell.inflight = false
      trackedSpell.count = math.max(0, trackedSpell.count - 1)
    end
  end,
  "SPELL_DAMAGE", "SPELL_MISSED", "SPELL_AURA_APPLIED", "SPELL_AURA_REFRESH"
)

api:RegisterForCombatEvent(
  function(_, _, _, _, _, _, _, destGUID)
    for spellID, _ in pairs(trackedSpells) do
      local trackedSpell = trackedSpells[spellID]
      if trackedSpell.destGUID == destGUID then
        trackedSpell.inflight = false
        trackedSpell.count = math.max(0, trackedSpell.count - 1)
      end
    end
  end,
  "UNIT_DIED", "UNIT_DESTROYED"
)

function spell:InFlight(aura)
  local trackedSpell = trackedSpells[self:ID()]
  if not trackedSpell then error("You forgot to register " .. self:Name() .. " for InFlight tracking.") end

  if aura then
    return trackedSpell.inflight and trackedSpell.auras[aura]
  end

  return trackedSpell.inflight
end
