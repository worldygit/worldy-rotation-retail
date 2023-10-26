local api = WR.api
local unit = api.unit
local player = unit.player
local target = unit.target
local spell = api.spell

do
  local activeMitigationSpells = {
    buff = {
      -- PR Legion
      spell(191941), -- Darkstrikes (VotW - 1st)
      spell(204151), -- Darkstrikes (VotW - 1st)
      -- T20 ToS
      spell(239932) -- Felclaws (KJ)
    },
    debuff = {}, -- TODO ?
    cast = {
      -- PR Legion
      197810, -- Wicked Slam (ARC - 3rd)
      197418, -- Vengeful Shear (BRH - 2nd)
      198079, -- Hateful Gaze (BRH - 3rd)
      214003, -- Coup de Grace (BRH - Trash)
      235751, -- Timber Smash (CotEN - 1st)
      193668, -- Savage Blade (HoV - 4th)
      227493, -- Mortal Strike (LOWR - 4th)
      228852, -- Shared Suffering (LOWR - 4th)
      193211, -- Dark Slash (MoS - 1st)
      200732, -- Molten Crash (NL - 4th)
      -- T20 ToS
      241635, -- Hammer of Creation (Maiden)
      241636, -- Hammer of Obliteration (Maiden)
      236494, -- Desolate (Avatar)
      239932, -- Felclaws (KJ)
      -- T21 Antorus
      254919, -- Forging Strike (Kin'garoth)
      244899, -- Fiery Strike (Coven)
      245458, -- Foe Breaker (Aggramar)
      248499, -- Sweeping Scythe (Argus)
      258039, -- Deadly Scythe (Argus)
      -- T29 VotI
      376279, -- Concussive Slam (Terros)
      372056, -- Crush (Primal Council)
      375580, -- Zephyr Slam (Dathea)
      390548, -- Sundering Strike (Kurog)
      375870, -- Mortal Stoneclaws (Broodkeeper)
      377658, -- Electrified Jaws (Raszageth)
    },
    channel = {} -- TODO ?
  }
  -- TODO: Update
  function player:ActiveMitigationNeeded()
    if not player:IsTanking(target) then return false end

    -- Check casts
    if activeMitigationSpells.cast[target:CastSpellID()] then
      return true
    end

    -- Check buffs
    for i = 1, #activeMitigationSpells.buff do
      if target:BuffUp(activeMitigationSpells.buff[i], true) then
        return true
      end
    end

    return false
  end
end

do
  local healingAbsorbedSpells = {
    debuff = {
      -- T21 Antorus
      spell(243961) -- Misery (Varimathras)
    }
  }
  function player:HealingAbsorbed()
    for i = 1, #healingAbsorbedSpells.debuff do
      if player:DebuffUp(healingAbsorbedSpells.debuff[i], true) then
        return true
      end
    end

    return false
  end
end
