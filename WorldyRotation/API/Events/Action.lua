local api = WR.api
local cache = WR.cache
local utils = WR.utils
local unit = api.unit

local actions = {} -- { [ActionSlot] = { Type, ID, SubType, Texture, Text, CommandName, HotKey } }
local actionSlotsBy = {
  item = {}, -- { [ItemID] = { [1] = ActionSlot, [2] = ActionSlot, [3] = ... } }
  macro = {}, -- { [MacroID] = { [1] = ActionSlot, [2] = ActionSlot, [3] = ... } }
  spell = {}, -- { [SpellID] = { [1] = ActionSlot, [2] = ActionSlot, [3] = ... } }
  text = {}, -- { [ActionText] = { [1] = ActionSlot, [2] = ActionSlot, [3] = ... } }
  texture = {}, -- { [TextureID] = { [1] = ActionSlot, [2] = ActionSlot, [3] = ... } }
}
local hotKeyWhitelist = {
  item = {}, -- { [ItemID] = HotKey }
  macro = {}, -- { [MacroID] = HotKey }
  spell = {}, -- { [SpellID] = HotKey }
  text = {}, -- { [ActionText] = HotKey }
  texture = {}, -- { [TextureID] = HotKey }
}
local action = {
  actions = actions,
  actionSlotsBy = actionSlotsBy,
  hotKeyWhitelist = hotKeyWhitelist,
}

api.action = action

-- See: http://wowwiki.wikia.com/wiki/ActionSlot
-- ActionSlot        ButtonBaseName               CommandName                    Page
-- 1..12           = ActionButton                 ACTIONBUTTON..ActionSlot       1
-- 13..24          = ActionButton                 NONE                           2
-- 25..36          = MultiBarRightButton          MULTIACTIONBAR3BUTTON..BarSlot /
-- 37..48          = MultiBarLeftButton           MULTIACTIONBAR4BUTTON..BarSlot /
-- 49..60          = MultiBarBottomRightButton    MULTIACTIONBAR2BUTTON..BarSlot /
-- 61..72          = MultiBarBottomLeftButton     MULTIACTIONBAR1BUTTON..BarSlot /
-- 73..84          = ActionButton                 NONE                           3
-- 85..16          = ActionButton                 NONE                           4
-- 97..108         = ActionButton                 NONE                           5
-- 109..120        = ActionButton                 NONE                           6
-- Where ActionSlot is in 1..132 and BarSlot is in 1..12 for MULTIACTIONBARs.
-- Technically, ACTIONBUTTON commands above 12 are not bindables by default (hence why Dominos use virtual bars for those).
-- We ignore Slots from 121 to 132 because these aren't controlled by the player (Possess bar).

local buttonByAddOn = {
  bartender = {
    [1] = { "BT4Button", "CLICK BT4Button%i:LeftButton" },
  },
  blizzard = {
    [1] = { "ActionButton", "ACTIONBUTTON%i" },
    [2] = { "ActionButton", nil },
    [3] = { "MultiBarRightButton", "MULTIACTIONBAR3BUTTON%i" },
    [4] = { "MultiBarLeftButton", "MULTIACTIONBAR4BUTTON%i" },
    [5] = { "MultiBarBottomRightButton", "MULTIACTIONBAR2BUTTON%i" },
    [6] = { "MultiBarBottomLeftButton", "MULTIACTIONBAR1BUTTON%i" },
    [7] = { "ActionButton", nil },
    [8] = { "ActionButton", nil },
    [9] = { "ActionButton", nil },
    [10] = { "ActionButton", nil },
  },
  dominos = {
    [1] = { "ActionButton", "ACTIONBUTTON%i" },
    [2] = { "DominosActionButton", "CLICK DominosActionButton%i:HOTKEY" },
    [3] = { "MultiBarRightButton", "MULTIACTIONBAR3BUTTON%i" },
    [4] = { "MultiBarLeftButton", "MULTIACTIONBAR4BUTTON%i" },
    [5] = { "MultiBarBottomRightButton", "MULTIACTIONBAR2BUTTON%i" },
    [6] = { "MultiBarBottomLeftButton", "MULTIACTIONBAR1BUTTON%i" },
    [7] = { "DominosActionButton", "CLICK DominosActionButton%i:HOTKEY" },
    [8] = { "DominosActionButton", "CLICK DominosActionButton%i:HOTKEY" },
    [9] = { "DominosActionButton", "CLICK DominosActionButton%i:HOTKEY" },
    [10] = { "DominosActionButton", "CLICK DominosActionButton%i:HOTKEY" },
  },
  elvUI = {
    [1] = { "ElvUI_Bar1Button", "ACTIONBUTTON%i" },
    [2] = { "ElvUI_Bar2Button", "ELVUIBAR2BUTTON%i" },
    [3] = { "ElvUI_Bar3Button", "MULTIACTIONBAR3BUTTON%i" },
    [4] = { "ElvUI_Bar4Button", "MULTIACTIONBAR4BUTTON%i" },
    [5] = { "ElvUI_Bar5Button", "MULTIACTIONBAR2BUTTON%i" },
    [6] = { "ElvUI_Bar6Button", "MULTIACTIONBAR1BUTTON%i" },
    [7] = { "ElvUI_Bar7Button", "ELVUIBAR7BUTTON%i" },
    [8] = { "ElvUI_Bar8Button", "ELVUIBAR8BUTTON%i" },
    [9] = { "ElvUI_Bar9Button", "ELVUIBAR9BUTTON%i" },
    [10] = { "ElvUI_Bar10Button", "ELVUIBAR10BUTTON%i" },
  },
} -- { [AddOn] = { [BarIndex] = { [1] = ButtonBaseName, [2] = CommandNameFormat } } }

local function GetBarInfo(actionSlot)
  local barIndex = math.ceil(actionSlot / 12)
  local barSlot = actionSlot % 12
  if barSlot == 0 then
    barSlot = 12
  end

  return barIndex, barSlot
end

local function GetButtonInfo(actionSlot, blizzard)
  local barIndex, barSlot = GetBarInfo(actionSlot)

  local buttonBaseName, buttonSlot
  if blizzard then
    -- Blizzard
    buttonBaseName = buttonByAddOn.blizzard[barIndex][1]

    if barIndex >= 3 or barIndex <= 6 then
      -- Bar 3 to 6: MultiBarXXXButton
      buttonSlot = barSlot
    else
      -- Bar 1 to 2 and 7 to 10: ActionButton
      buttonSlot = actionSlot
    end
  elseif _G.Bartender4 then
    -- Bartender
    buttonBaseName = buttonByAddOn.bartender[1][1]
    buttonSlot = actionSlot
  elseif _G.Dominos then
    -- Dominos
    buttonBaseName = buttonByAddOn.dominos[barIndex][1]

    if barIndex == 1 then
      -- Bar 1: ActionButton
      buttonSlot = actionSlot
    elseif barIndex >= 3 and barIndex <= 6 then
      -- Bar 3 to 6: MultiBarXXXButton
      buttonSlot = barSlot
    else
      -- Bar 2 and 7 to 10: DominosActionButton
      if barIndex == 2 then
        -- Bar 2: First slot is 1 instead of 13
        buttonSlot = actionSlot - 12
      else
        -- Bar 7 to 10: First slot is 13 instead of 73
        buttonSlot = actionSlot - 60
      end
    end
  elseif _G.ElvUI and _G.ElvUI[1].ActionBars then
    -- ElvUI
    buttonBaseName = buttonByAddOn.elvUI[barIndex][1]
    buttonSlot = barSlot
  else
    -- Blizzard
    buttonBaseName = buttonByAddOn.blizzard[barIndex][1]

    if barIndex >= 3 or barIndex <= 6 then
      -- Bar 3 to 6: MultiBarXXXButton
      buttonSlot = barSlot
    else
      -- Bar 1 to 2 and 7 to 10: ActionButton
      buttonSlot = actionSlot
    end
  end

  return buttonBaseName, buttonSlot
end

local function GetButtonNameFromActionSlot(actionSlot)
  local barIndex = GetBarInfo(actionSlot)
  local buttonBaseName, buttonSlot = GetButtonInfo(actionSlot)

  return buttonBaseName .. buttonSlot
end

local function UpdateElvUIPaging(class)
  for i = 1, 10 do
    local barNum = "bar" .. i
    local pagingString = _G.ElvUI[1].ActionBars.db[barNum].paging[class]
    if pagingString == "" or not pagingString then
      cache.persistent.elvUIPaging.pagingStrings[i] = nil
      for k, v in pairs(cache.persistent.elvUIPaging.pagingBars) do
        if v == i then
          cache.persistent.elvUIPaging.pagingBars[k] = nil
        end
      end
    end
    if pagingString and pagingString ~= "" and cache.persistent.elvUIPaging.pagingStrings[i] ~= pagingString then
      for match1 in (pagingString .. ";"):gmatch("(.-)" .. ";") do
        for match2 in (match1 .. " "):gmatch("(%d+)" .. " ") do
          if match2 then
            cache.persistent.elvUIPaging.pagingStrings[i] = pagingString
            cache.persistent.elvUIPaging.pagingBars[tonumber(match2)] = i
          end
        end
      end
    end
  end
end

local function GetCommandNameFromActionSlot(actionSlot, blizzard)
  local barIndex = GetBarInfo(actionSlot)
  local _, buttonSlot = GetButtonInfo(actionSlot)

  local commandNameFormat
  if blizzard then
    _, buttonSlot = GetButtonInfo(actionSlot, true)
    if (GetBonusBarOffset() > 0 and (barIndex < 3 or barIndex > 6) and (cache.persistent.player.class[1] == "Rogue" or cache.persistent.player.class[1] == "Druid")) then
      barIndex = 1
    end
    commandNameFormat = buttonByAddOn.blizzard[barIndex][2]
  elseif _G.Bartender4 then
    -- Bartender
    commandNameFormat = buttonByAddOn.bartender[1][2]
  elseif _G.Dominos then
    -- Dominos
    commandNameFormat = buttonByAddOn.dominos[barIndex][2]
  elseif _G.ElvUI and _G.ElvUI[1].ActionBars then
    -- ElvUI
    if _G.ElvUI[1].ActionBars.db then
      UpdateElvUIPaging(cache.persistent.player.class[2])
      if cache.persistent.elvUIPaging.pagingBars[barIndex] then
        barIndex = cache.persistent.elvUIPaging.pagingBars[barIndex]
      end
    end
    commandNameFormat = buttonByAddOn.elvUI[barIndex][2]
  else
    -- Blizzard
    if (GetBonusBarOffset() > 0 and (barIndex < 3 or barIndex > 6) and (cache.persistent.player.class[1] == "Rogue" or cache.persistent.player.class[1] == "Druid")) then
      barIndex = 1
    end
    commandNameFormat = buttonByAddOn.blizzard[barIndex][2]
  end

  -- Some actions cannot be binded, this is mostly the case for Blizzard bars.
  if commandNameFormat then
    return (commandNameFormat):format(buttonSlot)
  end

  return nil
end

local function AddActionSlotsByValue(type, identifier, actionSlot)
  local actionSlots = actionSlotsBy[type][identifier]
  if not actionSlots then
    actionSlots = {}
    actionSlotsBy[type][identifier] = actionSlots
  end

  table.insert(actionSlots, actionSlot)
end

local function RemoveActionSlotsByValue(type, identifier, actionSlot)
  local actionSlots = actionSlotsBy[type][identifier]
  table.remove(actionSlots, utils.IndexOfValueInArray(actionSlots, actionSlot))
end

local function ClearAction(actionSlot)
  local prevAction = actions[actionSlot]
  if not prevAction then
    return
  end

  local actionType, actionID = prevAction.type, prevAction.id
  local actionText = prevAction.text
  local actionTexture = prevAction.texture

  if actionTexture then
    RemoveActionSlotsByValue("texture", actionTexture, actionSlot)
  end

  if actionText then
    RemoveActionSlotsByValue("text", actionText, actionSlot)
  end

  if actionID then
    if actionType == "spell" then
      RemoveActionSlotsByValue("spell", actionID, actionSlot)
    elseif actionType == "item" then
      RemoveActionSlotsByValue("item", actionID, actionSlot)
    elseif actionType == "macro" then
      RemoveActionSlotsByValue("macro", actionID, actionSlot)
    end
  end

  actions[actionSlot] = nil
end

local function UpdateAction(actionSlot)
  -- Prevent update for other actions than the one from ability bars.
  if not actionSlot or actionSlot <= 0 or actionSlot > 120 then
    return
  end

  -- Clear the action info cached from the previous update.
  ClearAction(actionSlot)

  -- Prevent any update if the slot is empty.
  if not HasAction(actionSlot) then
    return
  end

  -- Update the action info.
  local actionType, actionID, actionSubType = GetActionInfo(actionSlot)
  if actionID then
    if actionType == "spell" then
      AddActionSlotsByValue("spell", actionID, actionSlot)
    elseif actionType == "item" then
      AddActionSlotsByValue("item", actionID, actionSlot)
    elseif actionType == "macro" then
      AddActionSlotsByValue("macro", actionID, actionSlot)
    end
  end

  local actionTexture = GetActionTexture(actionSlot)
  if actionTexture then
    AddActionSlotsByValue("texture", actionTexture, actionSlot)
  end

  local actionText = GetActionText(actionSlot)
  if actionText then
    AddActionSlotsByValue("text", actionText, actionSlot)
  end

  local commandName = GetCommandNameFromActionSlot(actionSlot)
  local hotKey = (commandName and GetBindingKey(commandName)) or nil

  if hotKey == nil then
    commandName = GetCommandNameFromActionSlot(actionSlot, true)
    hotKey = (commandName and GetBindingKey(commandName)) or nil
  end

  actions[actionSlot] = {
    slot = actionSlot,
    type = actionType,
    id = actionID,
    subType = actionSubType,
    texture = actionTexture,
    text = actionText,
    commandName = commandName,
    hotKey = hotKey
  }
end

api:RegisterForEvent(function(event, actionSlot)
  UpdateAction(actionSlot)
end, "ACTIONBAR_SLOT_CHANGED")

api:RegisterForEvent(
    function()
      for i = 1, 120 do
        UpdateAction(i)
      end
    end,
    "ZONE_CHANGED_NEW_AREA", "PLAYER_SPECIALIZATION_CHANGED", "PLAYER_TALENT_UPDATE", "UPDATE_BINDINGS", "LEARNED_SPELL_IN_TAB", "SPELL_UPDATE_ICON", "UPDATE_SHAPESHIFT_FORM", "ACTIONBAR_UPDATE_USABLE"
)

local function FindAction(type, identifier)
  local actionSlots = actionSlotsBy[type][identifier]
  if not actionSlots then
    return
  end

  -- If stealthed Rogue or form-shifted Druid, return the appropriate slot. Otherwise, return the first.
  local actionSlot
  local bonusBarOffset = GetBonusBarOffset()
  if (bonusBarOffset > 0 and (cache.persistent.player.class[1] == "Rogue" or cache.persistent.player.class[1] == "Druid")) then
    for k, v in pairs(actionSlots) do
      local low = (1 + (NUM_ACTIONBAR_PAGES + bonusBarOffset - 1) * NUM_ACTIONBAR_BUTTONS)
      local high = ((NUM_ACTIONBAR_PAGES + bonusBarOffset) * NUM_ACTIONBAR_BUTTONS)
      if v >= low and v <= high then
        actionSlot = actionSlots[k]
      end
    end
    -- Just in case the above couldn't find a slot, return the first slot in the array, unless it's on bar1.
    if not actionSlot then
      if #actionSlots == 1 then
        actionSlot = actionSlots[1]
      else
        for k, v in pairs(actionSlots) do
          if v > 12 then
            actionSlot = actionSlots[k]
            break
          end
        end
      end
    end
    if not actionSlot then
      actionSlot = actionSlots[1]
    end
  else
    actionSlot = actionSlots[1]
  end
  if actionSlot then
    return actions[actionSlot]
  end
end

function action.FindByItemID(itemID)
  return FindAction("item", itemID)
end

function action.FindByMacroID(macroID)
  return FindAction("macro", macroID)
end

function action.FindBySpellID(spellID)
  return FindAction("spell", spellID)
end

function action.FindByText(text)
  return FindAction("text", text)
end

function action.FindByTextureID(textureID)
  return FindAction("texture", textureID)
end

do
  local function WhitelistHotKey(type, identifier, hotKey)
    hotKeyWhitelist[type][identifier] = hotKey
  end

  function action.WhitelistItemHotKey(itemID, hotKey)
    WhitelistHotKey("item", itemID, hotKey)
  end

  function action.WhitelistMacroHotKey(macroID, hotKey)
    WhitelistHotKey("macro", macroID, hotKey)
  end

  function action.WhitelistSpellHotKey(spellID, hotKey)
    WhitelistHotKey("spell", spellID, hotKey)
  end

  function action.WhitelistTextHotKey(text, hotKey)
    WhitelistHotKey("text", text, hotKey)
  end

  function action.WhitelistTextureHotKey(textureID, hotKey)
    WhitelistHotKey("texture", textureID, hotKey)
  end
end

do
  local function HotKey(type, identifier)
    local whitelistedHotKey = hotKeyWhitelist[type][identifier]
    if whitelistedHotKey then
      return whitelistedHotKey
    end

    local thisAction = FindAction(type, identifier)
    if thisAction then
      return thisAction.HotKey
    end

    return nil
  end

  function action.ItemHotKey(itemID)
    return HotKey("item", itemID)
  end

  function action.MacroHotKey(macroID)
    return HotKey("macro", macroID)
  end

  function action.SpellHotKey(spellID)
    return HotKey("spell", spellID)
  end

  function action.TextHotKey(text)
    return HotKey("text", text)
  end

  function action.TextureHotKey(textureID)
    return HotKey("texture", textureID)
  end
end

function unit:IsItemInActionRange(thisItem)
  local itemID = thisItem:ID()
  local thisAction = action.FindByItemID(itemID)
  if not thisAction then
    return false
  end

  return self:IsActionInRange(action.slot)
end

function unit:IsSpellInActionRange(thisSpell)
  local spellID = thisSpell:ID()
  local thisAction = action.FindBySpellID(spellID)
  if not thisAction then
    return false
  end

  return self:IsActionInRange(thisAction.slot)
end
