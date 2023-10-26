local addonName = ...

local api = WR.api
local unit = api.unit
local player = unit.player

function api.GetInstanceInfo(index)
  if index then
    local result = select(index, GetInstanceInfo())
    return result
  end
  return GetInstanceInfo()
end

-- @returns difficulty - Difficulty setting of the instance (number)
-- 0 - None not in an Instance.
-- 1 - 5-player Instance.
-- 2 - 5-player Heroic Instance.
-- 3 - 10-player Raid Instance.
-- 4 - 25-player Raid Instance.
-- 5 - 10-player Heroic Raid Instance.
-- 6 - 25-player Heroic Raid Instance.
-- 7 - 25-player Raid Finder Instance.
-- 8 - Challenge Mode Instance.
-- 9 - 40-player Raid Instance.
-- 10 - Not used.
-- 11 - Heroic Scenario Instance.
-- 12 - Scenario Instance.
-- 13 - Not used.
-- 14 - 10-30-player Normal Raid Instance.
-- 15 - 10-30-player Heroic Raid Instance.
-- 16 - 20-player Mythic Raid Instance .
-- 17 - 10-30-player Raid Finder Instance.
-- 18 - 40-player Event raid (Used by the level 100 version of Molten Core for WoW's 10th anniversary).
-- 19 - 5-player Event instance (Used by the level 90 version of UBRS at WoD launch).
-- 20 - 25-player Event scenario (unknown usage).
-- 21 - Not used.
-- 22 - Not used.
-- 23 - Mythic 5-player Instance.
-- 24 - Timewalker 5-player Instance.
function api.GetInstanceDifficulty()
  return api.GetInstanceInfo(3)
end

function api.CombatTime()
  return api.combatStarted ~= 0 and GetTime() - api.combatStarted or 0
end

function api.OutOfCombatTime()
  return api.combatEnded ~= 0 and GetTime() - api.combatEnded or 0
end

function api.BMPullTime()
  if not api.bossModTime or api.bossModTime == 0 or api.bossModEndTime - GetTime() < 0 then
    return 60
  else
    return api.bossModEndTime - GetTime()
  end
end

do
  local latency = 0
  local latencyFrame = CreateFrame("Frame", addonName .. "_LatencyFrame", UIParent)
  local latencyFrameNextUpdate = 0
  local latencyFrameUpdateFrequency = 30 -- 30 seconds
  latencyFrame:SetScript(
    "OnUpdate",
    function ()
      if GetTime() <= latencyFrameNextUpdate then return end
      latencyFrameNextUpdate = GetTime() + latencyFrameUpdateFrequency

      local _, _, _, lagWorld = GetNetStats()
      latency = lagWorld / 1000
    end
  )
  
  function api.Latency()
    return latency
  end

  function api.RecoveryTimer()
    local castRemains = player:CastRemains()
    local gcdRemains = player:GCDRemains()
    return math.max(gcdRemains, castRemains)
  end

  function api.RecoveryOffset(bypass)
    if (bypass) then return 0 end

    return latency + api.RecoveryTimer()
  end
end

