local api = WR.api
local unit = api.unit
local player = unit.player

function player:GetTotemInfo(totemNumber)
  local haveTotem, totemName, startTime, duration = GetTotemInfo(totemNumber)
  return haveTotem, totemName, startTime, duration
end

function player:TotemRemains(totemNumber)
  local _, _, expirationTime, durationTime = self:GetTotemInfo(totemNumber)
  local remains = expirationTime + durationTime - GetTime()
  return remains >= 0 and remains or 0
end

function player:TotemName(totemNumber)
  local _, totemName, _, _ = self:GetTotemInfo(totemNumber)

  return totemName or 0
end
