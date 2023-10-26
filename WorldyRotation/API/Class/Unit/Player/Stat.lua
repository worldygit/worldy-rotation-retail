local api = WR.api
local cache = WR.cache
local unit = api.unit
local player = unit.player
local spell = api.spell

do
  local gcd_OneSecond = {
    [103] = true, -- Feral
    [259] = true, -- Assassination
    [260] = true, -- Outlaw
    [261] = true, -- Subtlety
    [268] = true, -- Brewmaster
    [269] = true, -- Windwalker
  }
  function player:GCD()
    local guid = self:GUID()
    if guid then
      local unitInfo = cache.unitInfo[guid]
      if not unitInfo then
        unitInfo = {}
        cache.unitInfo[guid] = unitInfo
      end

      local gcd = unitInfo.gcd
      if not gcd then
        if gcd_OneSecond[cache.persistent.player.spec[1]] then
          gcd = 1
        else
          local gcd_Value = 1.5 / (1 + self:HastePct() / 100)
          gcd = gcd_Value > 0.75 and gcd_Value or 0.75
        end
        unitInfo.gcd = gcd
      end
      return gcd
    end
  end
end

do
  local gcdSpell = spell(61304)
  function player:GCDRemains()
    return gcdSpell:CooldownRemains(true)
  end

  function player:GCDStartTime()
    local startTime = gcdSpell:CooldownInfo()

    return startTime
  end
end

function player:AttackPower()
  return UnitAttackPower(self.unitID)
end

function player:AttackPowerDamageMod(offHand)
  local useOH = offHand or false
  local wdpsCoeff = 6
  local ap = player:AttackPower()
  local minDamage, maxDamage, minOffHandDamage, maxOffHandDamage, physicalBonusPos, physicalBonusNeg, percent = UnitDamage(self.unitID)
  local speed, offhandSpeed = UnitAttackSpeed(self.unitID)
  if useOH and offhandSpeed then
    local wSpeed = offhandSpeed * (1 + player:HastePct() / 100)
    local wdps = (minOffHandDamage + maxOffHandDamage) / wSpeed / percent - ap / wdpsCoeff
    return (ap + wdps * wdpsCoeff) * 0.5
  else
    local wSpeed = speed * (1 + player:HastePct() / 100)
    local wdps = (minDamage + maxDamage) / 2 / wSpeed / percent - ap / wdpsCoeff
    return ap + wdps * wdpsCoeff
  end
end

function player:CritChancePct()
  return GetCritChance()
end

function player:HastePct()
  return GetHaste()
end

function player:SpellHaste()
  return 1 / (1 + (player:HastePct() / 100))
end

function player:MasteryPct()
  return GetMasteryEffect()
end

function player:VersatilityDmgPct()
  return GetCombatRatingBonus(CR_VERSATILITY_DAMAGE_DONE) + GetVersatilityBonus(CR_VERSATILITY_DAMAGE_DONE)
end
