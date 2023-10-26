local api = WR.api
local cache = WR.cache
local utils = WR.utils
local unit = api.unit
local player = unit.player
local target = unit.target
local focus = unit.focus
local mouseover = unit.mouseover
local boss = unit.boss
local nameplate = unit.nameplate

local ttd = {
  settings = {
    -- Refresh time (seconds) : min=0.1,  max=2,    default = 0.1
    refresh = 0.1,
    -- History time (seconds) : min=5,    max=120,  default = 10+0.4
    historyTime = 10 + 0.4,
    -- Max history count :      min=20,   max=500,  default = 100
    historyCount = 100
  },
  cache = {}, -- A cache of unused { time, value } tables to reduce garbage due to table creation
  iterableUnits = {
    target,
    focus,
    mouseover,
    unpack(utils.MergeTable(boss, nameplate))
  }, -- It's not possible to unpack multiple tables during the creation process, so we merge them before unpacking it (not efficient but done only 1 time)
  -- TODO: Improve IterableUnits creation
  units = {}, -- Used to track units
  existingUnits = {}, -- Used to track GUIDs of currently existing units (to be compared with tracked units)
  throttle = 0
}
api.ttd = ttd

function api.TTDRefresh()
  local currentTime = GetTime()
  local historyCount = ttd.settings.historyCount
  local historyTime = ttd.settings.historyTime
  local ttdCache = ttd.cache
  local iterableUnits = ttd.iterableUnits
  local units = ttd.units
  local existingUnits = ttd.existingUnits

  table.wipe(existingUnits)

  local thisUnit
  for i = 1, #iterableUnits do
    thisUnit = iterableUnits[i]
    if thisUnit:Exists() then
      local guid = thisUnit:GUID()
      if not existingUnits[guid] then
        existingUnits[guid] = true
        local healthPercentage = thisUnit:HealthPercentage()
        if player:CanAttack(thisUnit) and healthPercentage < 100 then
          local unitTable = units[guid]
          if not unitTable or healthPercentage > unitTable[1][1][2] then
            unitTable = { {}, currentTime }
            units[guid] = unitTable
          end
          local values = unitTable[1]
          local time = currentTime - unitTable[2]
          if not values or healthPercentage ~= values[2] then
            local value
            local lastIndex = #ttdCache
            if lastIndex == 0 then
              value = { time, healthPercentage }
            else
              value = ttdCache[lastIndex]
              ttdCache[lastIndex] = nil
              value[1] = time
              value[2] = healthPercentage
            end
            table.insert(values, 1, value)
            local n = #values
            while (n > historyCount) or (time - values[n][1] > historyTime) do
              ttdCache[#cache + 1] = values[n]
              values[n] = nil
              n = n - 1
            end
          end
        end
      end
    end
  end

  for key in pairs(units) do
    if not existingUnits[key] then
      units[key] = nil
    end
  end
end

-- Returns Codes :
-- 11111 : No GUID
--  9999 : Negative TTD
--  8888 : Not Enough Samples or No Health Change
--  7777 : No DPS
--  6666 : Dummy
--    25 : A Player
function unit:TimeToX(percentage, minSamples)
  if self:IsDummy() then return 6666 end
  if self:IsAPlayer() and player:CanAttack(self) then return 25 end
  local seconds = 8888
  local unitTable = ttd.units[self:GUID()]
  if unitTable then
    local minSamples = minSamples or 3
    local values = unitTable[1]
    local n = #values
    if n > minSamples then
      local a, b = 0, 0
      local ex2, ex, exy, ey = 0, 0, 0, 0

      for i = 1, n do
        local Value = values[i]
        local x, y = Value[1], Value[2]

        ex2 = ex2 + x * x
        ex = ex + x
        exy = exy + x * y
        ey = ey + y
      end
      local invariant = 1 / (ex2 * n - ex * ex)
      a = (-ex * exy * invariant) + (ex2 * ey * invariant)
      b = (n * exy * invariant) - (ex * ey * invariant)
      if b ~= 0 then
        seconds = (percentage - a) / b
        seconds = math.min(7777, seconds - (GetTime() - unitTable[2]))
        if seconds < 0 then seconds = 9999 end
      end
    end
  end
  return seconds
end

local specialTTDPercentageData = {
  --- Dragonflight
  ----- Dungeons -----
  --- Brackenhide Hollow 
  -- Decatriarch Wratheye
  [186121] = 5,

  --- Shadowlands
  ----- Dungeons -----
  --- De Other Side
  -- Mueh'zala leaves the fight at 10%.
  [166608] = 10,
  --- Mists of Tirna Scithe
  -- Tirnenns leaves the fight at 20%.
  [164929] = 20, -- Tirnenn Villager
  [164804] = 20, -- Droman Oulfarran
  --- Sanguine Depths
  -- General Kaal leaves the fight at 50%.
  [162099] = 50,
  ----- Castle Nathria -----
  --- Stone Legion Generals
  -- General Kaal leaves the fight at 50% if General Grashaal has not fight yet. We take 49% as check value since it get -95% dmg reduction at 50% until intermission is over.
  [168112] = function(self) return (not self:CheckHPFromBossList(168113, 99) and 49) or 0 end,
  --- Sun King's Salvation
  -- Shade of Kael'thas fight is 60% -> 45% and then 10% -> 0%.
  [165805] = function(self) return (self:HealthPercentage() > 20 and 45) or 0 end,
  ----- Sanctum of Domination -----
  --- Eye of the Jailer leaves at 66% and 33%
  [180018] = function(self) return (self:HealthPercentage() > 66 and 66) or (self:HealthPercentage() <= 66 and self:HealthPercentage() > 33 and 33) or 0 end,
  --- Painsmith Raznal leaves at 70% and 40%
  [176523] = function(self) return (self:HealthPercentage() > 70 and 70) or (self:HealthPercentage() <= 70 and self:HealthPercentage() > 40 and 40) or 0 end,
  --- Fatescribe Roh-Kalo phases at 70% and 40%
  [179390] = function(self) return (self:HealthPercentage() > 70 and 70) or (self:HealthPercentage() <= 70 and self:HealthPercentage() > 40 and 40) or 0 end,
  --- Sylvanas Windrunner intermission at 83% and "dies" at 50% (45% in MM)
  [180828] = function(self) return (self:HealthPercentage() > 83 and 83) or ((player:InstanceDifficulty() == 16 and 45) or 50) end,

  --- Legion
  ----- Open World  -----
  --- Stormheim Invasion
  -- Lord Commander Alexius
  [118566] = 85,
  ----- Dungeons -----
  --- Halls of Valor
  -- Hymdall leaves the fight at 10%.
  [94960] = 10,
  -- Fenryr leaves the fight at 60%. We take 50% as check value since it doesn't get immune at 60%.
  [95674] = function(self) return (self:HealthPercentage() > 50 and 60) or 0 end,
  -- Odyn leaves the fight at 80%.
  [95676] = 80,
  --- Maw of Souls
  -- Helya leaves the fight at 70%.
  [96759] = 70,
  ----- Trial of Valor -----
  --- Odyn
  -- Hyrja & Hymdall leaves the fight at 25% during first stage and 85%/90% during second stage (HM/MM).
  [114360] = function(self) return (not self:CheckHPFromBossList(114263, 99) and 25) or (player:InstanceDifficulty() == 16 and 85) or 90 end,
  [114361] = function(self) return (not self:CheckHPFromBossList(114263, 99) and 25) or (player:InstanceDifficulty() == 16 and 85) or 90 end,
  -- Odyn leaves the fight at 10%.
  [114263] = 10,
  ----- Nighthold -----
  --- Elisande leaves the fight two times at 10% then normally dies. She looses 50% power per stage (100 -> 50 -> 0).
  [106643] = function(self) return (self:Power() > 0 and 10) or 0 end,

  --- Warlord of Draenor (WoD)
  ----- Dungeons -----
  --- Shadowmoon Burial Grounds
  -- Carrion Worm doesn't die but leave the area at 10%.
  [88769] = 10,
  [76057] = 10,
  ----- HellFire Citadel -----
  --- Hellfire Assault
  -- Mar'Tak doesn't die and leave fight at 50% (blocked at 1hp anyway).
  [93023] = 50,

  --- Classic
  ----- Dungeons -----
  --- Uldaman 
  -- Dwarves
  [184580] = 5,
  [184581] = 5,
  [184582] = 5,
}
function unit:SpecialTTDPercentage(npcid)
  local specialTTDPercentage = specialTTDPercentageData[npcid]
  if not specialTTDPercentage then return 0 end

  if type(specialTTDPercentage) == "number" then
    return specialTTDPercentage
  end

  return specialTTDPercentage(self)
end

-- Get the unit TimeToDie
function unit:TimeToDie(minSamples)
  local guid = self:GUID()
  if not guid then return 11111 end

  local minSamples = minSamples or 3
  local unitInfo = cache.unitInfo[guid]
  if not unitInfo then
    unitInfo = {}
    cache.unitInfo[guid] = unitInfo
  end

  local ttd = unitInfo.ttd
  if not ttd then
    ttd = {}
    unitInfo.ttd = ttd
  end
  if not ttd[minSamples] then
    ttd[minSamples] = self:TimeToX(self:SpecialTTDPercentage(self:NPCID()), minSamples)
  end

  return ttd[minSamples]
end

function unit:BossTimeToDie(minSamples)
  if self:IsInBossList() or self:IsDummy() then
    return self:TimeToDie(minSamples)
  end

  return 11111
end

function unit:FilteredTimeToDie(operator, value, offset, valueThreshold, minSamples)
  local ttd = self:TimeToDie(minSamples)

  return ttd < (valueThreshold or 7777) and utils.CompareThis(operator, ttd + (offset or 0), value) or false
end

function unit:BossFilteredTimeToDie(operator, value, offset, valueThreshold, minSamples)
  if self:IsInBossList() or self:IsDummy() then
    return self:FilteredTimeToDie(operator, value, offset, valueThreshold, minSamples)
  end

  return false
end

function unit:TimeToDieIsNotValid(minSamples)
  return self:TimeToDie(minSamples) >= 7777
end

function unit:BossTimeToDieIsNotValid(minSamples)
  if self:IsInBossList() then
    return self:TimeToDieIsNotValid(minSamples)
  end

  return true
end

function api.FightRemains(enemies, bossOnly)
  local bossExists, maxTimeToDie
  for _, bossUnit in pairs(boss) do
    if bossUnit:Exists() then
      bossExists = true
      if not bossUnit:TimeToDieIsNotValid() then
        maxTimeToDie = math.max(maxTimeToDie or 0, bossUnit:TimeToDie())
      end
    end
  end

  if bossExists or bossOnly then
    return maxTimeToDie or 11111
  end

  if enemies then
    for _, cycleUnit in pairs(enemies) do
      if not cycleUnit:IsUserCycleBlacklisted() and (cycleUnit:AffectingCombat() or cycleUnit:IsDummy()) and not cycleUnit:TimeToDieIsNotValid() then
        maxTimeToDie = math.max(maxTimeToDie or 0, cycleUnit:TimeToDie())
      end
    end
    if maxTimeToDie then
      return maxTimeToDie
    end
  end

  return target:TimeToDie()
end

function api.BossFightRemains()
  return api.FightRemains(nil, true)
end

function api.BossFightRemainsIsNotValid()
  return api.BossFightRemains() >= 7777
end

function api.FilteredFightRemains(enemies, operator, value, checkIfValid, bossOnly)
  local fightRemains = api.FightRemains(enemies, bossOnly)
  if checkIfValid and fightRemains >= 7777 then
    return false
  end

  return utils.CompareThis(operator, fightRemains, value) or false
end

function api.BossFilteredFightRemains(operator, value, checkIfValid)
  return api.FilteredFightRemains(nil, operator, value, checkIfValid, true)
end

