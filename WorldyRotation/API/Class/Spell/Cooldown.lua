local api = WR.api
local spell = api.spell

function spell:CooldownInfo()
  local spellID = self:ID()

  return GetSpellCooldown(spellID)
end

function spell:ChargesInfo()
  local spellID = self:ID()

  return GetSpellCharges(spellID)
end

function spell:Cooldown()
  local _, _, _, duration = self:ChargesInfo()
  if not duration then
    _, duration = self:CooldownInfo()
  end

  return duration
end

function spell:CooldownRemains(bypassRecovery)
  local startTime, duration = self:CooldownInfo()
  if startTime == 0 then return 0 end
  local cd = startTime + duration - GetTime() - api.RecoveryOffset(bypassRecovery)

  return cd > 0 and cd or 0
end

function spell:CooldownRemainsGuess(bypassRecovery)
  local startTime, duration = self:CooldownInfo()
  if startTime == 0 then return 0 end

  local cd = startTime + duration - GetTime() - api.RecoveryOffset(bypassRecovery)
  local reduction = ( GetTime() - self.lastCastTime ) / ( duration - cd );
  cd = cd * reduction;
  return cd > 0 and cd or 0
end

function spell:CooldownUp(bypassRecovery)
  return self:CooldownRemains(bypassRecovery) == 0
end

function spell:CooldownDown(bypassRecovery)
  return self:CooldownRemains(bypassRecovery) ~= 0
end

function spell:Charges(bypassRecovery)
  local charges, maxCharges = self:ChargesInfo()
  if charges < maxCharges and self:Recharge(bypassRecovery) == 0 then
    charges = charges + 1
  end

  return charges
end

function spell:MaxCharges()
  local _, maxCharges = self:ChargesInfo()
  
  return maxCharges
end

function spell:Recharge(bypassRecovery)
  local charges, maxCharges, startTime, duration = self:ChargesInfo()
  if charges == maxCharges then return 0 end
  local recharge = startTime + duration - GetTime() - api.RecoveryOffset(bypassRecovery)

  return recharge > 0 and recharge or 0
end

function spell:ChargesFractional(bypassRecovery)
  local charges, maxCharges, _, duration = self:ChargesInfo()
  if charges == maxCharges then return charges end

  return charges + ((duration - self:Recharge(bypassRecovery)) / duration)
end

function spell:FullRechargeTime(bypassRecovery)
  local charges, maxCharges, _, duration = self:ChargesInfo()
  if charges == maxCharges then return 0 end

  return (maxCharges - self:ChargesFractional(bypassRecovery)) * duration
end

function spell:UsableIn(bypassRecovery)
  if self:Charges() > 0 then return 0 end

  return self:Recharge(bypassRecovery)
end
