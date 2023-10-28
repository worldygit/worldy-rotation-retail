local api = WR.api
local dbc = WR.dbc
local cache = WR.cache
local item = api.item
local unit = api.unit
local player = unit.player

function item:ID()
  return self.itemID
end

function item:Name()
  return self.itemName
end

-- Item Rarity
-- 0 = Poor
-- 1 = Common
-- 2 = Uncommon
-- 3 = Rare
-- 4 = Epic
-- 5 = Legendary
-- 6 = Artifact
-- 7 = Heirloom
-- 8 = WoW Token
function item:Rarity()
  return self.itemRarity
end

function item:Level()
  return self.itemLevel
end

function item:MinLevel()
  return self.itemMinLevel
end

function item:SlotIDs()
  return self.itemSlotIDs
end

function item:InfoByID()
  return GetItemInfo(self:ID())
end

-- Get the item Info from the item Name.
function item:InfoByName()
  return GetItemInfo(self:Name())
end

function item:IsLegendary()
  return self.itemRarity == 5
end

function item:Exists()
  return GetItemCount(self:ID()) > 0
end

function item:IsUsable()
  return IsUsableItem(self:ID())
end

function item:OnUseSpell()
  return self.itemUseSpell
end

-- Inventory slots
-- INVSLOT_HEAD       = 1
-- INVSLOT_NECK       = 2
-- INVSLOT_SHOULDAC   = 3
-- INVSLOT_BODY       = 4
-- INVSLOT_CHEST      = 5
-- INVSLOT_WAIST      = 6
-- INVSLOT_LEGS       = 7
-- INVSLOT_FEET       = 8
-- INVSLOT_WRIST      = 9
-- INVSLOT_HAND       = 10
-- INVSLOT_FINGAC1    = 11
-- INVSLOT_FINGAC2    = 12
-- INVSLOT_TRINKET1   = 13
-- INVSLOT_TRINKET2   = 14
-- INVSLOT_BACK       = 15
-- INVSLOT_MAINHAND   = 16
-- INVSLOT_OFFHAND    = 17
-- INVSLOT_RANGED     = 18
-- INVSLOT_TABARD     = 19
function item:IsEquipped()
  local itemSlotIDs = self:SlotIDs()
  if not itemSlotIDs then return false end

  local itemID = self:ID()
  local itemInfo = cache.itemInfo[itemID]
  if not itemInfo then
    itemInfo = {}
    cache.spellInfo[itemID] = itemInfo
  end

  if itemInfo.isEquipped == nil then
    local itemIsEquipped = false
    local equipment = player:GetEquipment()

    for i = 0, #itemSlotIDs do
      local itemSlotID = itemSlotIDs[i]
      if equipment[itemSlotID] == self.itemID then
        itemIsEquipped = true
        break
      end
    end

    itemInfo.isEquipped = itemIsEquipped
  end
  return itemInfo.isEquipped
end

function item:Cooldown()
  return (dbc.itemSpell[self:ID()] and GetSpellBaseCooldown(dbc.itemSpell[self:ID()]) / 1000 or 0)
end

function item:CooldownInfo()
  return GetItemCooldown(self:ID())
end

do
  local function ComputeCooldown(thisItem)
    local cdTime, cdValue = thisItem:CooldownInfo()
    if cdTime == 0 then return 0 end
    local cd = cdTime + cdValue - GetTime() - api.Latency()
    return cd > 0 and cd or 0
  end

  function item:CooldownRemains()
    local itemID = self:ID()

    local itemInfo = cache.itemInfo[itemID]
    if not itemInfo then
      itemInfo = {}
      cache.spellInfo[itemID] = itemInfo
    end

    local cooldown = itemInfo.cooldown
    if not cooldown then
      cooldown = ComputeCooldown(self)
      itemInfo.cooldown = cooldown
    end

    return cooldown
  end
end

function item:HasCooldown()
  return self:Cooldown() > 0
end

function item:CooldownUp()
  return self:CooldownRemains() == 0
end

function item:CooldownDown()
  return self:CooldownRemains() ~= 0
end

function item:IsReady()
  return (self:IsUsable() and self:CooldownUp())
end

function item:IsEquippedAndReady()
  return (self:IsEquipped() and self:IsReady())
end

function item:TimeSinceLastCast()
  return self:OnUseSpell() and self:OnUseSpell():TimeSinceLastCast() or 0
end

function item:HasStatAnyDps()
  return dbc.spellAuraStat[self:OnUseSpell():ID()]
end

function item:HasUseBuff()
  return self:IsUsable() and self:HasStatAnyDps()
end

function item:BuffDuration()
  if not self:IsUsable() then return 0 end
  if not self:OnUseSpell() then return 0 end
  local buffLength = dbc.spellDuration[self:OnUseSpell():ID()][1]
  if not buffLength then return 0 end
  if buffLength > 1000 then buffLength = buffLength / 1000 end
  return buffLength
end
