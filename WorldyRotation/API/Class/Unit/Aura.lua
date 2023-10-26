local api = WR.api
local unit = api.unit
local player = unit.player
local spell = api.spell

local GetPlayerAuraBySpellID = C_UnitAuras.GetPlayerAuraBySpellID

do
  local guid, spellID, unitID
  local auraStack, auraDuration, auraExpirationTime, auraSpellID, index

  function unit:AuraInfo(thisSpell, filter, full)
    guid = self:GUID()
    if not guid then return end

    spellID = thisSpell:ID()

    if guid == player:GUID() then
      if full then
        return GetPlayerAuraBySpellID(spellID)
      else
        local spellTable = GetPlayerAuraBySpellID(spellID)
        if type(spellTable) ~= "table" then return nil end
        auraDuration = spellTable.duration
        auraExpirationTime = spellTable.expirationTime
        auraStack = spellTable.applications
        return auraStack, auraDuration, auraExpirationTime
      end
    end

    unitID = self:ID()
    index = 1
    while true do
      _, _, auraStack, _, auraDuration, auraExpirationTime, _, _, _, auraSpellID = UnitAura(unitID, index, filter)

      if not auraSpellID then return end

      if auraSpellID == spellID then
        if full then
          return UnitAura(unitID, index, filter)
        else
          return auraStack, auraDuration, auraExpirationTime, index
        end
      end

      index = index + 1
    end
  end
end

function unit:BuffInfo(thisSpell, anyCaster, full)
  local filter = anyCaster and "HELPFUL" or "HELPFUL|PLAYER"

  return self:AuraInfo(thisSpell, filter, full)
end

function unit:BuffStack(thisSpell, anyCaster, bypassRecovery)
  if not bypassRecovery and self:BuffDown(thisSpell, anyCaster, bypassRecovery) then return 0 end

  local stack = self:BuffInfo(thisSpell, anyCaster)

  return stack or 0
end

function unit:BuffDuration(thisSpell, anyCaster)
  local _, duration = self:BuffInfo(thisSpell, anyCaster)

  return duration or 0
end

function unit:BuffRemains(thisSpell, anyCaster, bypassRecovery)
  local _, _, expirationTime = self:BuffInfo(thisSpell, anyCaster)
  if not expirationTime then return 0 end
  if expirationTime == 0 then return 9999 end

  -- TODO: Why this is here ?
  -- Stealth-like buffs (Subterfurge and Master Assassin) are delayed but within aura latency
  local spellID = thisSpell:ID()
  if spellID == 115192 or spellID == 256735 then
    expirationTime = expirationTime - 0.3
  end

  local remains = expirationTime - GetTime() - api.RecoveryOffset(bypassRecovery)

  return remains >= 0 and remains or 0
end

function unit:BuffUp(thisSpell, anyCaster, bypassRecovery)
  return self:BuffRemains(thisSpell, anyCaster, bypassRecovery) > 0
end

function unit:BuffDown(thisSpell, anyCaster, bypassRecovery)
  return not self:BuffUp(thisSpell, anyCaster, bypassRecovery)
end

function unit:BuffRefreshable(thisSpell, anyCaster, bypassRecovery)
  local pandemicThreshold = thisSpell:PandemicThreshold()

  return self:BuffRemains(thisSpell, anyCaster, bypassRecovery) <= pandemicThreshold
end

function unit:BuffTicksRemain(thisSpell, anyCaster, bypassRecovery)
  local remains = self:BuffRemains(thisSpell, anyCaster, bypassRecovery)
  if remains == 0 then return 0 end

  return math.ceil(remains / thisSpell:TickTime())
end

function unit:DebuffInfo(thisSpell, anyCaster, Full)
  local filter = anyCaster and "HARMFUL" or "HARMFUL|PLAYER"

  return self:AuraInfo(thisSpell, filter, Full)
end

function unit:DebuffStack(thisSpell, anyCaster, bypassRecovery)
  if not bypassRecovery and self:DebuffDown(thisSpell, anyCaster, bypassRecovery) then return 0 end

  local stack = self:DebuffInfo(thisSpell, anyCaster)

  return stack or 0
end

function unit:DebuffDuration(thisSpell, anyCaster)
  local _, duration = self:DebuffInfo(thisSpell, anyCaster)

  return duration or 0
end

function unit:DebuffRemains(thisSpell, anyCaster, bypassRecovery)
  local _, _, expirationTime = self:DebuffInfo(thisSpell, anyCaster)
  if not expirationTime then return 0 end
  if expirationTime == 0 then return 9999 end

  local remains = expirationTime - GetTime() - api.RecoveryOffset(bypassRecovery)

  return remains >= 0 and remains or 0
end

function unit:DebuffUp(thisSpell, anyCaster, bypassRecovery)
  return self:DebuffRemains(thisSpell, anyCaster, bypassRecovery) > 0
end

function unit:DebuffDown(thisSpell, anyCaster, bypassRecovery)
  return not self:DebuffUp(thisSpell, anyCaster, bypassRecovery)
end

function unit:DebuffRefreshable(thisSpell, pandemicThreshold, anyCaster, bypassRecovery)
  local pandemicThreshold = pandemicThreshold or thisSpell:PandemicThreshold()
  return self:DebuffRemains(thisSpell, anyCaster, bypassRecovery) <= pandemicThreshold
end

function unit:DebuffTicksRemain(thisSpell, anyCaster, bypassRecovery)
  local remains = self:DebuffRemains(thisSpell, anyCaster, bypassRecovery)
  if remains == 0 then return 0 end

  return math.ceil(remains / thisSpell:TickTime())
end

do
  local bloodlustSpells = {
    -- Abilities
    spell(2825), -- Shaman: Bloodlust (Horde)
    spell(32182), -- Shaman: Heroism (Alliance)
    spell(80353), -- Mage:Time Warp
    spell(90355), -- Hunter: Ancient Hysteria
    spell(160452), -- Hunter: Netherwinds
    spell(264667), -- Hunter: Primal Rage
    spell(390386), -- Evoker: Fury of the Aspects
    -- Drums
    spell(35475), -- Drums of War (Cata)
    spell(35476), -- Drums of Battle (Cata)
    spell(146555), -- Drums of Rage (MoP)
    spell(178207), -- Drums of Fury (WoD)
    spell(230935), -- Drums of the Mountain (Legion)
    spell(256740), -- Drums of the Maelstrom (BfA)
    spell(309658), -- Drums of Deathly Ferocity (SL)
    spell(381301), -- Feral Hide Drums (DF)
  }

  function unit:BloodlustRemains(bypassRecovery)
    local guid = self:GUID()
    if not guid then return false end

    for i = 1, #bloodlustSpells do
      local bloodlustSpell = bloodlustSpells[i]
      if self:BuffUp(bloodlustSpell, nil) then
        return self:BuffRemains(bloodlustSpell, nil, bypassRecovery)
      end
    end

    return 0
  end

  function unit:BloodlustUp(bypassRecovery)
    return self:BloodlustRemains(bypassRecovery) > 0
  end

  function unit:BloodlustDown(bypassRecovery)
    return not self:BloodlustUp(bypassRecovery)
  end
end

do
  local powerInfusionSpells = {
    -- Abilities
    spell(10060), -- Priest: Power Infusion
  }

  -- buff.power_infusion.remains
  function unit:PowerInfusionRemains(bypassRecovery)
    local guid = self:GUID()
    if not guid then return false end

    for i = 1, #powerInfusionSpells do
      local powerInfusionSpell = powerInfusionSpells[i]
      if self:BuffUp(powerInfusionSpell, nil) then
        return self:BuffRemains(powerInfusionSpell, nil, bypassRecovery)
      end
    end

    return 0
  end

  function unit:PowerInfusionUp(bypassRecovery)
    return self:PowerInfusionRemains(bypassRecovery) > 0
  end

  function unit:PowerInfusionDown(bypassRecovery)
    return not self:PowerInfusionUp(bypassRecovery)
  end
end

do
  local bloodlustExhaustSpells = {
    --TODO : look for other debuffs
    -- Abilities
    spell(57724),   -- Shaman: Sated (Horde)
    spell(57723),   -- Shaman: Exhaustion (Alliance)
    spell(80354),   -- Mage:Temporal Displacement
    spell(264689),  -- Hunter: Fatigued
    spell(390435),  -- Evoker: Exhaustion
    -- Drums
    --Spell(35475), -- Drums of War
    --Spell(35476), -- Drums of Battle
    --Spell(146555), -- Drums of Rage
    --Spell(178207), -- Drums of Fury
    --Spell(230935), -- Drums of the Mountain
    --Spell(256740), -- Drums of the Maelstrom
    --Spell(309658), -- Drums of Deathly Ferocity
  }

  function unit:BloodlustExhaustRemains(bypassRecovery)
    local guid = self:GUID()
    if not guid then return false end

    for i = 1, #bloodlustExhaustSpells do
      local bloodlustExhaustSpell = bloodlustExhaustSpells[i]
      if self:DebuffUp(bloodlustExhaustSpell, nil) then
        return self:DebuffRemains(bloodlustExhaustSpell, nil, bypassRecovery)
      end
    end

    return 0
  end

  function unit:BloodlustExhaustUp(bypassRecovery)
    return self:BloodlustExhaustRemains(bypassRecovery) > 0
  end

  function unit:BloodlustExhaustDown(bypassRecovery)
    return not self:BloodlustExhaustUp(bypassRecovery)
  end
end

do
  local enemyAbsorbSpells = {
    ---- Vault of the Incarnates
    -- Raszageth
    spell(382530), -- Surging Ruiner Shield (Surge)
    spell(388691), -- Stormsurge Shield
    ---- Aberrus
    -- Assault of the Zaqari
    spell(397383), -- Molten Barrier (Mystics)
  }

  function unit:EnemyAbsorb()
    for i = 1, #enemyAbsorbSpells do
      local absorbSpell = enemyAbsorbSpells[i]
      if self:BuffUp(absorbSpell, true) then
        return true
      end
    end
    return false
  end
end
