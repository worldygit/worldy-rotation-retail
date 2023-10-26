local api = WR.api
local unit = api.unit
local player = unit.player
local pet = unit.pet
local spell = api.spell

function player:IsMounted()
  return IsMounted() and not self:IsOnCombatMount()
end

function player:IsInParty()
  return UnitInParty(self.unitID)
end

function player:IsInRaid()
  return UnitInRaid(self.unitID)
end

-- Get the player race.
-- Dwarf, Draenei, Gnome, Human, NightElf, Worgen
-- BloodElf, Goblin, Orc, Tauren, Troll, Scourge
-- Pandaren
function player:Race()
  local _, race = UnitRace(self.unitID)
  return race
end

function player:IsRace(thisRace)
  return thisRace and self:Race() == thisRace or false
end

do
  local combatMountBuff = {
    --- Classes
    spell(131347), -- Demon Hunter Glide
    spell(783), -- Druid Travel Form
    spell(165962), -- Druid Flight Form
    spell(220509), -- Paladin Divine Steed
    spell(221883), -- Paladin Divine Steed
    spell(221885), -- Paladin Divine Steed
    spell(221886), -- Paladin Divine Steed
    spell(221887), -- Paladin Divine Steed
    spell(254471), -- Paladin Divine Steed
    spell(254472), -- Paladin Divine Steed
    spell(254473), -- Paladin Divine Steed
    spell(254474), -- Paladin Divine Steed

    --- Legion
    -- Class Order Hall
    spell(220480), -- Death Knight Ebon Blade Deathcharger
    spell(220484), -- Death Knight Nazgrim's Deathcharger
    spell(220488), -- Death Knight Trollbane's Deathcharger
    spell(220489), -- Death Knight Whitemane's Deathcharger
    spell(220491), -- Death Knight Mograine's Deathcharger
    spell(220504), -- Paladin Silver Hand Charger
    spell(220507), -- Paladin Silver Hand Charger
    -- Stormheim PVP Quest (Bareback Brawl)
    spell(221595), -- Storm's Reach Cliffwalker
    spell(221671), -- Storm's Reach Warbear
    spell(221672), -- Storm's Reach Greatstag
    spell(221673), -- Storm's Reach Worg
    spell(218964), -- Stormtalon

    --- Warlord of Draenor
    -- Nagrand
    spell(164222), -- Frostwolf War Wolf
    spell(165803) -- Telaari Talbuk
  }
  function player:IsOnCombatMount()
    for i = 1, #combatMountBuff do
      if self:BuffUp(combatMountBuff[i], true) then
        return true
      end
    end
    return false
  end
end

function player:IsInVehicle()
  return UnitInVehicle(self.unitID) and not self:IsInWhitelistedVehicle()
end

do
  local inVehicleWhitelist = {
    spells = {
      --- Dragonflight
      spell(377222), -- Consume (Treemouth, Brackenhide Hollow)
      --- Shadowlands
      -- Plaguefall
      spell(328429), -- Crushing Embrace (Slime Tentacle)
      -- The Maw
      spell(346835), -- Soul Brand (Winged Abductors)

      --- Warlord of Draenor
      -- Hellfire Citadel
      spell(187819), -- Crush (Kormrok's Hands)
      spell(181345), -- Foul Crush (Kormrok's Tank Hand)
      -- Blackrock Foundry
      spell(157059), -- Rune of Grasping Earth (Kromog's Hand)
    },
    petMounts = {
      --- Legion
      -- Karazhan
      116802, -- Rodent of Usual Size

      --- Warlord of Draenor
      -- Garrison Stables Quest
      87082, -- Silverperlt
      87078, -- Icehoof
      87081, -- Rocktusk
      87080, -- Riverwallow
      87079, -- Meadowstomper
      87076, -- Snarler
    }
  }
  function player:IsInWhitelistedVehicle()
    -- Spell
    local vehicleSpells = inVehicleWhitelist.spells
    for i = 1, #vehicleSpells do
      local vehicleSpell = vehicleSpells[i]
      if self:DebuffUp(vehicleSpell, nil, true) then
        return true
      end
    end

    -- PetMount
    local petMounts = inVehicleWhitelist.petMounts
    if pet:IsActive() then
      for i = 1, #petMounts do
        local petMount = petMounts[i]
        if pet:NPCID() == petMount then
          return true
        end
      end
    end

    return false
  end
end

do
  local stopCast = {
    debuffs = {
      { spell(240447), 1 } -- Quake (M+ Affix)
    }
  }
  function player:ShouldStopCasting()
    local debuffs = stopCast.debuffs
    for i = 1, #debuffs do
      local record = debuffs[i]
      local debuff, duration
      if type(record) == "table" then
        debuff, duration = record[1], record[2]
      else
        debuff = record
      end
      if self:DebuffUp(debuff, nil, true) and (not duration or self:DebuffRemains(debuff, nil, true) <= duration) then
        return true
      end
    end
  end
end
