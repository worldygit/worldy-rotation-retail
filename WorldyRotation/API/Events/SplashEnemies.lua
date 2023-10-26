local addonName = ...

local api = WR.api
local utils = WR.utils
local unit = api.unit
local player = unit.player

local splash = {}
local SPLASH_TRACKER_TIMEOUT = 3 -- 3000ms
local nucleusAbilities = {} -- Every abilities that are used in order to compute splash data. { [SpellID] = { Type, Radius } }
local friendTargets = {} -- Track the targets of our friend (player, party, raid, pets, ...) in order to potentially assign the splash to their target (see NucleusAbility type). { [FriendGUID] = FriendTargetGUID }
local trackerBuffer = {} -- Buffer of the tracker since splash is coming from multiple events. { [SpellID] = { [SourceGUID] = { FirstTime, FriendTargetGUID, FirstDestGUID, Enemies = { GUID, LastTime, LastSpellID } } } }
local tracker = {} -- Track each enemies from where we splash from. { [PrimaryEnemyGUID] = { [Radius] = { [EnemyGUID] = { GUID, LastDamageTime, LastDamageSpellID } } } }

api.splashEnemies = splash

do
  local startsWith = utils.StartsWith
  -- TODO: Add more available tracking like choosing between tanks, melees, ranged, etc...
  -- Who are the friend units we are tracking
  local FRIEND_TARGETS_TRACKING_ALL = 1 -- "All": Player + Party/Raid and their Pet
  local FRIEND_TARGETS_TRACKING_MINE = 2 -- "Mine Only": Player and his Pet
  local friendTargetsTrackings = {
    ["All"] = FRIEND_TARGETS_TRACKING_ALL,
    ["Mine Only"] = FRIEND_TARGETS_TRACKING_MINE
  }
  local friendTargetsTracking = FRIEND_TARGETS_TRACKING_ALL
  
  local function UpdateFriendTarget(unitID)
    -- WR:PrintDebug("[SplashEnemies] Updating friend target for UnitID '" .. UnitID .."'.")
    local friendGUID = UnitGUID(unitID)
    local targetGUID = UnitGUID(unitID .. "target")
    if friendGUID then
      friendTargets[friendGUID] = targetGUID
    end
  end
  
  local function UpdateGroupData()
    if player:IsInRaidArea() and player:IsInRaid() then
      SPLASH_TRACKER_TIMEOUT = 3
    elseif player:IsInDungeonArea() and player:IsInParty() then
      SPLASH_TRACKER_TIMEOUT = 4
    else
      SPLASH_TRACKER_TIMEOUT = 5
    end

    UpdateFriendTarget("player")
    UpdateFriendTarget("pet")
    
    if friendTargetsTracking == FRIEND_TARGETS_TRACKING_ALL then
      if player:IsInParty() then
        for _, partyUnit in pairs(unit.party) do
          local unitID = partyUnit:ID()
          UpdateFriendTarget(unitID)
          UpdateFriendTarget(unitID .. "pet")
        end
      end
      if player:IsInRaid() then
        for _, raidUnit in pairs(unit.raid) do
          local unitID = raidUnit:ID()
          UpdateFriendTarget(unitID)
          UpdateFriendTarget(unitID .. "pet")
        end
      end
    end
  end

  UpdateGroupData()
  
  api:RegisterForEvent(UpdateGroupData, "PLAYER_REGEN_DISABLED", "GROUP_ROSTER_UPDATE")
  
  api:RegisterForEvent(
    function(event, unitID)
      if friendTargetsTracking == FRIEND_TARGETS_TRACKING_ALL and not startsWith(unitID, "player") and not startsWith(unitID, "pet") and not startsWith(unitID, "party") and not startsWith(unitID, "raid") then
        return
      end
      if friendTargetsTracking == FRIEND_TARGETS_TRACKING_MINE and not startsWith(unitID, "player") and not startsWith(unitID, "pet") then
        return
      end

      UpdateFriendTarget(unitID)
    end,
    "UNIT_TARGET"
  )
  
  api:RegisterForEvent(
    function(event, unitID)
      if friendTargetsTracking == FRIEND_TARGETS_TRACKING_ALL and not startsWith(unitID, "player") and not startsWith(unitID, "party") and not startsWith(unitID, "raid") then
        return
      end
      if friendTargetsTracking == FRIEND_TARGETS_TRACKING_MINE and not startsWith(unitID, "player") then
        return
      end

      UpdateFriendTarget(unitID .. "pet")
    end,
    "UNIT_PET"
  )

  function splash.ChangeFriendTargetsTracking(trackingMode)
    assert(type(trackingMode) == "string" and (trackingMode == "All" or trackingMode == "Mine Only"), "Invalid Tracking.")

    local tracking = friendTargetsTrackings[trackingMode]
    if tracking == friendTargetsTracking then
      return
    end

    friendTargetsTracking = tracking
    friendTargets = {}
    UpdateGroupData()
  end
end

do
  local function UpdateSplashes(_, event, _, sourceGUID, _, _, _, destGUID, _, _, _, spellID)
    local nucleusAbility = nucleusAbilities[spellID]
    if not nucleusAbility then return end

    if event ~= "SPELL_DAMAGE" and nucleusAbility.type ~= "PeriodicDamage" then return end

    local friendTargetGUID = friendTargets[sourceGUID]
    if not friendTargetGUID then return end

    local buffer = trackerBuffer[spellID][sourceGUID]
    if not buffer then
      if event ~= "SPELL_DAMAGE" and event ~= "SPELL_PERIODIC_DAMAGE" then return end

      -- WR:PrintDebug("[SplashEnemies] Creating buffer for SpellID '" .. SpellID .. "' from SourceGUID '" .. SourceGUID .. "'.")
      buffer = { firstTime = GetTime(), friendTargetGUID = friendTargetGUID, firstDestGUID = destGUID, enemies = { { guid = destGUID, lastTime = GetTime(), lastSpellID = spellID } } }
      trackerBuffer[spellID][sourceGUID] = buffer
      return
    end

    local destEnemy
    local bufferEnemies = buffer.enemies
    for i = 1, #bufferEnemies do
      local bufferEnemy = bufferEnemies[i]
      if bufferEnemy.guid == destGUID then
        destEnemy = bufferEnemy
        break
      end
    end
    
    if destEnemy then
      -- WR:PrintDebug("[SplashEnemies] Updating enemy with GUID '" .. DestGUID .. "' in buffer with SpellID '" .. SpellID .. "' from SourceGUID '" .. SourceGUID .. "'.")
      destEnemy.lastTime = GetTime()
      destEnemy.lastSpellID = spellID
    else
      -- WR:PrintDebug("[SplashEnemies] Adding enemy with GUID '" .. DestGUID .. "' in buffer with SpellID '" .. SpellID .. "' from SourceGUID '" .. SourceGUID .. "'.")
      destEnemy = { guid = destGUID, lastTime = GetTime(), lastSpellID = spellID }
      table.insert(bufferEnemies, destEnemy)
    end
  end

  api:RegisterForCombatEvent(UpdateSplashes, "SPELL_DAMAGE", "SPELL_PERIODIC_DAMAGE", "SPELL_AURA_APPLIED", "SPELL_AURA_REFRESH", "SPELL_AURA_APPLIED_DOSE")
end

-- Process the tracker buffer every 50ms.
do
  local splashBufferFrame = CreateFrame("Frame", addonName .. "_SplashBufferFrame", UIParent)
  local splashBufferFrameNextUpdate = 0
  local splashBufferFrameUpdateFrequency = 0.05 -- 50ms
  splashBufferFrame:SetScript(
    "OnUpdate",
    function ()
      if GetTime() <= splashBufferFrameNextUpdate then return end
      splashBufferFrameNextUpdate = GetTime() + splashBufferFrameUpdateFrequency

      local bufferThresholdTime = GetTime() - splashBufferFrameUpdateFrequency
      for spellID, bufferBySourceGUID in pairs(trackerBuffer) do
        local nucleusAbility = nucleusAbilities[spellID]

        for sourceGUID, buffer in pairs(bufferBySourceGUID) do
          if buffer.firstTime <= bufferThresholdTime then
            local bufferEnemies = buffer.enemies
            local primaryEnemyGUID
            if nucleusAbility.type == "PeriodicDamage" then
              primaryEnemyGUID = buffer.firstDestGUID
            else
              local friendTargetGUID = buffer.friendTargetGUID
              for i = 1, #bufferEnemies do
                local enemy = bufferEnemies[i]
                if enemy.guid == friendTargetGUID then
                  primaryEnemyGUID = enemy.guid
                  break
                end
              end
            end

            if primaryEnemyGUID then
              local enemiesByRadius = tracker[primaryEnemyGUID]
              if not enemiesByRadius then
                -- WR:PrintDebug("[SplashEnemies] Creating enemies by radius table for PrimaryEnemyGUID '" .. PrimaryEnemyGUID .. "'.")
                enemiesByRadius = {}
                tracker[primaryEnemyGUID] = enemiesByRadius
              end

              local enemies = enemiesByRadius[nucleusAbility.radius]
              if not enemies then
                -- WR:PrintDebug("[SplashEnemies] Creating enemies table within '" .. NucleusAbility.Radius .. "y' radius of enemy with GUID '" .. PrimaryEnemyGUID .. ".")
                enemies = {}
                enemiesByRadius[nucleusAbility.radius] = enemies
              end

              for i = 1, #bufferEnemies do
                local bufferEnemy = bufferEnemies[i]
                local enemy = enemies[bufferEnemy.guid]
                if enemy then
                  if (bufferEnemy.lastTime > enemy.lastTime) then
                    -- WR:PrintDebug("[SplashEnemies] Updating enemy with GUID '" .. BufferEnemy.GUID .. "' in enemies table within '" .. NucleusAbility.Radius .. "y' radius of enemy with GUID '" .. PrimaryEnemyGUID .. ".")
                    enemy.lastTime = bufferEnemy.lastTime
                    enemy.lastSpellID = bufferEnemy.lastSpellID
                  end
                else
                  -- WR:PrintDebug("[SplashEnemies] Adding enemy with GUID '" .. BufferEnemy.GUID .. "' in enemies table within '" .. NucleusAbility.Radius .. "y' radius of enemy with GUID '" .. PrimaryEnemyGUID .. ".")
                  enemies[bufferEnemy.guid] = bufferEnemy
                  --Enemies[BufferEnemy.GUID] = { GUID = BufferEnemy.GUID, LastTime = BufferEnemy.LastTime, LastSpellID = BufferEnemy.LastSpellID }
                end
              end
            end

            bufferBySourceGUID[sourceGUID] = nil
          end
        end
      end
    end
  )
end

do
  local splashCleanerFrame = CreateFrame("Frame", addonName .. "_SplashCleanerFrame", UIParent)
  local splashCleanerFrameNextUpdate = 0
  local splashCleanerFrameUpdateFrequency = 0.25 -- 250ms
  splashCleanerFrame:SetScript(
    "OnUpdate",
    function ()
      if GetTime() <= splashCleanerFrameNextUpdate then return end
      splashCleanerFrameNextUpdate = GetTime() + splashCleanerFrameUpdateFrequency

      local timeoutTime = GetTime() - SPLASH_TRACKER_TIMEOUT
      for primaryEnemyGUID, enemiesByRadius in pairs(tracker) do
        for radius, enemies in pairs(enemiesByRadius) do
          local enemiesCount = 0
          for enemyGUID, enemy in pairs(enemies) do
            if enemy.lastTime <= timeoutTime then
              -- WR:PrintDebug("[SplashEnemies] Removing enemy with GUID '" .. EnemyGUID .. "' from enemies table within '" .. Radius .. "y' radius of enemy with GUID '" .. PrimaryEnemyGUID .. "' due to timeout.")
              enemies[enemyGUID] = nil
            else
              enemiesCount = enemiesCount + 1
            end
          end
          
          if enemiesCount == 0 then
            -- WR:PrintDebug("[SplashEnemies] Removing enemies table within '" .. Radius .. "y' radius of enemy with GUID '" .. PrimaryEnemyGUID .. "' due to timeout.")
            enemiesByRadius[radius] = nil
          end
        end
      end
    end
  )
end

api:RegisterForCombatEvent(
  function (_, _, _, _, _, _, _, destGUID)
    if tracker[destGUID] then
      -- WR:PrintDebug("[SplashEnemies] Removing enemy with GUID '" .. DestGUID .. "' from the tracker.")
      tracker[destGUID] = nil
    end

    for primaryEnemyGUID, enemiesByRadius in pairs(tracker) do
      for radius, enemies in pairs(enemiesByRadius) do
        local enemiesCount = 0
        for enemyGUID, enemy in pairs(enemies) do
          if destGUID == enemy.guid then
            -- WR:PrintDebug("[SplashEnemies] Removing enemy with GUID '" .. EnemyGUID .. "' from enemies table within '" .. Radius .. "y' radius of enemy with GUID '" .. PrimaryEnemyGUID .. "' due to death event.")
            enemies[enemyGUID] = nil
          else
            enemiesCount = enemiesCount + 1
          end
        end
        
        if enemiesCount == 0 then
          -- WR:PrintDebug("[SplashEnemies] Removing enemies table within '" .. Radius .. "y' radius of enemy with GUID '" .. PrimaryEnemyGUID .. "' due to death event.")
          enemiesByRadius[radius] = nil
        end
      end
    end
  end,
  "UNIT_DIED", "UNIT_DESTROYED"
)

api:RegisterForEvent(
  function()
    -- WR:PrintDebug("[SplashEnemies] Clearing the tracker and the buffers.")
    table.wipe(tracker)
    for _, bufferBySourceGUID in pairs(trackerBuffer) do
      table.wipe(bufferBySourceGUID)
    end
  end,
  "PLAYER_REGEN_ENABLED"
)

-- Register a NucleusAbility.
-- Type: DirectDamage               = Ability like Multi-Shot, Fan of Knives or Eye Beam where the area of effect is near an unit and deals direct damage.
--                                    We listen only on the SPELL_DAMAGE event.
--                                    The main target is considered to be the current target of the source if it has been hit.
-- Type: GroundDirectDamage         = Ability like Cataclysm or Metamorphosis where the area of effect deals direct damage one time.
--                                    We listen only on the SPELL_DAMAGE event.
--                                    The main target is considered to be the current target of the source if it has been hit.
-- Type: PeriodicDamage             = Ability like Sunfire where the area of effect is near an unit and deals direct damage then periodic damage.
--                                    We listen on SPELL_DAMAGE, SPELL_AURA_APPLIED, SPELL_AURA_REFRESH, SPELL_AURA_APPLIED_DOSE events.
--                                    The main target is the unit hit by the SPELL_DAMAGE event.
-- TODO: TYPES BELOW ARE TO BE IMPLEMENTED
-- Type: ChainDirectDamage          = Ability like Throw Glaive or Chain Lightning where it deals direct damage on one enemy inside the area of effect.
--                                    We listen only on the SPELL_DAMAGE event.
--                                    The main target is the unit hit by the first SPELL_DAMAGE event.
-- Type: GroundMultipleDirectDamage = Ability like Rain of Fire or Blizzard where the area of effect deals direct damage multiple time.
--                                    We listen only on the SPELL_DAMAGE event.
--                                    The main target is considered to be the current target of the source if it has been hit.

function splash.RegisterNucleusAbility(t, spellID, radius)
  assert(type(t) == "string" and (t == "DirectDamage" or t == "GroundDirectDamage" or t == "PeriodicDamage"), "Invalid or Unsupported Type.")
  assert(type(spellID) == "number", "Invalid SpellID.")
  assert(type(radius) == "number" and radius >= 1 and radius < 100, "Radius must be between 1 and 100.")

  --WR:PrintDebug("RegisterNucleusAbility - Adding ability " .. spellID .. " with " .. radius .. "y radius.")
  nucleusAbilities[spellID] = { type = t, radius = radius }
  trackerBuffer[spellID] = {}
end

function splash.RegisterNucleusAbilities()
  --WR:PrintDebug("RegisterNucleusAbilities")
  local registerNucleusAbility = splash.RegisterNucleusAbility

  -- Commons

  -- Death Knight
  -- Commons
  registerNucleusAbility("DirectDamage", 383313, 8)               -- Abomination Limb
  registerNucleusAbility("GroundDirectDamage", 52212, 8)          -- Death and Decay
  -- Blood
  registerNucleusAbility("DirectDamage", 50842, 10)               -- Blood Boil
  registerNucleusAbility("DirectDamage", 196528, 8)               -- Bonestorm
  registerNucleusAbility("DirectDamage", 274156, 8)               -- Consumption
  -- Frost
  registerNucleusAbility("DirectDamage", 155166, 12)              -- Breath of Sindragosa
  registerNucleusAbility("DirectDamage", 204167, 6)               -- Chill Streak
  registerNucleusAbility("DirectDamage", 207230, 8)               -- Frostscythe
  registerNucleusAbility("DirectDamage", 49184, 10)               -- Howling Blast
  registerNucleusAbility("DirectDamage", 196771, 8)               -- Remorseless Winter
  -- Unholy
  registerNucleusAbility("GroundDirectDamage", 156000, 8)         -- Defile
  registerNucleusAbility("DirectDamage", 115994, 10)              -- Unholy Blight
  registerNucleusAbility("DirectDamage", 212739, 8)               -- Epidemic

  -- Demon Hunter
  -- Commons
  registerNucleusAbility("DirectDamage", 179057, 8)               -- Chaos Nova
  registerNucleusAbility("DirectDamage", 258922, 8)               -- Immolation Aura
  registerNucleusAbility("GroundDirectDamage", 307046, 8)         -- Elysian Decree
  registerNucleusAbility("GroundDirectDamage", 204598, 8)         -- Sigil of Flame
  -- Havoc
  registerNucleusAbility("DirectDamage", 200685, 8)               -- Blade Dance 1
  registerNucleusAbility("DirectDamage", 199552, 8)               -- Blade Dance 2
  registerNucleusAbility("DirectDamage", 210153, 8)               -- Death Sweep 1
  registerNucleusAbility("DirectDamage", 210155, 8)               -- Death Sweep 2
  registerNucleusAbility("DirectDamage", 258860, 10)              -- Essence Break
  registerNucleusAbility("DirectDamage", 198030, 20)              -- Eye Beam
  registerNucleusAbility("GroundDirectDamage", 200166, 8)         -- Metamorphosis
  -- Vengeance
  registerNucleusAbility("DirectDamage", 320341, 8)               -- Bulk Extraction
  registerNucleusAbility("DirectDamage", 212105, 13)              -- Fel Devastation
  registerNucleusAbility("DirectDamage", 189112, 6)               -- Infernal Strike
  registerNucleusAbility("DirectDamage", 228478, 8)               -- Soul Cleave
  registerNucleusAbility("DirectDamage", 247455, 8)               -- Spirit Bomb

  -- Druid
  -- Commons
  registerNucleusAbility("PeriodicDamage", 164815, 8)             -- Sunfire
  registerNucleusAbility("DirectDamage", 194153, 8)               -- Lunar Strike
  -- Balance
  --RegisterNucleusAbility("TO_INVESTIGATE", 191037, 40)            -- Starfall
  -- Feral
  registerNucleusAbility("DirectDamage", 285381, 8)               -- Primal Wrath
  registerNucleusAbility("DirectDamage", 202028, 8)               -- Brutal Slash
  registerNucleusAbility("DirectDamage", 106830, 8)               -- Thrash (Cat)
  registerNucleusAbility("DirectDamage", 106785, 8)               -- Swipe (Cat)
  -- Guardian
  registerNucleusAbility("DirectDamage", 77758, 8)                -- Thrash (Bear)
  registerNucleusAbility("DirectDamage", 213771, 8)               -- Swipe (Bear)
  -- Restoration

  -- Evoker
  -- Commons
  registerNucleusAbility("DirectDamage", 357209, 12)              -- Fire Breath (Check spell ID; Range? It's a cone up to 25y(?))
  -- Augmentation
  registerNucleusAbility("DirectDamage", 395160, 8)               -- Eruption
  registerNucleusAbility("DirectDamage", 396288, 6)              -- Upheaval (Range? Spell goes from 3/6/9/12y depending on empower level)
  registerNucleusAbility("GroundDirectDamage", 403631, 12)        -- Breath of Eons (Range? Spell range is 15-50y)
  -- Devastation
  registerNucleusAbility("DirectDamage", 357212, 8)               -- Pyre (Check spell ID)
  registerNucleusAbility("DirectDamage", 359077, 12)              -- Eternity Surge (Check spell ID; Range? Could technically be out to 25y)
  registerNucleusAbility("DirectDamage", 362969, 6)               -- Azure Strike (Check spell ID, as it could also be 355627)
  registerNucleusAbility("GroundDirectDamage", 369374, 8)         -- Firestorm (Check spell ID; Should be GroundMultipleDirectDamage?)
  registerNucleusAbility("GroundDirectDamage", 353759, 12)        -- Deep Breath (Check spell ID; Range? Spell range is listed 20-50y)
  -- Preservation

  -- Hunter
  -- Commons
  registerNucleusAbility("DirectDamage", 171454, 8)               -- Chimaera Shot 1
  registerNucleusAbility("DirectDamage", 171457, 8)               -- Chimaera Shot 2
  -- Beast Mastery
  registerNucleusAbility("DirectDamage", 118459, 10)              -- Beast Cleave
  registerNucleusAbility("DirectDamage", 2643, 8)                 -- Multi-Shot
  registerNucleusAbility("DirectDamage", 201754, 8)               -- Stomp
  -- Marksmanship
  registerNucleusAbility("DirectDamage", 257620, 10)              -- Multi-Shot
  registerNucleusAbility("GroundDirectDamage", 260247, 8)         -- Volley
  registerNucleusAbility("DirectDamage", 212680, 8)               -- ExplosiveShot
  -- Survival
  registerNucleusAbility("DirectDamage", 212436, 8)               -- Butchery
  registerNucleusAbility("DirectDamage", 187708, 8)               -- Carve
  registerNucleusAbility("DirectDamage", 259495, 8)               -- Bombs 1
  registerNucleusAbility("DirectDamage", 270335, 8)               -- Bombs 2
  registerNucleusAbility("DirectDamage", 270323, 8)               -- Bombs 3
  registerNucleusAbility("DirectDamage", 271045, 8)               -- Bombs 4

  -- Mage
  -- Arcane
  registerNucleusAbility("DirectDamage", 1449, 10)                -- Arcane Explosion
  registerNucleusAbility("DirectDamage", 44425, 10)               -- Arcane Barrage
  -- Fire
  registerNucleusAbility("DirectDamage", 157981, 8)               -- Blast Wave
  --RegisterNucleusAbility("GroundMultipleDirectDamage", 153561, 8) -- Meteor
  registerNucleusAbility("DirectDamage", 31661, 8)                -- Dragon's Breath
  registerNucleusAbility("DirectDamage", 44457, 10)               -- Living Bomb
  registerNucleusAbility("GroundDirectDamage", 2120, 8)           -- Flamestrike
  registerNucleusAbility("DirectDamage", 257542, 8)               -- Phoenix Flames
  --RegisterNucleusAbility("TO_INVESTIGATE", 12654, 8)            -- AoE Ignite
  -- Frost
  registerNucleusAbility("GroundDirectDamage", 84721, 8)          -- Frozen Orb
  registerNucleusAbility("GroundDirectDamage", 190357, 8)         -- Blizzard
  registerNucleusAbility("DirectDamage", 153596, 6)               -- Comet Storm
  registerNucleusAbility("DirectDamage", 120, 12)                 -- Cone of Cold
  registerNucleusAbility("DirectDamage", 228600, 8)               -- Glacial Spike
  registerNucleusAbility("DirectDamage", 148022, 8)               -- Icicle
  registerNucleusAbility("DirectDamage", 228598, 8)               -- Ice Lance
  registerNucleusAbility("DirectDamage", 122, 12)                 -- Frost Nova
  registerNucleusAbility("DirectDamage", 157997, 8)               -- Ice Nova

  -- Monk
  -- Brewmaster
  -- Windwalker
  registerNucleusAbility("DirectDamage", 113656, 8)               -- Fists of Fury
  registerNucleusAbility("DirectDamage", 101546, 8)               -- Spinning Crane Kick
  registerNucleusAbility("DirectDamage", 261715, 8)               -- Rushing Jade Wind
  registerNucleusAbility("DirectDamage", 152175, 8)               -- Whirling Dragon Punch

  -- Paladin
  -- Commons
  --RegisterNucleusAbility("GroundMultipleDirectDamage", 81297, 8) -- Consecration
  -- Holy
  -- Protection
  --RegisterNucleusAbility("GroundMultipleDirectDamage", 204301, 8) -- Blessed Hammer (Usable? Spirals outward from caster)
  registerNucleusAbility("DirectDamage", 53600, 6)       -- Shield of the Righteous
  -- Retribution
  registerNucleusAbility("DirectDamage", 53385, 8)          -- Divine Storm
  registerNucleusAbility("GroundDirectDamage", 81297, 8)    -- Consecration
  registerNucleusAbility("GroundDirectDamage", 343721, 8)   -- Final Reckoning
  registerNucleusAbility("DirectDamage", 385816, 8)         -- Incandescence

  -- Priest
  -- Discipline
  -- Holy
  -- Shadow
  registerNucleusAbility("DirectDamage", 205386, 8)               -- Shadow Crash
  registerNucleusAbility("DirectDamage", 228360, 10)              -- Void Eruption 1
  registerNucleusAbility("DirectDamage", 228361, 10)              -- Void Eruption 2
  registerNucleusAbility("DirectDamage", 394979, 10)              -- Mind Sear (Void Lasher)
  registerNucleusAbility("DirectDamage", 373279, 10)              -- Void Spike (Thing From Beyond)

  -- Rogue
  -- Assassination
  registerNucleusAbility("DirectDamage", 121411, 10)              -- Crimson Tempest
  registerNucleusAbility("DirectDamage", 51723, 10)               -- Fan of Knives
  registerNucleusAbility("DirectDamage", 255546, 6)               -- Poison Bomb
  -- Outlaw
  registerNucleusAbility("DirectDamage", 22482, 6)                -- Blade Flurry
  registerNucleusAbility("DirectDamage", 271881, 8)               -- Blade Rush
  -- Subtlety
  registerNucleusAbility("DirectDamage", 197835, 10)              -- Shuriken Storm
  registerNucleusAbility("DirectDamage", 282449, 10)              -- Secret Technique
  registerNucleusAbility("DirectDamage", 319175, 10)              -- Black Powder

  -- Shaman
  -- Elemental
  registerNucleusAbility("DirectDamage", 188443, 10)              -- Chain Lightning
  registerNucleusAbility("DirectDamage", 77478, 8)                -- Earthquake
  registerNucleusAbility("DirectDamage", 192231, 8)               -- Liquid Magma Totem
  -- Enhancement
  registerNucleusAbility("DirectDamage", 187874, 8)               -- Crash Lightning
  registerNucleusAbility("DirectDamage", 197214, 11)              -- Sundering
  -- Restoration

  -- Warlock
  -- Afflication
  registerNucleusAbility("DirectDamage", 27285, 10)               -- Seed Explosion
  -- Demonology
  registerNucleusAbility("DirectDamage", 89753, 8)                -- Felstorm (Felguard)
  registerNucleusAbility("GroundDirectDamage", 386609, 8)         -- Guillotine's Fel Explosion
  registerNucleusAbility("DirectDamage", 86040, 8)                -- Hand of Gul'dan
  registerNucleusAbility("DirectDamage", 196278, 8)               -- Implosion
  -- Destruction
  registerNucleusAbility("GroundDirectDamage", 152108, 8)         -- Cataclysm
  registerNucleusAbility("DirectDamage", 387547, 8)               -- Cry Havoc
  --RegisterNucleusAbility("GroundMultipleDirectDamage", 42223, 8)  -- Rain of Fire
  registerNucleusAbility("GroundDirectDamage", 42223, 8)          -- Rain of Fire (temp, since Destruction has very few AoEs)
  registerNucleusAbility("GroundDirectDamage", 22703, 10)         -- Summon Infernal
  registerNucleusAbility("DirectDamage", 20153, 12)               -- Infernal/Blasphemy AoE Immolation pulse (not working... minion vs pet issue?)

  -- Warrior
  -- Commons
  registerNucleusAbility("GroundDirectDamage", 156287, 8)         -- Ravager
  registerNucleusAbility("DirectDamage", 396719, 8)               -- Thunder Clap
  registerNucleusAbility("DirectDamage", 384318, 12)              -- Thunderous Roar
  registerNucleusAbility("DirectDamage", 199658, 8)               -- Whirlwind
  -- Arms
  registerNucleusAbility("DirectDamage", 50622, 8)                -- Bladestorm
  registerNucleusAbility("DirectDamage", 845, 8)                  -- Cleave
  registerNucleusAbility("DirectDamage", 262161, 8)               -- Warbreaker
  registerNucleusAbility("DirectDamage", 1680, 8)                 -- Whirlwind
  -- Fury
  registerNucleusAbility("DirectDamage", 385061, 12)              -- Odyn's Fury
  registerNucleusAbility("DirectDamage", 385062, 12)              -- Odyn's Fury also (offhand?)
  -- Protection
  registerNucleusAbility("DirectDamage", 6572, 8)                 -- Revenge
  registerNucleusAbility("DirectDamage", 6343, 8)                 -- Thunder Clap
end

function splash.UnregisterNucleusAbilities()
  WR:PrintDebug("UnregisterNucleusAbilities")
  table.wipe(nucleusAbilities)
  table.wipe(trackerBuffer)
end

function unit:GetEnemiesInSplashRangeCount(radius)
  if not self:Exists() then return 0 end

  local guid = self:GUID()
  local enemiesByRadius = tracker[guid]
  if not enemiesByRadius then return 1 end

  local enemies = enemiesByRadius[radius]
  if enemies then
    local enemiesCount = 0
    for _, _ in pairs(enemies) do
      enemiesCount = enemiesCount + 1
    end

    return enemiesCount
  else
    local highestEnemiesCount = 1
    for trackerRadius, trackerEnemies in pairs(enemiesByRadius) do
      local enemiesCount = 0
      for _, _ in pairs(trackerEnemies) do
        enemiesCount = enemiesCount + 1
      end
      if trackerRadius < radius and enemiesCount > highestEnemiesCount then
        highestEnemiesCount = enemiesCount
      end
    end

    return highestEnemiesCount
  end
end

function unit:GetEnemiesInSplashRange(radius)
  if not self:Exists() then return {} end

  local guid = self:GUID()
  local enemiesByRadius = tracker[guid]
  local enemiesTable = {}
  if not enemiesByRadius then
    table.insert(enemiesTable, self)
    return enemiesTable
  end

  for trackerRadius, trackerEnemy in pairs(enemiesByRadius) do
    if trackerRadius <= radius then
      local farRange = self:MaxDistance() or 0
      farRange = farRange + radius
      if farRange < 5 then farRange = 5 end
      if farRange > 100 then farRange = 100 end
      for trackerGUID in pairs(trackerEnemy) do
        for unitObject, unitInfo in pairs(player:GetEnemiesInRange(farRange)) do
          if unitInfo.unitGUID == trackerGUID then table.insert(enemiesTable, unitInfo) end
        end
      end
    end
  end

  if #enemiesTable >= 1 then
    return enemiesTable
  end
  table.insert(enemiesTable, self)
  return enemiesTable
end

-- OnInit
splash.RegisterNucleusAbilities()
