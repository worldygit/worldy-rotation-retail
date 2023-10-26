local api = WR.api
local unit = api.unit
local player = unit.player
local spell = api.spell

do
  local sbdSpells = {
    shadowlands = {
      R_CoN_SinsoulBulwarkKaal = spell(343126),
      R_CoN_SinsoulBulwarkGrashaal = spell(343135),
      R_CoN_HardenedStoneFormKaal = spell(329636),
      R_CoN_HardenedStoneFormGrashaal = spell(329808),
      R_CoN_UnyieldingShield = spell(346694),
      R_CoN_BloodShroud = spell(328921),
      R_SoD_EternalTorment = spell(355790),
      R_SotFO_GenesisBulwark = spell(367573),
      R_SotFO_DominationsGrasp = spell(362505),
      R_SotFO_IncompleteForm = spell(361934),
      R_SotFO_NebularCloud = spell(365381),
      R_SotFO_BurnedOut = spell(369571),
    },
    battleforAzeroth = {
      R_Nya_VoidInfusedIchor = spell(308377),
    },
    legion = {
      D_DHT_Submerged = spell(220519),
      R_ToS_SpiritRealm = spell(235621),
    },
  }
  local specialBlacklistData = {
    --- Dragonflight
    ----- Demon Hunter Condemned Demons -----
    -- If we want to include for the DH, we can - function() return Cache.Persistent.Player.Class[3] ~= 12 end
    [168932] = true,
    [169421] = true,
    [169425] = true,
    [169426] = true,
    [169428] = true,
    [169429] = true,
    [169430] = true,
    ----- Vault of the Incarnates -----
    --- Raszageth
    -- Volatile Sparks despawn when interrupted, damage to them is irrelevant
    [194999] = true,
    ----- Dungeons -----
    --- Uldaman ---
    -- The Lost Dwarves retreat to their longship at 10% hp
    [184580] = function(self) return self:HealthPercentage() <= 10 end,
    [184581] = function(self) return self:HealthPercentage() <= 10 end,
    [184582] = function(self) return self:HealthPercentage() <= 10 end,

    --- Shadowlands
    ----- Castle Nathria -----
    --- Stone Legion Generals
    -- General Kaal can't be hit while Sinsoul Bulwark is present and takes 95% reduced damage when Hardened Stone Form is present.
    [168112] = function(self) return self:BuffUp(sbdSpells.shadowlands.R_CoN_SinsoulBulwarkKaal, true)
      or self:BuffUp(sbdSpells.shadowlands.R_CoN_HardenedStoneFormKaal, true) end,
    -- General Grashaal can't be hit while Sinsoul Bulwark is present and takes 95% reduced damage when Hardened Stone Form is present.
    [168113] = function(self) return self:BuffUp(sbdSpells.shadowlands.R_CoN_SinsoulBulwarkGrashaal, true)
      or self:BuffUp(sbdSpells.shadowlands.R_CoN_HardenedStoneFormGrashaal, true) end,
    --- The Council of Blood
    -- Stavros, Frieda and Niklaus can't be hit while this buff is present.
    [166970] = function(self) return self:BuffUp(sbdSpells.shadowlands.R_CoN_UnyieldingShield, true) end,
    [166969] = function(self) return self:BuffUp(sbdSpells.shadowlands.R_CoN_UnyieldingShield, true) end,
    [166971] = function(self) return self:BuffUp(sbdSpells.shadowlands.R_CoN_UnyieldingShield, true) end,
    -- Afterimages despawn immediately and shouldn't be damaged
    [172803] = true,
    [173053] = true,
    --- Shriekwing
    -- Shriekwing can't be hit while this buff is present.
    [164406] = function(self) return self:BuffUp(sbdSpells.shadowlands.R_CoN_BloodShroud, true) end,
    ----- Sanctum of Domination -----
    --- Remnant of Ner'zhul
    -- Orb of torment take 99% reduced damage while they have their buff
    [177117] = function(self) return self:BuffUp(sbdSpells.shadowlands.R_SoD_EternalTorment, true) end,
    --- The Nine
    -- Secondary RP units that use scripted attacks
    [177222] = true, -- Aradne
    [177098] = true, -- Arthura
    [177101] = true, -- Brynja
    [177099] = true, -- Daschla
    [178737] = true, -- Kyra (P2)
    [178736] = true, -- Signe (P2)
    --- Painsmith Raznal
    -- Spiked Balls
    [176581] = true,
    --- Sylvannas Windrunner
    -- Friendly RP Units (Bolvar/Jaina/Thrall)
    [178081] = true,
    [176533] = true,
    [176532] = true,
    -- Anduin Wrynn and The Jailer (P3 RP characters in the center platform)
    [178072] = true,
    [178079] = true,
    --- Trash
    -- Condemned Soul Remnant
    [180385] = true,
    ----- Sepulcher of the First Ones -----
    --- Prototype Pantheon
    -- Wild Stampede NPC IDs
    [185456] = true, -- Wild Walkie
    [185460] = true, -- Wild Walkie
    [185480] = true, -- Wild Zoomie
    [185481] = true, -- Wild Sleepy
    --- Artificer Xy'mox
    -- Xy'mox takes 99% reduced damage while they have their buff
    [183501] = function(self) return self:BuffUp(sbdSpells.shadowlands.R_SotFO_GenesisBulwark, true) end,
    --- Anduin Wrynn
    -- Anduin takes no damage directly within intermission phases
    [181854] = function(self) return self:BuffUp(sbdSpells.shadowlands.R_SotFO_DominationsGrasp, true) end,
    [184830] = true, -- Beacon of Hope
    --- Lords of Shadow
    -- Inchoate Shadow enemies should not be attacked until they transform into Corporeal Shadow
    [183138] = function(self) return self:BuffUp(sbdSpells.shadowlands.R_SotFO_IncompleteForm, true) end,
    [181825] = true, -- Slumber Cloud
    --- Rygelon
    -- Cosmic Core enemies do not take damage directly
    [182823] = function(self) return self:BuffUp(sbdSpells.shadowlands.R_SotFO_NebularCloud, true) end,
    -- Unstable Matter enemies are immune to damage for 5s after being brought to 0 HP before healing
    [183945] = function(self) return self:BuffUp(sbdSpells.shadowlands.R_SotFO_BurnedOut, true) end,
    ----- Dungeons -----
    --- De Other Side
    -- Atal'ai Deathwalker's Spirit cannot be hit.
    [170483] = true,

    --- BfA
    ----- Corruptions -----
    -- Thing From Beyond (Appears to have 2 IDs)
    [160966] = true,
    [161895] = true,
    ----- Ny'alotha -----
    -- Drestagath heals all damage unless you have the Void Infused Ichor debuff
    [157602] = function(self) return not (player:IsTanking(self) or player:DebuffUp(sbdSpells.battleforAzeroth.R_Nya_VoidInfusedIchor)) end,

    --- Legion
    ----- Dungeons -----
    --- Darkheart Thicket
    -- Strangling roots can't be hit while this buff is present.
    [100991] = function(self) return self:BuffUp(sbdSpells.legion.D_DHT_Submerged, true) end,
    ----- Trial of Valor -----
    --- Helya
    -- Striking Tentacle cannot be hit.
    [114881] = true,
    ----- Tomb of Sargeras -----
    --- Desolate Host
    -- Engine of Eradication cannot be hit in Spirit Realm.
    [118460] = function(self) return player:DebuffUp(sbdSpells.legion.R_ToS_SpiritRealm, nil, true) end,
    -- Soul Queen Dejahna cannot be hit outside of Spirit Realm.
    [118462] = function(self) return not player:DebuffUp(sbdSpells.legion.R_ToS_SpiritRealm, nil, true) end,

    --- Mythic+ Affixes
    -- Fel Explosives
    [120651] = true,
    -- Incorporeal
    [204560] = true,
  }

  function unit:IsBlacklisted()
    local npcid = self:NPCID()

    local blacklistEntry = specialBlacklistData[npcid]
    if blacklistEntry then
      if type(blacklistEntry) == "boolean" then
        return true
      else
        return blacklistEntry(self)
      end
    end

    return false
  end
end

do
  local userDefined = {}
  -- TODO
  --local userDefined = WR.db.global.general.blacklist.userDefined

  function unit:IsUserBlacklisted()
    local npcid = self:NPCID()

    local blacklistEntry = userDefined[npcid]
    if blacklistEntry then
      if type(blacklistEntry) == "boolean" then
        return true
      else
        return blacklistEntry(self)
      end
    end

    return false
  end
end

do
  local cycleUserDefined = {}
  -- TODO
  --local cycleUserDefined = WR.db.global.general.blacklist.cycleUserDefined

  function unit:IsUserCycleBlacklisted()
    local npcid = self:NPCID()

    local blacklistEntry = cycleUserDefined[npcid]
    if blacklistEntry then
      if type(blacklistEntry) == "boolean" then
        return true
      else
        return blacklistEntry(self)
      end
    end

    return false
  end
end

do
  local specialMfDBlacklistData = {
    --- Legion
    ----- Dungeons (7.0 Patch) -----
    --- Halls of Valor
    -- Hymdall leaves the fight at 10%.
    [94960] = true,
    -- Solsten and Olmyr doesn't "really" die
    [102558] = true,
    [97202] = true,
    -- Fenryr leaves the fight at 60%. We take 50% as check value since it doesn't get immune at 60%.
    [95674] = function(self) return self:HealthPercentage() > 50 and true or false end,

    ----- Trial of Valor (T19 - 7.1 Patch) -----
    --- Odyn
    -- Hyrja & Hymdall leaves the fight at 25% during first stage and 85%/90% during second stage (HM/MM)
    [114360] = true,
    [114361] = true,

    --- Warlord of Draenor (WoD)
    ----- HellFire Citadel (T18 - 6.2 Patch) -----
    --- Hellfire Assault
    -- Mar'Tak doesn't die and leave fight at 50% (blocked at 1hp anyway).
    [93023] = true,

    ----- Dungeons (6.0 Patch) -----
    --- Shadowmoon Burial Grounds
    -- Carrion Worm : They doesn't die but leave the area at 10%.
    [88769] = true,
    [76057] = true,
  }
  function unit:IsMfDBlacklisted()
    local npcid = self:NPCID()

    local blacklistEntry = specialMfDBlacklistData[npcid]
    if blacklistEntry then
      if type(blacklistEntry) == "boolean" then
        return true
      else
        return blacklistEntry(self)
      end
    end

    return false
  end
end

do
  local notFacingExpireMultiplier = 3
  -- TODO
  --local notFacingExpireMultiplier = WR.db.global.general.blacklist.notFacingExpireMultiplier

  function unit:IsFacingBlacklisted()
    if self:IsUnit(api.unitNotInFront) and GetTime() - api.unitNotInFrontTime <= player:GCD() * notFacingExpireMultiplier then
      return true
    end
    return false
  end
end
