local api = WR.api
local cache = WR.cache
local unit = api.unit
local player = unit.player
local target = unit.target
local spell = api.spell
local item = api.item

local equipment = {}
local useableItems = {}

function player:GetEquipment()
  return equipment
end

function player:GetOnUseItems()
  return useableItems
end

function player:UpdateEquipment()
  table.wipe(equipment)
  table.wipe(useableItems)

  for i = 1, 19 do
    local itemID = select(1, GetInventoryItemID("player", i))
    if itemID ~= nil then
      equipment[i] = itemID
      local itemObject
      if i == 13 or i == 14 then
        itemObject = item(itemID, { i})
      else
        itemObject = item(itemID)
      end
      if itemObject:IsUsable() then
        table.insert(useableItems, itemObject)
      end
    end
  end

  self:RegisterListenedItemSpells()
end

do
  local genericItems = {
    -- Generic items that we always want to exclude
    -- Dragonflight
    DraconicCauterizingMagma        = item(204388, { 13, 14}),
    HeatofPrimalWinter              = item(201962),
    OminousChromaticEssence         = item(203729, { 13, 14}),
    PrimalRitualShell               = item(200563, { 13, 14}),
    RingBoundHourglass              = item(193000, { 13, 14}),
    RubyWhelpShell                  = item(193757, { 13, 14}),
    ScreamingBlackDragonscale       = item(202612, { 13, 14}),
    UncannyPocketwatch              = item(195220, { 13, 14}),
    -- Engineering Epic Quality Wrists
    ComplicatedCuffs                = item(198332),
    DifficultWristProtectors        = item(198333),
    NeedlesslyComplexWristguards    = item(198327),
    OverengineeredSleeveExtenders   = item(198322),
  }
  local engItems = {
    -- Dragonflight Engineering excludes
    -- Most tinkers are situational at best, so let's exclude every item with a tinker slot
    -- Epic Quality Goggles
    BattleReadyGoggles              = item(198326),
    LightweightOcularLenses         = item(198323),
    OscillatingWildernessOpticals   = item(198325),
    PeripheralVisionProjectors      = item(198324),
    -- Rare Quality Goggles
    DeadlineDeadeyes                = item(198330),
    MilestoneMagnifiers             = item(198329),
    QualityAssuredOptics            = item(198328),
    SentrysStabilizedSpecs          = item(198331),
    -- Uncommon Quality Goggles
    ClothGoggles                    = item(205278),
    LeatherGoggles                  = item(205279),
    MailGoggles                     = item(205280),
    PlateGoggles                    = item(205281),
  }
  local customItems = {
    -- Shadowlands
    BargastsLeash                   = item(184017, { 13, 14}),
    FlayedwingToxin                 = item(178742, { 13, 14}),
    MistcallerOcarina               = item(178715, { 13, 14}),
    SoulIgniter                     = item(184019, { 13, 14}),
    DarkmoonDeckIndomitable         = item(173096, { 13, 14}),
    ShardofAnnhyldesAegis           = item(186424, { 13, 14}),
    TomeofMonstruousConstructions   = item(186422, { 13, 14}),
    SoleahsSecretTechnique          = item(185818, { 13, 14}),
    SoleahsSecretTechnique2         = item(190958, { 13, 14}),
    -- Dragonflight
    GlobeofJaggedIce                = item(193732, { 13, 14}),
    TreemouthsFesteringSplinter     = item(193652, { 13, 14}),
  }
  local customItemSpells = {
    -- Shadowlands
    FlayedwingToxinBuff               = spell(345545),
    MistcallerVers                    = spell(330067),
    MistcallerCrit                    = spell(332299),
    MistcallerHaste                   = spell(332300),
    MistcallerMastery                 = spell(332301),
    SoulIgniterBuff                   = spell(345211),
    IndomitableFive                   = spell(311496),
    IndomitableSix                    = spell(311497),
    IndomitableSeven                  = spell(311498),
    IndomitableEight                  = spell(311499),
    TomeofMonstruousConstructionsBuff = spell(357163),
    SoleahsSecretTechniqueBuff        = spell(351952),
    SoleahsSecretTechnique2Buff       = spell(368512),
    -- Dragonflight
    SkeweringColdDebuff               = spell(388929),
  }

  local function IsUserItemBlacklisted(item)
    if not item then return false end

    local itemID = item:ID()
    -- TODO
    --if WR.db.global.general.blacklist.itemUserDefined[itemID] then
    --  if type(WR.db.global.general.blacklist.itemUserDefined[itemID]) == "boolean" then
    --    return true
    --  else
    --    return WR.db.global.general.blacklist.itemUserDefined[itemID](item)
    --  end
    --end

    return false
  end

  function player:IsItemBlacklisted(item)
    if IsUserItemBlacklisted(item) or not item:SlotIDs() then
      return true
    end

    local itemID = item:ID()
    local itemSlot = item:SlotIDs()[1]

    if itemSlot == 19 or itemSlot == 4 then return true end

    if itemID == customItems.BargastsLeash:ID() then
      return not (player:IsInParty() or player:IsInRaid())
    end

    if itemID == customItems.FlayedwingToxin:ID() then
      return player:AuraInfo(customItemSpells.FlayedwingToxinBuff)
    end

    if itemID == customItems.MistcallerOcarina:ID() then
      return player:BuffUp(customItemSpells.MistcallerCrit) or player:BuffUp(customItemSpells.MistcallerHaste)
        or player:BuffUp(customItemSpells.MistcallerMastery) or player:BuffUp(customItemSpells.MistcallerVers)
    end

    if itemID == customItems.SoulIgniter:ID() then
      return not (player:BuffDown(customItemSpells.SoulIgniterBuff) and target:IsInRange(40))
    end

    if itemID == customItems.DarkmoonDeckIndomitable:ID() then
      return not ((player:BuffUp(customItemSpells.IndomitableFive) or player:BuffUp(customItemSpells.IndomitableSix) or player:BuffUp(customItemSpells.IndomitableSeven)
        or player:BuffUp(customItemSpells.IndomitableEight)) and (player:IsTankingAoE(8) or player:IsTanking(target)))
    end

    if itemID == customItems.ShardofAnnhyldesAegis:ID() then
      return not (player:IsTankingAoE(8) or player:IsTanking(target))
    end

    if itemID == customItems.TomeofMonstruousConstructions:ID() then
      return player:AuraInfo(customItemSpells.TomeofMonstruousConstructionsBuff)
    end

    if itemID == customItems.SoleahsSecretTechnique:ID() or itemID == customItems.SoleahsSecretTechnique2:ID() then
      return player:BuffUp(customItemSpells.SoleahsSecretTechniqueBuff) or player:BuffUp(customItemSpells.SoleahsSecretTechnique2Buff)
    end

    if itemID == customItems.GlobeofJaggedIce:ID() then
      return target:DebuffStack(customItemSpells.SkeweringColdDebuff) < 4
    end

    if itemID == customItems.TreemouthsFesteringSplinter:ID() then
      return not (player:IsTankingAoE(8) or player:IsTanking(target))
    end

    for _, genItem in pairs(genericItems) do
      if itemID == genItem:ID() then
        return true
      end
    end

    for _, profindex in pairs({GetProfessions()}) do
      local prof = GetProfessionInfo(profindex)
      if prof == "Engineering" then
        if itemSlot == 6 or itemSlot == 15 then
          return true
        end
        for _, engItem in pairs(engItems) do
          if itemID == engItem:ID() then
            return true
          end
        end
      end
    end

    return false
  end

  function player:GetUseableItems(excludedItems, slotID)
    for _, item in ipairs(useableItems) do
      local itemID = item:ID()
      local isExcluded = false

      if slotID and equipment[slotID] ~= itemID then
        isExcluded = true
      elseif item:IsReady() and not player:IsItemBlacklisted(item) then
        for i=1, #excludedItems do
          if excludedItems[i] == itemID then
            isExcluded = true
            break
          end
        end

        if not isExcluded then
          local itemSlot = item:SlotIDs()[1]
          local itemSpell = item:OnUseSpell()
          local itemRange = (itemSpell and itemSpell.maximumRange > 0 and itemSpell.maximumRange <= 100) and itemSpell.maximumRange or 100
          return item, itemSlot, itemRange
        end
      end
    end

    return nil
  end
end

-- Define our tier set tables
-- TierSets[TierNumber][ClassID][ItemSlot] = Item ID
local tierSets = {
  -- Dragonflight - Vault of the Incarnates
  [29] = {
    -- Item Slot IDs: 1 - Head, 3 - Shoulders, 5 - Chest, 7 - Legs, 10 - Hands
    -- Warrior
    [1]  = {[1] = 200426, [3] = 200428, [5] = 200423, [7] = 200427, [10] = 200425},
    -- Paladin
    [2]  = {[1] = 200417, [3] = 200419, [5] = 200414, [7] = 200418, [10] = 200416},
    -- Hunter
    [3]  = {[1] = 200390, [3] = 200392, [5] = 200387, [7] = 200391, [10] = 200389},
    -- Rogue
    [4]  = {[1] = 200372, [3] = 200374, [5] = 200369, [7] = 200373, [10] = 200371},
    -- Priest
    [5]  = {[1] = 200327, [3] = 200329, [5] = 200324, [7] = 200328, [10] = 200326},
    -- Death Knight
    [6]  = {[1] = 200408, [3] = 200410, [5] = 200405, [7] = 200409, [10] = 200407},
    -- Shaman
    [7]  = {[1] = 200399, [3] = 200401, [5] = 200396, [7] = 200400, [10] = 200398},
    -- Mage
    [8]  = {[1] = 200318, [3] = 200320, [5] = 200315, [7] = 200319, [10] = 200317},
    -- Warlock
    [9]  = {[1] = 200336, [3] = 200338, [5] = 200333, [7] = 200337, [10] = 200335},
    -- Monk
    [10] = {[1] = 200363, [3] = 200365, [5] = 200360, [7] = 200364, [10] = 200362},
    -- Druid
    [11] = {[1] = 200354, [3] = 200356, [5] = 200351, [7] = 200355, [10] = 200353},
    -- Demon Hunter
    [12] = {[1] = 200345, [3] = 200347, [5] = 200342, [7] = 200346, [10] = 200344},
    -- Evoker
    [13] = {[1] = 200381, [3] = 200383, [5] = 200378, [7] = 200382, [10] = 200380}
  },
  -- Dragonflight - Aberrus, the Shadowed Crucible
  [30] = {
    -- Item Slot IDs: 1 - Head, 3 - Shoulders, 5 - Chest, 7 - Legs, 10 - Hands
    -- Warrior
    [1]  = {[1] = 202443, [3] = 202441, [5] = 202446, [7] = 202442, [10] = 202444},
    -- Paladin
    [2]  = {[1] = 202452, [3] = 202450, [5] = 202455, [7] = 202451, [10] = 202453},
    -- Hunter
    [3]  = {[1] = 202479, [3] = 202477, [5] = 202482, [7] = 202478, [10] = 202480},
    -- Rogue
    [4]  = {[1] = 202497, [3] = 202495, [5] = 202500, [7] = 202496, [10] = 202498},
    -- Priest
    [5]  = {[1] = 202542, [3] = 202540, [5] = 202545, [7] = 202541, [10] = 202543},
    -- Death Knight
    [6]  = {[1] = 202461, [3] = 202459, [5] = 202464, [7] = 202460, [10] = 202462},
    -- Shaman
    [7]  = {[1] = 202470, [3] = 202468, [5] = 202473, [7] = 202469, [10] = 202471},
    -- Mage
    [8]  = {[1] = 202551, [3] = 202549, [5] = 202554, [7] = 202550, [10] = 202552},
    -- Warlock
    [9]  = {[1] = 202533, [3] = 202531, [5] = 202536, [7] = 202532, [10] = 202534},
    -- Monk
    [10] = {[1] = 202506, [3] = 202504, [5] = 202509, [7] = 202505, [10] = 202507},
    -- Druid
    [11] = {[1] = 202515, [3] = 202513, [5] = 202518, [7] = 202514, [10] = 202516},
    -- Demon Hunter
    [12] = {[1] = 202524, [3] = 202522, [5] = 202527, [7] = 202523, [10] = 202525},
    -- Evoker
    [13] = {[1] = 202488, [3] = 202486, [5] = 202491, [7] = 202487, [10] = 202489}
  },
  -- Dragonflight - Amirdrassil, the Dream's Hope
  [31] = {
    -- Item Slot IDs: 1 - Head, 3 - Shoulders, 5 - Chest, 7 - Legs, 10 - Hands
    -- Warrior
    [1]  = {[1] = 207182, [3] = 207180, [5] = 207185, [7] = 207181, [10] = 207183},
    -- Paladin
    [2]  = {[1] = 207191, [3] = 207189, [5] = 207194, [7] = 207190, [10] = 207192},
    -- Hunter
    [3]  = {[1] = 207218, [3] = 207216, [5] = 207221, [7] = 207217, [10] = 207219},
    -- Rogue
    [4]  = {[1] = 207236, [3] = 207234, [5] = 207239, [7] = 207235, [10] = 207237},
    -- Priest
    [5]  = {[1] = 207281, [3] = 207279, [5] = 207284, [7] = 207280, [10] = 207282},
    -- Death Knight
    [6]  = {[1] = 207200, [3] = 207198, [5] = 207203, [7] = 207199, [10] = 207201},
    -- Shaman
    [7]  = {[1] = 207209, [3] = 207207, [5] = 207212, [7] = 207208, [10] = 207210},
    -- Mage
    [8]  = {[1] = 207290, [3] = 207288, [5] = 207293, [7] = 207289, [10] = 207291},
    -- Warlock
    [9]  = {[1] = 207272, [3] = 207270, [5] = 207275, [7] = 207271, [10] = 207273},
    -- Monk
    [10] = {[1] = 207245, [3] = 207243, [5] = 207248, [7] = 207244, [10] = 207246},
    -- Druid
    [11] = {[1] = 207254, [3] = 207252, [5] = 207257, [7] = 207253, [10] = 207255},
    -- Demon Hunter
    [12] = {[1] = 207263, [3] = 207261, [5] = 207266, [7] = 207262, [10] = 207264},
    -- Evoker
    [13] = {[1] = 207227, [3] = 207225, [5] = 207230, [7] = 207226, [10] = 207228}
  },
}

function player:HasTier(tier, pieces)
  if tierSets[tier][cache.persistent.player.class[3]] then
    local count = 0
    local item
    for slot, itemID in pairs(tierSets[tier][cache.persistent.player.class[3]]) do
      item = equipment[slot]
      if item and item == itemID then
        count = count + 1
      end
    end
    return count >= pieces
  end
  return false
end
