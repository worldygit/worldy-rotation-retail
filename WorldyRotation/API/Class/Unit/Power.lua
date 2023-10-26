local api = WR.api
local unit = api.unit

function unit:PowerType()
  local unitID = self:ID()

  return UnitPowerType(unitID)
end

function unit:PowerMax()
  local unitID = self:ID()

  return UnitPowerMax(unitID, self:PowerType())
end

function unit:Power()
  local unitID = self:ID()

  return UnitPower(unitID, self:PowerType())
end

function unit:PowerRegen()
  local unitID = self:ID()

  return GetPowerRegen(unitID)
end

function unit:PowerPercentage()
  return (self:Power() / self:PowerMax()) * 100
end

function unit:PowerDeficit()
  return self:PowerMax() - self:Power()
end

function unit:PowerDeficitPercentage()
  return (self:PowerDeficit() / self:PowerMax()) * 100
end

function unit:PowerRegenPercentage()
  return (self:PowerRegen() / self:PowerMax()) * 100
end

function unit:PowerTimeToMax()
  if self:PowerRegen() == 0 then return -1 end
  return self:PowerDeficit() / self:PowerRegen()
end

function unit:PowerTimeToX(amount, offset)
  if self:PowerRegen() == 0 then return -1 end
  return amount > self:Power() and (amount - self:Power()) / (self:PowerRegen() * (1 - (offset or 0))) or 0
end

function unit:PowerTimeToXPercentage(amount)
  if self:PowerRegen() == 0 then return -1 end
  return amount > self:PowerPercentage() and (amount - self:PowerPercentage()) / self:PowerRegenPercentage() or 0
end
