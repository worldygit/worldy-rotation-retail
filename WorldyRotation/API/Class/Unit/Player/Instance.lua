local api = WR.api
local unit = api.unit
local player = unit.player

function player:InstanceInfo()
  return GetInstanceInfo()
end

function player:InstanceType()
  local _, instanceType = self:InstanceInfo()

  return instanceType
end

function player:InstanceDifficulty()
  local _, _, difficulty = self:InstanceInfo()

  return difficulty
end

function player:IsInInstancedPvP()
  local instanceType = self:InstanceType()

  return (instanceType == "arena" or instanceType == "pvp") or false
end

function player:IsInRaidArea()
  return self:InstanceType() == "raid" or false
end

function player:IsInDungeonArea()
  return self:InstanceType() == "party" or false
end
