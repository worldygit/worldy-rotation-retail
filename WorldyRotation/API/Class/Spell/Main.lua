local api = WR.api
local dbc = WR.dbc
local cache = WR.cache
local unit = api.unit
local player, target = unit.player, unit.target
local spell = api.spell

function spell:ID()
  return self.spellID
end

function spell:Type()
  return self.spellType
end

function spell:Name()
  return self.spellName
end

function spell:MinimumRange()
  return self.minimumRange
end

function spell:MaximumRange()
  return self.maximumRange
end

function spell:IsMelee()
  return self.isMelee
end

function spell:InfoByID()
  return GetSpellInfo(self:ID())
end

function spell:InfoByName()
  return GetSpellInfo(self:Name())
end

function spell:TimeSinceLastCast()
  return GetTime() - self.lastCastTime
end

function spell:TimeSinceLastDisplay()
  return GetTime() - self.lastDisplayTime
end

function spell:TimeSinceLastAppliedOnPlayer()
  return GetTime() - self.lastAppliedOnPlayerTime
end

function spell:TimeSinceLastRemovedOnPlayer()
  return GetTime() - self.lastRemovedFromPlayerTime
end

function spell:RegisterDamageFormula(fn)
  self.damageFormula = fn
end

function spell:Damage()
  return self.damageFormula and self.damageFormula() or 0
end

function spell:IsAvailable(checkPet)
  return checkPet and IsSpellKnown(self.spellID, true) or IsPlayerSpell(self.spellID)
end

function spell:IsKnown(checkPet)
  return IsSpellKnown(self.spellID, checkPet and true or false)
end

function spell:IsPetKnown()
  return self:IsKnown(true)
end

function spell:IsUsable()
  return IsUsableSpell(self.spellID)
end

function spell:IsUsableP(offset)
  local spellUsable, spellMissingResource = self:IsUsable()
  if spellUsable == false and spellMissingResource == false then
    return false
  end

  local costTable = self:CostTable() or {}
  local usable = true
  if #costTable > 0 then
    local i = 1
    while usable == true and i <= #costTable do
        local costInfo = costTable[i]
        local type = costInfo.type
        if player.predictedResourceMap[type]() < ((self.customCost and self.customCost[type] and self.customCost[type]()) or costInfo.minCost) + (offset or 0) then
          usable = false
        end
        i = i + 1
    end
  end
  return usable
end

function spell:IsUsablePPool(offset)
  local costTable = self:CostTable()
  if #costTable > 0 then
    local costInfo = costTable[1]
    local type = costInfo.type
    return player.predictedResourceMap[type]() < ((self.customCost and self.customCost[type] and self.customCost[type]()) or costInfo.minCost) + (offset or 0)
  else
    return true
  end
end

function spell:IsLearned()
  return cache.persistent.spellLearned[self:Type()][self:ID()] or false
end

function spell:Count()
  return GetSpellCount(self:ID())
end

function spell:IsCastable(bypassRecovery)
  return self:IsLearned() and self:CooldownUp(bypassRecovery)
end

function spell:IsReady()
  return self:IsCastable() and self:IsUsableP()
end

function spell:CastTime()
  local _, _, _, castTime = self:InfoByID()

  return castTime and castTime / 1000 or 0
end

function spell:ExecuteTime()
  local castTime = self:CastTime()
  local gcd = player:GCD()

  return castTime > gcd and castTime or gcd
end

function spell:ExecuteRemains()
  if not player:IsCasting(self) then return 0 end
  local castRemains = player:CastRemains()
  local gcdRemains = player:GCDRemains()

  return castRemains > gcdRemains and castRemains or gcdRemains
end

function spell:CostTable()
  local spellID = self.spellID

  local spellInfo = cache.spellInfo[spellID]
  if not spellInfo then
    spellInfo = {}
    cache.spellInfo[spellID] = spellInfo
  end

  local costTable = spellInfo.costTable
  if not costTable then
    costTable = GetSpellPowerCost(spellID)
    spellInfo.costTable = costTable
  end

  return costTable
end

function spell:CostInfo(index, key)
  if not key or type(key) ~= "string" then error("Invalid key type.") end

  local costTable = self:CostTable()
  if not index and costTable and #costTable > 1 and costTable[1]["type"] == 4 and costTable[2]["type"] == 3 then
    index = 2
  else
    index = index or 1
  end

  return costTable and costTable[index] and costTable[index][key] or nil
end

function spell:Cost(index)
  local cost = self:CostInfo(index, "cost")

  return cost or 0
end

function spell:TalentRank()
  return cache.persistent.talents[self.spellID] or 0
end

do
  local spellTickTime = dbc.spellTickTime

  function spell:FilterTickTime(specID)
    local registeredSpells = {}

    -- Fetch registered spells during the init
    for _, specSpells in pairs(api.classesSpecsBySpecID[specID][1]) do
      for _, thisSpell in pairs(specSpells) do
        local spellID = thisSpell:ID()
        local tickTimeInfo = spellTickTime[spellID][1]
        if tickTimeInfo ~= nil then
          registeredSpells[spellID] = tickTimeInfo
        end
      end
    end

    spellTickTime = registeredSpells
  end

  function spell:BaseTickTime()
    local tick = spellTickTime[self:ID()]
    if not tick or tick == 0 then return 0 end

    return tick[1] / 1000
  end

  function spell:TickTime()
    local baseTickTime = self:BaseTickTime()
    if not baseTickTime or baseTickTime == 0 then return 0 end

    local hasted = spellTickTime[self:ID()][2]
    if hasted then return baseTickTime * player:SpellHaste() end

    return baseTickTime
  end
end

do
  local spellDuration = dbc.spellDuration

  function spell:BaseDuration()
    local duration = spellDuration[self:ID()]
    if not duration or duration == 0 then return 0 end

    return duration[1] / 1000
  end

  function spell:MaxDuration()
    local duration = spellDuration[self.spellID]
    if not duration or duration == 0 then return 0 end

    return duration[2] / 1000
  end

  function spell:PandemicThreshold()
    local baseDuration = self:BaseDuration()
    if not baseDuration or baseDuration == 0 then return 0 end

    return baseDuration * 0.3
  end
end

do
  local spellGCD = dbc.spellGCD

  function spell:GCD()
    local gcd = spellGCD[self.spellID]
    if not gcd or gcd == 0 then return 0 end

    return gcd / 1000
  end
end

do
  local spellProjectileSpeed = dbc.spellProjectileSpeed

  function spell:FilterProjectileSpeed(specID)
    local registeredSpells = {}
    
    for _, specSpells in pairs(spell[api.classesSpecsBySpecID[specID][1]]) do
      for _, thisSpell in pairs(specSpells) do
        local spellID = thisSpell:ID()
        local projectileSpeed = spellProjectileSpeed[spellID]
        if projectileSpeed ~= nil then
          registeredSpells[spellID] = projectileSpeed
        end
      end
    end

    spellProjectileSpeed = registeredSpells
  end

  function spell:TravelTime(thisUnit)
    local spellID = self:ID()

    local speed = spellProjectileSpeed[spellID]
    if not speed or speed == 0 then return 0 end

    local maxDistance = (thisUnit and thisUnit:MaxDistance()) or target:MaxDistance()
    if not maxDistance then return 0 end

    return maxDistance / (speed or 22)
  end
end

function spell:IsInFlight()
  return GetTime() < self.lastHitTime
end

