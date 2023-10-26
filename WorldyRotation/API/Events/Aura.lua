local api = WR.api
local unit = api.unit
local unitGUIDMap = api.unitGUIDMap
local target = unit.target
local nameplates = unit.nameplate
local spell = api.spell

local listenedAuras = {}


function spell:RegisterAuraTracking()
  local spellID = self:ID()

  if listenedAuras[spellID] then
    error("Attempted to register spell " .. spellID .. " multiple times, aborting!")
  end

  listenedAuras[spellID] = { spell = self, units = {} }
  --WR:PrintDebug("RegisterAuraTracking " .. spellID)
end

function api.UnregisterAuraTracking()
  --WR:PrintDebug("UnregisterAuraTracking()")
  listenedAuras = {}
end

api:RegisterForSelfCombatEvent(
  function(_, _, _, _, _, _, _, destGUID, _, _, _, spellID)
    local aura = listenedAuras[spellID]
    if not aura then return end

    local auraUnits = aura.units
    if not auraUnits[destGUID] then
      auraUnits[destGUID] = true
      -- WR:PrintDebug("AddAuraToUnit " .. SpellID .. " " .. DestGUID)
    else
      -- WR:PrintDebug("AddAuraToUnit Refresh " .. SpellID .. " " .. DestGUID)
      -- Refresh
    end
  end,
  "SPELL_AURA_APPLIED", "SPELL_AURA_REFRESH", "SPELL_AURA_APPLIED_DOSE"
)

api:RegisterForSelfCombatEvent(
  function(_, _, _, _, _, _, _, destGUID, _, _, _, spellID)
    local aura = listenedAuras[spellID]
    if not aura then return end

    local auraUnits = aura.units
    if auraUnits[destGUID] then
      auraUnits[destGUID] = nil
      -- WR:PrintDebug("RemoveAuraFromUnit " .. Aura.Spell:Name() .. " " .. DestGUID)
    end
  end,
  "SPELL_AURA_REMOVED"
)

api:RegisterForCombatEvent(
  function(_, _, _, _, _, _, _, destGUID)
    for _, aura in pairs(listenedAuras) do
      local auraUnits = aura.units
      if auraUnits[destGUID] then
        auraUnits[destGUID] = nil
        -- WR:PrintDebug("RemoveAurasFromUnit " .. Aura.Spell:Name() .. " " .. DestGUID)
      end
    end
  end,
  "UNIT_DIED", "UNIT_DESTROYED"
)

do
  local function ScanAurasOnUnit(thisUnit)
    local guid = thisUnit:GUID()
    if not guid then
      -- WR:PrintDebug("ScanAurasForUnit - Invalid Unit")
      return
    end

    for _, aura in pairs(listenedAuras) do
      local thisSpell = aura.spell
      local auraUnits = aura.units
      if thisUnit:DebuffUp(thisSpell, nil, true) or thisUnit:BuffUp(thisSpell, nil, true) then
        if not auraUnits[guid] then
          auraUnits[guid] = true
          -- WR:PrintDebug("ScanAurasForUnit - Adding " .. Aura.Spell:Name() .. " to unit " .. GUID)
        end
      else
        if auraUnits[guid] then
          auraUnits[guid] = nil
          -- WR:PrintDebug("ScanAurasForUnit - Removing " .. Aura.Spell:Name() .. " from unit " .. GUID)
        end
      end
    end
  end

  api:RegisterForEvent(function(_, unitID) ScanAurasOnUnit(nameplates[unitID]) end, "NAME_PLATE_UNIT_ADDED")
  api:RegisterForEvent(function() ScanAurasOnUnit(target) end, "PLAYER_TARGET_CHANGED")
end

do
  local function SpellRegisterError(errorSpell)
    return "You forgot to register the spell: " .. errorSpell:Name() or errorSpell:ID() .. " in RegisterAura handler."
  end

  local function GetAuraUnit(units, guid)
    if unitGUIDMap[guid] then
      for _, auraUnit in pairs(unitGUIDMap[guid]) do
        if auraUnit then
          return auraUnit
        end
      end
    end

    units[guid] = nil
    -- WR:PrintDebug("GetAuraUnit - Purging Unit " .. UnitGUID)

    return nil
  end

  function spell:AuraActiveCount()
    local aura = listenedAuras[self:ID()]
    if not aura then error(SpellRegisterError(self)) end

    local count = 0
    local auraUnits = aura.units
    for auraUnitGUID, _ in pairs(auraUnits) do
      if GetAuraUnit(auraUnits, auraUnitGUID) then
        count = count + 1
      end
    end

    return count
  end

  function spell:AuraActiveUnits()
    local aura = listenedAuras[self:ID()]
    if not aura then error(SpellRegisterError(self)) end

    local units = {}
    local auraUnits = aura.units
    for auraUnitGUID, _ in pairs(auraUnits) do
      local auraUnit = GetAuraUnit(auraUnits, auraUnitGUID)
      if auraUnit then
        table.insert(units, auraUnit)
      end
    end

    return units
  end

  function spell:AnyBuffUp(bypassRecovery)
    local aura = listenedAuras[self:ID()]
    if not aura then error(SpellRegisterError(self)) end

    local auraUnits = aura.units
    for auraUnitGUID, _ in pairs(auraUnits) do
      local auraUnit = GetAuraUnit(auraUnits, auraUnitGUID)
      if auraUnit and auraUnit:Buff(self, nil, bypassRecovery) then
        return true
      end
    end

    return false
  end

  function spell:AnyDebuffUp(bypassRecovery)
    local aura = listenedAuras[self:ID()]
    if not aura then error(SpellRegisterError(self)) end

    local auraUnits = aura.units
    for auraUnitGUID, _ in pairs(auraUnits) do
      local auraUnit = GetAuraUnit(auraUnits, auraUnitGUID)
      if auraUnit and auraUnit:DebuffUp(self, nil, bypassRecovery) then
        return true
      end
    end

    return false
  end

  function spell:MaxDebuffRemains(bypassRecovery)
    local aura = listenedAuras[self:ID()]
    if not aura then error(SpellRegisterError(self)) end

    local maxRemains = 0
    local auraUnits = aura.units
    for auraUnitGUID, _ in pairs(auraUnits) do
      local auraUnit = GetAuraUnit(auraUnits, auraUnitGUID)
      if auraUnit then
        maxRemains = math.max(maxRemains, auraUnit:DebuffRemains(self, nil, bypassRecovery))
      end
    end

    return maxRemains
  end

  function spell:MaxDebuffRemainsUnit(bypassRecovery)
    local aura = listenedAuras[self:ID()]
    if not aura then error(SpellRegisterError(self)) end

    local maxRemains, maxRemainsUnit = 0, nil
    local auraUnits = aura.units
    for auraUnitGUID, _ in pairs(auraUnits) do
      local auraUnit = GetAuraUnit(auraUnits, auraUnitGUID)
      if auraUnit then
        local unitRemains = auraUnit:DebuffRemains(self, nil, bypassRecovery)
        if unitRemains > maxRemains then
          maxRemains = unitRemains
          maxRemainsUnit = auraUnit
        end
      end
    end

    return maxRemainsUnit
  end

  function spell:MaxDebuffStack(bypassRecovery)
    local aura = listenedAuras[self:ID()]
    if not aura then error(SpellRegisterError(self)) end

    local maxStack = 0
    local auraUnits = aura.units
    for auraUnitGUID, _ in pairs(auraUnits) do
      local auraUnit = GetAuraUnit(auraUnits, auraUnitGUID)
      if auraUnit then
        maxStack = math.max(maxStack, auraUnit:DebuffStack(self, nil, bypassRecovery))
      end
    end

    return maxStack
  end

  function spell:MaxDebuffStackUnit(BypassRecovery)
    local aura = listenedAuras[self:ID()]
    if not aura then error(SpellRegisterError(self)) end

    local maxStack, maxStackUnit = 0, nil
    local auraUnits = aura.units
    for auraUnitGUID, _ in pairs(auraUnits) do
      local auraUnit = GetAuraUnit(auraUnits, auraUnitGUID)
      if auraUnit then
        local unitStack = auraUnit:DebuffStack(self, nil, BypassRecovery)
        if unitStack > maxStack then
          maxStack = unitStack
          maxStackUnit = auraUnit
        end
      end
    end

    return maxStackUnit
  end
end

