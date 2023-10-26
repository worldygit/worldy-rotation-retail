local api = WR.api
local cache = WR.cache
local unit = api.unit
local player = unit.player
local spell = api.spell

local function BookScan(blankScan)
  -- Pet Book
  do
    local numPetSpells = HasPetSpells()
    if numPetSpells then
      local spellLearned = cache.persistent.spellLearned.pet
      for i = 1, numPetSpells do
        local currentSpellID = select(7, GetSpellInfo(i, BOOKTYPE_PET))
        if currentSpellID then
          local currentSpell = spell(currentSpellID, "Pet")
          if currentSpell:IsAvailable(true) and (currentSpell:IsKnown(true) or IsTalentSpell(i, BOOKTYPE_PET)) then
            if not blankScan then
              spellLearned[currentSpell:ID()] = true
            end
          end
        end
      end
    end
  end
  -- Player Book
  do
    local spellLearned = cache.persistent.spellLearned.player

    for i = 1, GetNumSpellTabs() do
      local offset, numSpells, _, offSpec = select(3, GetSpellTabInfo(i))
      if offSpec == 0 then
        for j = 1, (offset + numSpells) do
          local currentSpellID = select(7, GetSpellInfo(j, BOOKTYPE_SPELL))
          if currentSpellID and GetSpellBookItemInfo(j, BOOKTYPE_SPELL) == "SPELL" then
            if not blankScan then
              spellLearned[currentSpellID] = true
            end
          end
        end
      end
    end

    -- Flyout Spells
    for i = 1, GetNumFlyouts() do
      local flyoutID = GetFlyoutID(i)
      local numSlots, isKnown = select(3, GetFlyoutInfo(flyoutID))
      if isKnown and numSlots > 0 then
        for j = 1, numSlots do
          local currentSpellID, _, isKnownSpell = GetFlyoutSlotInfo(flyoutID, j)
          if currentSpellID and isKnownSpell then
            spellLearned[currentSpellID] = true
          end
        end
      end
    end
  end
end

local function BlankBookScan ()
  BookScan(true)
end

api.combatStarted = 0
api.combatEnded = 1

api:RegisterForEvent(
    function()
      api.combatStarted = GetTime()
      api.combatEnded = 0
    end,
    "PLAYER_REGEN_DISABLED"
)

api:RegisterForEvent(
    function()
      api.combatStarted = 0
      api.combatEnded = GetTime()
    end,
    "PLAYER_REGEN_ENABLED"
)

api:RegisterForEvent(
    function(event, prefix, message)
      if prefix == "D4" and string.find(message, "PT") then
        api.bossModTime = tonumber(string.sub(message, 4, 5))
        api.bossModEndTime = GetTime() + api.bossModTime
      elseif prefix == "BigWigs" and string.find(message, "Pull") then
        api.bossModTime = tonumber(string.sub(message, 8, 9))
        api.bossModEndTime = GetTime() + api.bossModTime
      end
    end,
    "CHAT_MSG_ADDON"
)

api:RegisterForEvent(
    function(event, arg1)
      if event == "PLAYER_SPECIALIZATION_CHANGED" and arg1 ~= "player" then
        return
      end

      cache.persistent.player.class = { UnitClass("player") }
      cache.persistent.player.spec = { GetSpecializationInfo(GetSpecialization()) }

      table.wipe(cache.persistent.texture.spell)
      table.wipe(cache.persistent.texture.item)

      player:UpdateEquipment()

      if event == "PLAYER_SPECIALIZATION_CHANGED" then
        local updateOverrides
        updateOverrides = function()
          if cache.persistent.player.spec[1] ~= nil then
            api.LoadRestores()
            api.LoadOverrides(cache.persistent.player.spec[1])
          else
            C_Timer.After(2, updateOverrides)
          end
        end
        updateOverrides()
      end

      if event == "PLAYER_SPECIALIZATION_CHANGED" or event == "PLAYER_TALENT_UPDATE" or event == "TRAIT_CONFIG_UPDATED" then
        UpdateTalents = function()
          wipe(cache.persistent.talents)
          local talentConfigID = C_ClassTalents.GetActiveConfigID()
          local talentConfigInfo
          if talentConfigID then
            talentConfigInfo = C_Traits.GetConfigInfo(talentConfigID)
          end
          if talentConfigID ~= nil and talentConfigInfo ~= nil then
            local talentTreeIDs = talentConfigInfo["treeIDs"]
            for i = 1, #talentTreeIDs do
              local nodes = C_Traits.GetTreeNodes(talentTreeIDs[i])
              for j = 1, #nodes do
                local nodeID = nodes[j]
                local nodeInfo = C_Traits.GetNodeInfo(talentConfigID, nodeID)
                local activeTalent = nodeInfo.activeEntry
                local talentRank = nodeInfo.activeRank
                if (activeTalent and talentRank > 0) then
                  local talentEntryID = activeTalent.entryID
                  local talentEntryInfo = C_Traits.GetEntryInfo(talentConfigID, talentEntryID)
                  local definitionID = talentEntryInfo["definitionID"]
                  local definitionInfo = C_Traits.GetDefinitionInfo(definitionID)
                  local spellID = definitionInfo["spellID"]
                  cache.persistent.talents[spellID] = (cache.persistent.talents[spellID]) and (cache.persistent.talents[spellID] + talentRank) or talentRank
                end
              end
            end
          else
            C_Timer.After(2, UpdateTalents)
          end
        end
        UpdateTalents()
      end
    end,
    "PLAYER_LOGIN", "ZONE_CHANGED_NEW_AREA", "PLAYER_SPECIALIZATION_CHANGED", "PLAYER_TALENT_UPDATE", "PLAYER_EQUIPMENT_CHANGED", "TRAIT_CONFIG_UPDATED"
)

api:RegisterForEvent(
    function(event, arg1)
      player:Cache()
      -- TODO: fix timing issue via event?
      C_Timer.After(3, function()
        player:Cache()
      end)
    end,
    "PLAYER_LOGIN"
)

api:RegisterForEvent(
    function(event, arg1)
      if event == "PLAYER_SPECIALIZATION_CHANGED" and arg1 ~= "player" then
        return
      end

      -- FIXME: workaround to prevent Lua errors when Blizz do some shenanigans with book in Arena/Timewalking
      if pcall(BlankBookScan) then
        wipe(cache.persistent.bookIndex.player)
        wipe(cache.persistent.bookIndex.pet)
        wipe(cache.persistent.spellLearned.player)
        wipe(cache.persistent.spellLearned.pet)
        BookScan()
      end
    end,
    "SPELLS_CHANGED", "LEARNED_SPELL_IN_TAB", "SKILL_LINES_CHANGED", "PLAYER_GUILD_UPDATE", "PLAYER_SPECIALIZATION_CHANGED", "USE_GLYPH", "CANCEL_GLYPH_CAST", "ACTIVATE_GLYPH"
)

api.unitNotInFront = player
api.unitNotInFrontTime = 0
api.lastUnitCycled = player
api.lastUnitCycledTime = 0
api:RegisterForEvent(
    function(event, messageType, message)
      if messageType == 50 and message == SPELL_FAILED_UNIT_NOT_INFRONT then
        api.unitNotInFront = api.lastUnitCycled
        api.unitNotInFrontTime = api.lastUnitCycledTime
      end
    end,
    "UI_ERROR_MESSAGE"
)
