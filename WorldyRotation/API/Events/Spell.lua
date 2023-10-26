local api = WR.api
local utils = WR.utils
local unit = api.unit
local player = unit.player
local spell = api.spell
local multiSpell = api.multiSpell

local playerSpecs = {}
local listenedSpells = {}
local listenedItemSpells = {}
local listenedSpecItemSpells = {}
local custom = {
  whitelist = {},
  blacklist = {}
}
local multiSpells = {}

do
  local listenedSpell
  api:RegisterForSelfCombatEvent(
      function(_, _, _, _, _, _, _, _, _, _, _, spellID)
        for i = 1, #playerSpecs do
          listenedSpell = listenedSpells[playerSpecs[i]][spellID]
          if listenedSpell then
            listenedSpell.lastCastTime = GetTime()
            listenedSpell.lastHitTime = GetTime() + listenedSpell:TravelTime()
          end
        end
        listenedSpell = listenedItemSpells[spellID]
        if listenedSpell then
          listenedSpell.lastCastTime = GetTime()
        end
        listenedSpell = listenedSpecItemSpells[spellID]
        if listenedSpell then
          listenedSpell.lastCastTime = GetTime()
        end
      end,
      "SPELL_CAST_SUCCESS"
  )
end

do
  local listenedSpell
  api:RegisterForPetCombatEvent(
      function(_, _, _, _, _, _, _, _, _, _, _, spellID)
        for i = 1, #playerSpecs do
          listenedSpell = listenedSpells[playerSpecs[i]][spellID]
          if listenedSpell then
            listenedSpell.lastCastTime = GetTime()
            listenedSpell.lastHitTime = GetTime() + listenedSpell:TravelTime()
          end
        end
      end,
      "SPELL_CAST_SUCCESS"
  )
end

do
  local listenedSpell
  api:RegisterForSelfCombatEvent(
      function(_, _, _, _, _, _, _, _, _, _, _, spellID)
        for i = 1, #playerSpecs do
          listenedSpell = listenedSpells[playerSpecs[i]][spellID]
          if listenedSpell then
            listenedSpell.lastAppliedOnPlayerTime = GetTime()
          end
        end
      end,
      "SPELL_AURA_APPLIED"
  )
end

do
  local listenedSpell
  api:RegisterForSelfCombatEvent(
      function(_, _, _, _, _, _, _, _, _, _, _, spellID)
        for i = 1, #playerSpecs do
          listenedSpell = listenedSpells[playerSpecs[i]][spellID]
          if listenedSpell then
            listenedSpell.lastRemovedFromPlayerTime = GetTime()
          end
        end
      end,
      "SPELL_AURA_REMOVED"
  )
end

function player:RegisterListenedItemSpells()
  listenedItemSpells = {}
  local usableItems = self:GetOnUseItems()
  for _, item in ipairs(usableItems) do
    local spell = item:OnUseSpell()
    if spell then
      -- WR:PrintDebug("Listening to spell " .. spell:ID() .. " for item " .. trinketItem:Name() )
      listenedItemSpells[spell:ID()] = spell
    end
  end
end

function player:RegisterListenedSpells(specID)
  playerSpecs = {}
  listenedSpells = {}
  listenedSpecItemSpells = {}
  local playerClass = api.classesSpecsBySpecID[specID][1]

  for spec, spells in pairs(api.spell[playerClass]) do
    table.insert(playerSpecs, spec)
    listenedSpells[spec] = {}
    for _, spell in pairs(spells) do
      listenedSpells[spec][spell:ID()] = spell
    end
  end

  for spellID, spell in pairs(custom.whitelist) do
    for i = 1, #playerSpecs do
      listenedSpells[playerSpecs[i]][spellID] = spell
    end
  end

  for i = 1, #custom.blacklist do
    local spellID = custom.blacklist[i]
    for k = 1, #playerSpecs do
      local spec = playerSpecs[k]
      if listenedSpells[spec][spellID] then
        listenedSpells[spec][spellID] = nil
      end
    end
  end

  if api.item[playerClass] then
    for spec, items in pairs(api.item[playerClass]) do
      for _, item in pairs(items) do
        local spell = item:OnUseSpell()
        if spell then
          -- WR:PrintDebug("Listening to spell " .. Spell:ID() .. " for spec item " .. Item:Name() )
          listenedSpecItemSpells[spell:ID()] = spell
        end
      end
    end
  end
end

function spell:AddToListenedSpells()
  custom.whitelist[self.spellID] = self
end

function spell:RemoveFromListenedSpells()
  table.insert(custom.blacklist, self.spellID)
end

function multiSpell:AddToMultiSpells()
  table.insert(multiSpells, self)
end

api:RegisterForEvent(
    function(event, arg1)
      for _, thisMultiSpell in pairs(multiSpells) do
        thisMultiSpell:Update()
      end
    end,
    "PLAYER_LOGIN", "SPELLS_CHANGED"
)
