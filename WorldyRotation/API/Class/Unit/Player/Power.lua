local api = WR.api
local unit = api.unit
local player = unit.player
local spell = api.spell

--------------------------
--- 0 | Mana Functions ---
--------------------------
do
  local manaPowerType = Enum.PowerType.Mana

  function player:ManaMax()
    return UnitPowerMax(self.unitID, manaPowerType)
  end

  function player:Mana()
    return UnitPower(self.unitID, manaPowerType)
  end

  function player:ManaPercentage()
    return (self:Mana() / self:ManaMax()) * 100
  end

  function player:ManaDeficit()
    return self:ManaMax() - self:Mana()
  end

  function player:ManaDeficitPercentage()
    return (self:ManaDeficit() / self:ManaMax()) * 100
  end

  function player:ManaRegen()
    return GetPowerRegen(self.unitID)
  end

  function player:ManaCastRegen(castTime)
    if self:ManaRegen() == 0 then
      return -1
    end
    return self:ManaRegen() * castTime
  end

  function player:ManaRemainingCastRegen(offset)
    if self:ManaRegen() == 0 then
      return -1
    end
    if self:IsCasting() then
      return self:ManaRegen() * (self:CastRemains() + (offset or 0))
    else
      return self:ManaRegen() * (self:GCDRemains() + (offset or 0))
    end
  end

  function player:ManaTimeToMax()
    if self:ManaRegen() == 0 then
      return -1
    end
    return self:ManaDeficit() / self:ManaRegen()
  end

  function player:ManaTimeToX(amount)
    if self:ManaRegen() == 0 then
      return -1
    end
    return amount > self:Mana() and (amount - self:Mana()) / self:ManaRegen() or 0
  end

  function player:ManaP()
    local futureMana = player:Mana() - player:CastCost()
    if player:Mana() ~= player:ManaMax() then
      futureMana = futureMana + player:ManaRemainingCastRegen()
    end
    if futureMana > player:ManaMax() then
      futureMana = player:ManaMax()
    end
    return futureMana
  end

  function player:ManaPercentageP()
    return (self:ManaP() / self:ManaMax()) * 100
  end

  function player:ManaDeficitP()
    return self:ManaMax() - self:ManaP()
  end

  function player:ManaDeficitPercentageP()
    return (self:ManaDeficitP() / self:ManaMax()) * 100
  end
end

--------------------------
--- 1 | Rage Functions ---
--------------------------
do
  local ragePowerType = Enum.PowerType.Rage

  function player:RageMax()
    return UnitPowerMax(self.unitID, ragePowerType)
  end

  function player:Rage()
    return UnitPower(self.unitID, ragePowerType)
  end

  function player:RagePercentage()
    return (self:Rage() / self:RageMax()) * 100
  end

  function player:RageDeficit()
    return self:RageMax() - self:Rage()
  end

  function player:RageDeficitPercentage()
    return (self:RageDeficit() / self:RageMax()) * 100
  end
end

---------------------------
--- 2 | Focus Functions ---
---------------------------
do
  local focusPowerType = Enum.PowerType.Focus

  function player:FocusMax()
    return UnitPowerMax(self.unitID, focusPowerType)
  end

  function player:Focus()
    return UnitPower(self.unitID, focusPowerType)
  end

  function player:FocusRegen()
    return GetPowerRegen(self.unitID)
  end

  function player:FocusPercentage()
    return (self:Focus() / self:FocusMax()) * 100
  end

  function player:FocusDeficit()
    return self:FocusMax() - self:Focus()
  end

  function player:FocusDeficitPercentage()
    return (self:FocusDeficit() / self:FocusMax()) * 100
  end

  function player:FocusRegenPercentage()
    return (self:FocusRegen() / self:FocusMax()) * 100
  end

  function player:FocusTimeToMax()
    if self:FocusRegen() == 0 then
      return -1
    end
    return self:FocusDeficit() / self:FocusRegen()
  end

  function player:FocusTimeToX(amount)
    if self:FocusRegen() == 0 then
      return -1
    end
    return amount > self:Focus() and (amount - self:Focus()) / self:FocusRegen() or 0
  end

  function player:FocusTimeToXPercentage(amount)
    if self:FocusRegen() == 0 then
      return -1
    end
    return amount > self:FocusPercentage() and (amount - self:FocusPercentage()) / self:FocusRegenPercentage() or 0
  end

  function player:FocusCastRegen(castTime)
    if self:FocusRegen() == 0 then
      return -1
    end
    return self:FocusRegen() * castTime
  end

  function player:FocusRemainingCastRegen(offset)
    if self:FocusRegen() == 0 then
      return -1
    end
    if self:IsCasting() then
      return self:FocusRegen() * (self:CastRemains() + (offset or 0))
    else
      return self:FocusRegen() * (self:GCDRemains() + (offset or 0))
    end
  end

  function player:FocusLossOnCastEnd()
    return self:IsCasting() and spell(self:CastSpellID()):Cost() or 0
  end

  function player:FocusPredicted(offset)
    if self:FocusRegen() == 0 then
      return -1
    end
    return math.min(player:FocusMax(), self:Focus() + self:FocusRemainingCastRegen(offset) - self:FocusLossOnCastEnd())
  end

  function player:FocusDeficitPredicted(offset)
    if self:FocusRegen() == 0 then
      return -1
    end
    return player:FocusMax() - self:FocusPredicted(offset);
  end

  function player:FocusTimeToMaxPredicted()
    if self:FocusRegen() == 0 then
      return -1
    end
    local focusDeficitPredicted = self:FocusDeficitPredicted()
    if focusDeficitPredicted <= 0 then
      return 0
    end
    return focusDeficitPredicted / self:FocusRegen()
  end
end

----------------------------
--- 3 | Energy Functions ---
----------------------------
do
  local energyPowerType = Enum.PowerType.Energy

  function player:EnergyMax(maxOffset)
    return math.max(0, UnitPowerMax(self.unitID, energyPowerType) + (maxOffset or 0))
  end

  function player:Energy()
    return UnitPower(self.unitID, energyPowerType)
  end

  function player:EnergyRegen()
    return GetPowerRegen(self.unitID)
  end

  function player:EnergyPercentage(maxOffset)
    return math.min(100, (self:Energy() / self:EnergyMax(maxOffset)) * 100)
  end

  function player:EnergyDeficit(maxOffset)
    return math.max(0, self:EnergyMax(maxOffset) - self:Energy())
  end

  function player:EnergyDeficitPercentage(maxOffset)
    return (self:EnergyDeficit(maxOffset) / self:EnergyMax(maxOffset)) * 100
  end

  function player:EnergyRegenPercentage(maxOffset)
    return (self:EnergyRegen() / self:EnergyMax(maxOffset)) * 100
  end

  function player:EnergyTimeToMax(maxOffset)
    if self:EnergyRegen() == 0 then
      return -1
    end
    return self:EnergyDeficit(maxOffset) / self:EnergyRegen()
  end

  function player:EnergyTimeToX(amount, offset)
    if self:EnergyRegen() == 0 then
      return -1
    end
    return amount > self:Energy() and (amount - self:Energy()) / (self:EnergyRegen() * (1 - (offset or 0))) or 0
  end

  function player:EnergyTimeToXPercentage(amount)
    if self:EnergyRegen() == 0 then
      return -1
    end
    return amount > self:EnergyPercentage() and (amount - self:EnergyPercentage()) / self:EnergyRegenPercentage() or 0
  end

  function player:EnergyRemainingCastRegen(offset)
    if self:EnergyRegen() == 0 then
      return -1
    end
    if self:IsCasting() or self:IsChanneling() then
      return self:EnergyRegen() * (self:CastRemains() + (offset or 0))
    else
      return self:EnergyRegen() * (self:GCDRemains() + (offset or 0))
    end
  end

  function player:EnergyPredicted(offset, maxOffset)
    if self:EnergyRegen() == 0 then
      return -1
    end
    return math.min(player:EnergyMax(maxOffset), self:Energy() + self:EnergyRemainingCastRegen(offset))
  end

  function player:EnergyDeficitPredicted(offset, maxOffset)
    if self:EnergyRegen() == 0 then
      return -1
    end
    return math.max(0, self:EnergyDeficit(maxOffset) - self:EnergyRemainingCastRegen(offset))
  end

  function player:EnergyTimeToMaxPredicted(offset, maxOffset)
    if self:EnergyRegen() == 0 then
      return -1
    end
    local energyDeficitPredicted = self:EnergyDeficitPredicted(offset, maxOffset)
    if energyDeficitPredicted <= 0 then
      return 0
    end
    return energyDeficitPredicted / self:EnergyRegen()
  end
end

----------------------------------
--- 4 | Combo Points Functions ---
----------------------------------
do
  local comboPointsPowerType = Enum.PowerType.ComboPoints

  function player:ComboPointsMax()
    return UnitPowerMax(self.unitID, comboPointsPowerType)
  end

  function player:ComboPoints()
    return UnitPower(self.unitID, comboPointsPowerType)
  end

  function player:ComboPointsDeficit()
    return self:ComboPointsMax() - self:ComboPoints()
  end
end

---------------------------------
--- 5 | Runic Power Functions ---
---------------------------------
do
  local runicPowerPowerType = Enum.PowerType.RunicPower

  function player:RunicPowerMax()
    return UnitPowerMax(self.unitID, runicPowerPowerType)
  end

  function player:RunicPower()
    return UnitPower(self.unitID, runicPowerPowerType)
  end

  function player:RunicPowerPercentage()
    return (self:RunicPower() / self:RunicPowerMax()) * 100
  end

  function player:RunicPowerDeficit()
    return self:RunicPowerMax() - self:RunicPower()
  end

  function player:RunicPowerDeficitPercentage()
    return (self:RunicPowerDeficit() / self:RunicPowerMax()) * 100
  end
end

---------------------------
--- 6 | Runes Functions ---
---------------------------
do
  local function ComputeRuneCooldown(slot, bypassRecovery)
    local cdTime, cdValue = GetRuneCooldown(slot)
    if cdTime == 0 or cdTime == nil then
      return 0
    end
    local cd = cdTime + cdValue - GetTime() - api.RecoveryOffset(bypassRecovery)
    return cd > 0 and cd or 0
  end

  function player:Rune()
    local count = 0
    for i = 1, 6 do
      if ComputeRuneCooldown(i) == 0 then
        count = count + 1
      end
    end
    return count
  end

  function player:RuneTimeToX(value)
    if type(value) ~= "number" then
      error("Value must be a number.")
    end
    if value < 1 or value > 6 then
      error("Value must be a number between 1 and 6.")
    end
    local runes = {}
    for i = 1, 6 do
      runes[i] = ComputeRuneCooldown(i)
    end
    table.sort(runes, function(a, b)
      return a < b
    end)
    local count = 1
    for _, cd in pairs(runes) do
      if count == value then
        return cd
      end
      count = count + 1
    end
  end
end

------------------------
--- 7 | Soul Shards  ---
------------------------
do
  local soulShardsPowerType = Enum.PowerType.SoulShards

  function player:SoulShardsMax()
    return UnitPowerMax(self.unitID, soulShardsPowerType)
  end

  function player:SoulShards()
    return UnitPower(self.unitID, soulShardsPowerType)
  end

  function player:SoulShardsP()
    return UnitPower(self.unitID, soulShardsPowerType)
  end

  function player:SoulShardsDeficit()
    return self:SoulShardsMax() - self:SoulShards()
  end
end

------------------------
--- 8 | Astral Power ---
------------------------
do
  local lunarPowerPowerType = Enum.PowerType.LunarPower

  function player:AstralPowerMax()
    return UnitPowerMax(self.unitID, lunarPowerPowerType)
  end

  function player:AstralPower(overrideFutureAstralPower)
    return overrideFutureAstralPower or UnitPower(self.unitID, lunarPowerPowerType)
  end

  function player:AstralPowerPercentage(overrideFutureAstralPower)
    return (self:AstralPower(overrideFutureAstralPower) / self:AstralPowerMax()) * 100
  end

  function player:AstralPowerDeficit(overrideFutureAstralPower)
    local astralPower = self:AstralPower(overrideFutureAstralPower)
    return self:AstralPowerMax() - astralPower
  end

  function player:AstralPowerDeficitPercentage(overrideFutureAstralPower)
    return (self:AstralPowerDeficit(overrideFutureAstralPower) / self:AstralPowerMax()) * 100
  end
end

--------------------------------
--- 9 | Holy Power Functions ---
--------------------------------
do
  local holyPowerPowerType = Enum.PowerType.HolyPower

  function player:HolyPowerMax()
    return UnitPowerMax(self.unitID, holyPowerPowerType)
  end

  function player:HolyPower()
    return UnitPower(self.unitID, holyPowerPowerType)
  end

  function player:HolyPowerPercentage()
    return (self:HolyPower() / self:HolyPowerMax()) * 100
  end

  function player:HolyPowerDeficit()
    return self:HolyPowerMax() - self:HolyPower()
  end

  function player:HolyPowerDeficitPercentage()
    return (self:HolyPowerDeficit() / self:HolyPowerMax()) * 100
  end
end

------------------------------
-- 11 | Maelstrom Functions --
------------------------------
function player:MaelstromMax()
  return UnitPowerMax(self.unitID, Enum.PowerType.Maelstrom)
end

function player:Maelstrom()
  return UnitPower(self.unitID, Enum.PowerType.Maelstrom)
end

function player:MaelstromPercentage()
  return (self:Maelstrom() / self:MaelstromMax()) * 100
end

function player:MaelstromDeficit()
  return self:MaelstromMax() - self:Maelstrom()
end

function player:MaelstromDeficitPercentage()
  return (self:MaelstromDeficit() / self:MaelstromMax()) * 100
end

--------------------------------------
--- 12 | Chi Functions (& Stagger) ---
--------------------------------------
do
  local chiPowerType = Enum.PowerType.Chi

  function player:ChiMax()
    return UnitPowerMax(self.unitID, chiPowerType)
  end

  function player:Chi()
    return UnitPower(self.unitID, chiPowerType)
  end

  function player:ChiPercentage()
    return (self:Chi() / self:ChiMax()) * 100
  end

  function player:ChiDeficit()
    return self:ChiMax() - self:Chi()
  end

  function player:ChiDeficitPercentage()
    return (self:ChiDeficit() / self:ChiMax()) * 100
  end

  function player:StaggerMax()
    return self:MaxHealth()
  end

  function player:Stagger()
    return UnitStagger(self.unitID)
  end

  function player:StaggerPercentage()
    return (self:Stagger() / self:StaggerMax()) * 100
  end
end

------------------------------
-- 13 | Insanity Functions ---
------------------------------
do
  local insanityPowerType = Enum.PowerType.Insanity

  function player:InsanityMax()
    return UnitPowerMax(self.unitID, insanityPowerType)
  end

  function player:Insanity()
    return UnitPower(self.unitID, insanityPowerType)
  end

  function player:InsanityPercentage()
    return (self:Insanity() / self:InsanityMax()) * 100
  end

  function player:InsanityDeficit()
    return self:InsanityMax() - self:Insanity()
  end

  function player:InsanityDeficitPercentage()
    return (self:InsanityDeficit() / self:InsanityMax()) * 100
  end

  function player:InsanityDrain()
    --TODO : calculate insanity drain
    return 1
  end
end

-----------------------------------
-- 16 | Arcane Charges Functions --
-----------------------------------
do
  local arcaneChargesPowerType = Enum.PowerType.ArcaneCharges

  function player:ArcaneChargesMax()
    return UnitPowerMax(self.unitID, arcaneChargesPowerType)
  end

  function player:ArcaneCharges()
    return UnitPower(self.unitID, arcaneChargesPowerType)
  end

  function player:ArcaneChargesPercentage()
    return (self:ArcaneCharges() / self:ArcaneChargesMax()) * 100
  end

  function player:ArcaneChargesDeficit()
    return self:ArcaneChargesMax() - self:ArcaneCharges()
  end

  function player:ArcaneChargesDeficitPercentage()
    return (self:ArcaneChargesDeficit() / self:ArcaneChargesMax()) * 100
  end
end

---------------------------
--- 17 | Fury Functions ---
---------------------------
do
  local furyPowerType = Enum.PowerType.Fury

  function player:FuryMax()
    return UnitPowerMax(self.unitID, furyPowerType)
  end

  function player:Fury()
    return UnitPower(self.unitID, furyPowerType)
  end

  function player:FuryPercentage()
    return (self:Fury() / self:FuryMax()) * 100
  end

  function player:FuryDeficit()
    return self:FuryMax() - self:Fury()
  end

  function player:FuryDeficitPercentage()
    return (self:FuryDeficit() / self:FuryMax()) * 100
  end
end

---------------------------
--- 18 | Pain Functions ---
---------------------------
do
  local painPowerType = Enum.PowerType.Pain

  function player:PainMax()
    return UnitPowerMax(self.unitID, painPowerType)
  end

  function player:Pain()
    return UnitPower(self.unitID, painPowerType)
  end

  function player:PainPercentage()
    return (self:Pain() / self:PainMax()) * 100
  end

  function player:PainDeficit()
    return self:PainMax() - self:Pain()
  end

  function player:PainDeficitPercentage()
    return (self:PainDeficit() / self:PainMax()) * 100
  end
end

------------------------------
--- 19 | Essence Functions ---
------------------------------
do
  local essencePowerType = Enum.PowerType.Essence

  function player:EssenceMax()
    return UnitPowerMax(self.unitID, essencePowerType)
  end

  function player:Essence()
    return UnitPower(self.unitID, essencePowerType)
  end

  function player:EssenceDeficit()
    return self:EssenceMax() - self:Essence()
  end

  function player:EmpowerStageDuration(stage)
    return GetUnitEmpowerStageDuration(self.unitID, stage)
  end

  function player:EmpowerStage(stage)
    local castTime = ((stage > 0 and player:EmpowerStageDuration(0) or 0)
        + (stage > 1 and player:EmpowerStageDuration(1) or 0)
        + (stage > 2 and player:EmpowerStageDuration(2) or 0)
        + (stage > 3 and player:EmpowerStageDuration(3) or 0))
        * player:SpellHaste()
        / 1000
        + api.Latency() + 0.01 -- threshold
    return (GetTime() - player:ChannelStart()) > 0.8 and (GetTime() - player:ChannelStart()) > castTime
  end
end

------------------------------
--- Predicted Resource Map ---
------------------------------
do
  player.predictedResourceMap = {
    [-2] = function()
      return player:Health()
    end,
    -- Mana
    [0] = function()
      return player:ManaP()
    end,
    -- Rage
    [1] = function()
      return player:Rage()
    end,
    -- Focus
    [2] = function()
      return player:FocusPredicted()
    end,
    -- Energy
    [3] = function()
      return player:EnergyPredicted()
    end,
    -- ComboPoints
    [4] = function()
      return player:ComboPoints()
    end,
    -- Runic Power
    [5] = function()
      return player:Rune()
    end,
    -- Runes
    [6] = function()
      return player:RunicPower()
    end,
    -- Soul Shards
    [7] = function()
      return player:SoulShardsP()
    end,
    -- Astral Power
    [8] = function()
      return player:AstralPower()
    end,
    -- Holy Power
    [9] = function()
      return player:HolyPower()
    end,
    -- Maelstrom
    [11] = function()
      return player:Maelstrom()
    end,
    -- Chi
    [12] = function()
      return player:Chi()
    end,
    -- Insanity
    [13] = function()
      return player:Insanity()
    end,
    -- Arcane Charges
    [16] = function()
      return player:ArcaneCharges()
    end,
    -- Fury
    [17] = function()
      return player:Fury()
    end,
    -- Pain
    [18] = function()
      return player:Pain()
    end,
    -- Essence
    [19] = function()
      return player:Essence()
    end,
  }
end

------------------------------
--- Time To X Resource Map ---
------------------------------
do
  player.timeToXResourceMap = {
    -- Mana
    [0] = function(value)
      return player:ManaTimeToX(value)
    end,
    -- Rage
    [1] = function()
      return nil
    end,
    -- Focus
    [2] = function(value)
      return player:FocusTimeToX(value)
    end,
    -- Energy
    [3] = function(value)
      return player:EnergyTimeToX(value)
    end,
    -- ComboPoints
    [4] = function()
      return nil
    end,
    -- Runic Power
    [5] = function()
      return nil
    end,
    -- Runes
    [6] = function(value)
      return player:RuneTimeToX(value)
    end,
    -- Soul Shards
    [7] = function()
      return nil
    end,
    -- Astral Power
    [8] = function()
      return nil
    end,
    -- Holy Power
    [9] = function()
      return nil
    end,
    -- Maelstrom
    [11] = function()
      return nil
    end,
    -- Chi
    [12] = function()
      return nil
    end,
    -- Insanity
    [13] = function()
      return nil
    end,
    -- Arcane Charges
    [16] = function()
      return nil
    end,
    -- Fury
    [17] = function()
      return nil
    end,
    -- Pain
    [18] = function()
      return nil
    end,
    -- Essence
    -- TODO: Add EssenceTimeToX()
    [19] = function()
      return nil
    end,
  }
end
