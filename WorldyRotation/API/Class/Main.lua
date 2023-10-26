local api = WR.api
local dbc = WR.dbc

local function Class()
  local class = {}
  class.__index = class
  setmetatable(class, {
    __call = function(self, ...)
      local object = {}
      setmetatable(object, self)
      object:New(...)
      return object
    end
  })
  return class
end

--- ======= UNIT =======
do
  local unit = Class()
  api.unit = unit
  function unit:New(unitID, useCache)
    if type(unitID) ~= "string" then
      error("Invalid unitID.")
    end
    self.unitID = unitID
    self.useCache = useCache or false
    self:Init()
  end

  local unitGUIDMap = {}
  api.unitGUIDMap = unitGUIDMap
  function unit:RemoveUnitGUIDMapEntry()
    if unitGUIDMap[self.unitGUID] and unitGUIDMap[self.unitGUID][self.unitID] then
      unitGUIDMap[self.unitGUID][self.unitID] = nil;
      if next(unitGUIDMap[self.unitGUID]) == nil then
        unitGUIDMap[self.unitGUID] = nil
      end
    end
  end

  function unit:AddUnitGUIDMapEntry()
    if not self.unitGUID or not self.unitID then
      return
    end
    if not unitGUIDMap[self.unitGUID] then
      unitGUIDMap[self.unitGUID] = {}
    end
    if not unitGUIDMap[self.unitGUID][self.unitID] then
      unitGUIDMap[self.unitGUID][self.unitID] = self
    end
  end

  function unit:Init()
    self:RemoveUnitGUIDMapEntry()
    self.unitExists = false
    self.unitGUID = nil
    self.unitNPCID = nil
    self.unitName = nil
    self.unitCanBeAttacked = false
  end

  -- Unique Units
  unit.player = unit("player", true)
  unit.pet = unit("pet")
  unit.target = unit("target", true)
  unit.focus = unit("focus", true)
  unit.mouseover = unit("mouseover")
  unit.vehicle = unit("vehicle")
  -- Iterable Units
  local unitIDs = {
    -- Type,        Count,      UseCache
    { "arena", 5, true },
    { "boss", 4, true },
    { "nameplate", 40, true },
    { "party", 4, true },
    { "raid", 40, true }
  }
  for i = 1, #unitIDs do
    local unitID = unitIDs[i]
    local unitType = unitID[1]
    local unitCount = unitID[2]
    local unitUseCache = unitID[3]
    unit[unitType] = {}
    for j = 1, unitCount do
      local unitKey = string.format("%s%d", unitType, j)
      unit[unitType][unitKey] = unit(unitKey, unitUseCache)
    end
  end
end

--- ======= SPELL =======
do
  local spell = Class()
  api.spell = spell
  function spell:New(spellID, spellType)
    if type(spellID) ~= "number" then
      error("Invalid spellID.")
    end
    if spellType and type(spellType) ~= "string" then
      error("Invalid spellType.")
    end

    local spellName, _, _, _, minimumRange, maximumRange = GetSpellInfo(spellID)
    self.spellID = spellID
    self.spellType = spellType or "player" -- For Pet, put "Pet". Default is "Player". Related to Cache.Persistent.SpellLearned.
    self.spellName = spellName
    self.minimumRange = minimumRange
    self.maximumRange = maximumRange
    self.isMelee = minimumRange == 0 and maximumRange == 0

    self.lastCastTime = 0
    self.lastDisplayTime = 0
    self.lastHitTime = 0
    self.lastAppliedOnPlayerTime = 0
    self.lastRemovedFromPlayerTime = 0
  end
end

-- TODO: Refactor to merge it into Spell
do
  local multiSpell = Class()
  api.multiSpell = multiSpell

  function multiSpell:New(...)
    local arg = { ... }
    self.spellTable = {}

    for _, spell in pairs(arg) do
      if type(spell) == "number" then
        spell = api.spell(spell)
      end
      if type(spell.spellID) ~= "number" then
        error("Invalid spellID.")
      end
      table.insert(self.spellTable, spell)
    end

    function multiSpell:Update()
      for i, spell in pairs(self.spellTable) do
        if spell:IsLearned() or (i == #self.spellTable) then
          spell.Update = self.Update
          setmetatable(self, { __index = spell })
          break
        end
      end
    end

    self:AddToMultiSpells()
    self:Update()
  end
end

--- ======= ITEM =======
do
  local itemSlotTable = {
    -- Source: http://wowwiki.wikia.com/wiki/ItemEquipLoc
    [""] = nil, -- "" value is the value of ItemEquipLoc if not equippable
    ["INVTYPE_AMMO"] = { 0 },
    ["INVTYPE_HEAD"] = { 1 },
    ["INVTYPE_NECK"] = { 2 },
    ["INVTYPE_SHOULDER"] = { 3 },
    ["INVTYPE_BODY"] = { 4 },
    ["INVTYPE_CHEST"] = { 5 },
    ["INVTYPE_ROBE"] = { 5 },
    ["INVTYPE_WAIST"] = { 6 },
    ["INVTYPE_LEGS"] = { 7 },
    ["INVTYPE_FEET"] = { 8 },
    ["INVTYPE_WRIST"] = { 9 },
    ["INVTYPE_HAND"] = { 10 },
    ["INVTYPE_FINGER"] = { 11, 12 },
    ["INVTYPE_TRINKET"] = { 13, 14 },
    ["INVTYPE_CLOAK"] = { 15 },
    ["INVTYPE_WEAPON"] = { 16, 17 },
    ["INVTYPE_SHIELD"] = { 17 },
    ["INVTYPE_2HWEAPON"] = { 16 },
    ["INVTYPE_WEAPONMAINHAND"] = { 16 },
    ["INVTYPE_WEAPONOFFHAND"] = { 17 },
    ["INVTYPE_HOLDABLE"] = { 17 },
    ["INVTYPE_RANGED"] = { 18 },
    ["INVTYPE_THROWN"] = { 18 },
    ["INVTYPE_RANGEDRIGHT"] = { 18 },
    ["INVTYPE_RELIC"] = { 18 },
    ["INVTYPE_TABARD"] = { 19 },
    ["INVTYPE_BAG"] = { 20, 21, 22, 23 },
    ["INVTYPE_QUIVER"] = { 20, 21, 22, 23 },
  }

  local item = Class()
  api.item = item

  function item:New(itemID, itemSlotIDs)
    if type(itemID) ~= "number" then
      error("Invalid itemID.")
    end
    if itemSlotIDs and type(itemSlotIDs) ~= "table" then
      error("Invalid itemSlotIDs.")
    end

    local itemName, _, itemRarity, itemLevel, itemMinLevel, _, _, _, itemEquipLoc = GetItemInfo(itemID)
    self.itemID = itemID
    self.itemName = itemName
    self.itemRarity = itemRarity
    self.itemLevel = itemLevel
    self.itemMinLevel = itemMinLevel
    self.itemSlotIDs = itemSlotIDs or itemSlotTable[itemEquipLoc]
    self.itemUseSpell = dbc.itemSpell[itemID] and api.spell(dbc.itemSpell[itemID]) or nil

    self.lastDisplayTime = 0
    self.lastHitTime = 0
  end

  api.item.healthstone = item(5512)
end

--- ======= Macro =======
do
  local macro = Class()
  api.macro = macro

  function macro:New(macroID, macroText)
    if type(macroID) ~= "string" then
      error("Invalid macroID.")
    end
    if type(macroText) ~= "string" then
      error("Invalid macroText.")
    end

    -- Attributes
    self.macroID = macroID
    self.macroText = macroText
  end

  -- focus
  local focus = {}
  focus["focusplayer"] = macro("focusplayer", "/focus player")
  focus["focustarget"] = macro("focustarget", "/focus target")
  for i = 1, 4 do
    local id = string.format("%s%d", "party", i)
    local key = string.format("%s%s", "focus", id)
    local value = string.format("/%s %s", "focus", id)
    focus[key] = macro(key, value)
  end
  for i = 1, 40 do
    local id = string.format("%s%d", "raid", i)
    local key = string.format("%s%s", "focus", id)
    local value = string.format("/%s %s", "focus", id)
    focus[key] = macro(key, value)
  end
  api.macro.focus = focus

  function macro:BindFocus()
    for _, m in pairs(focus) do
      api.Bind(m)
    end
  end

  -- item
  local item = {}
  item.trinket1 = macro("trinket1", "/use 13")
  item.trinket2 = macro("trinket2", "/use 14")
  item.healthstone = macro("healthstone", "/use item:5512")
  api.macro.item = item

  function macro:BindItems()
    for _, m in pairs(item) do
      api.Bind(m)
    end
  end
end
