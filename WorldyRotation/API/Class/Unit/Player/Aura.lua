local api = WR.api
local unit = api.unit
local player = unit.player
local spell = api.spell

do
  local stealthSpellsByType = {
    {
      -- Rogue
      spell(1784), -- Stealth
      spell(115191), -- Stealth w/ Subterfuge Talent
      spell(11327), -- Vanish
      spell(115193), -- Vanish w/ Subterfuge Talent
      -- Feral
      spell(5215) -- Prowl
    },
    -- Combat Stealth
    {
      -- Rogue
      spell(115192), -- Subterfuge Buff
      spell(185422), -- Stealth from Shadow Dance
      -- Druid
      spell(102543) -- Incarnation: King of the Jungle
    },
    -- Special Stealth
    {
      -- Rogue
      spell(375939), -- Sepsis stance mask buff
      -- Night Elf
      spell(58984) -- Shadowmeld
    }
  }

  function player:StealthRemains(checkCombat, checkSpecial, bypassRecovery)
    if spell.rogue then
      if (checkCombat and (spell.rogue.commons.shadowDance:TimeSinceLastCast() < 0.3 or spell.rogue.commons.vanish:TimeSinceLastCast() < 0.3))
        or (checkSpecial and spell.rogue.commons.shadowmeld:TimeSinceLastCast() < 0.3) then
          return 1
      end
    end

    if spell.druid then
      local feral = spell.druid.feral

      if feral then
        if (checkCombat and feral.incarnation:TimeSinceLastCast() < 0.3)
          or (checkSpecial and feral.shadowmeld:TimeSinceLastCast() < 0.3) then
          return 1
        end
      end
    end

    for i = 1, #stealthSpellsByType do
      if i == 1 or (i == 2 and checkCombat) or (i == 3 and checkSpecial) then
        local stealthSpells = stealthSpellsByType[i]
        for j = 1, #stealthSpells do
          local stealthSpell = stealthSpells[j]
          if player:BuffUp(stealthSpell, nil, bypassRecovery) then
            return player:BuffRemains(stealthSpell, nil, bypassRecovery)
          end
        end
      end
    end

    return 0
  end

  function player:StealthUp(checkCombat, checkSpecial, bypassRecovery)
    return self:StealthRemains(checkCombat, checkSpecial, bypassRecovery) > 0
  end

  function player:StealthDown(checkCombat, checkSpecial, bypassRecovery)
    return not self:StealthUp(checkCombat, checkSpecial, bypassRecovery)
  end
end
