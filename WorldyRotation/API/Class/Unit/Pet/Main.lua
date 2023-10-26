local api = WR.api
local unit = api.unit
local pet = unit.pet

function pet:IsActive()
  return IsPetActive()
end
