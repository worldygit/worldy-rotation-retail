local addonName = ...

local api = WR.api
local unit = api.unit
local player = unit.player
local pet = unit.pet

local eventFrame = CreateFrame("Frame", addonName .. "_EventFrame", UIParent)
local handlers = {}
local combatHandlers = {}
local selfCombatHandlers = {}
local petCombatHandlers = {}
local prefixCombatHandlers = {}
local suffixCombatHandlers = {}
local combatPrefixes = {
  "ENVIRONMENTAL",
  "RANGE",
  "SPELL_BUILDING",
  "SPELL_PERIODIC",
  "SPELL",
  "SWING"
}
local combatPrefixesCount = #combatPrefixes

function api:RegisterForEvent(handler, ...)
  local eventsTable = { ... }
  for i = 1, #eventsTable do
    local event = eventsTable[i]
    if not handlers[event] then
      handlers[event] = { handler }
      eventFrame:RegisterEvent(event)
    else
      table.insert(handlers[event], handler)
    end
  end
end

function api:UnregisterForEvent(handler, event)
  if handlers[event] then
    for index, fn in pairs(handlers[event]) do
      if fn == handler then
        table.remove(handlers[event], index)
        if #handlers[event] == 0 then
          eventFrame:UnregisterEvent(event)
        end
        return
      end
    end
  end
end

eventFrame:SetScript("OnEvent",
  function(self, event, ...)
    for _, handler in pairs(handlers[event]) do
      handler(event, ...)
    end
  end
)

function api:RegisterForCombatEvent(handler, ...)
  local eventsTable = { ... }
  for i = 1, #eventsTable do
    local event = eventsTable[i]
    if not combatHandlers[event] then
      combatHandlers[event] = { handler }
    else
      table.insert(combatHandlers[event], handler)
    end
  end
end

function api:RegisterForSelfCombatEvent(handler, ...)
  local eventsTable = { ... }
  for i = 1, #eventsTable do
    local event = eventsTable[i]
    if not selfCombatHandlers[event] then
      selfCombatHandlers[event] = { handler }
    else
      table.insert(selfCombatHandlers[event], handler)
    end
  end
end

function api:RegisterForPetCombatEvent(handler, ...)
  local eventsTable = { ... }
  for i = 1, #eventsTable do
    local event = eventsTable[i]
    if not petCombatHandlers[event] then
      petCombatHandlers[event] = { handler }
    else
      table.insert(petCombatHandlers[event], handler)
    end
  end
end

function api:RegisterForCombatPrefixEvent(handler, ...)
  local eventsTable = { ... }
  for i = 1, #eventsTable do
    local event = eventsTable[i]
    if not prefixCombatHandlers[event] then
      prefixCombatHandlers[event] = { handler }
    else
      table.insert(prefixCombatHandlers[event], handler)
    end
  end
end

function api:RegisterForCombatSuffixEvent(handler, ...)
  local eventsTable = { ... }
  for i = 1, #eventsTable do
    local event = eventsTable[i]
    if not suffixCombatHandlers[event] then
      suffixCombatHandlers[event] = { handler }
    else
      table.insert(suffixCombatHandlers[event], handler)
    end
  end
end

function api:UnregisterForCombatEvent(handler, event)
  if combatHandlers[event] then
    for index, fn in pairs(combatHandlers[event]) do
      if fn == handler then
        table.remove(combatHandlers[event], index)
        return
      end
    end
  end
end

function api:UnregisterForSelfCombatEvent(handler, event)
  if selfCombatHandlers[event] then
    for index, fn in pairs(selfCombatHandlers[event]) do
      if fn == handler then
        table.remove(selfCombatHandlers[event], index)
        return
      end
    end
  end
end

function api:UnregisterForPetCombatEvent(handler, event)
  if petCombatHandlers[event] then
    for index, fn in pairs(petCombatHandlers[event]) do
      if fn == handler then
        table.remove(petCombatHandlers[event], index)
        return
      end
    end
  end
end

function api:UnregisterForCombatPrefixEvent(handler, event)
  if prefixCombatHandlers[event] then
    for index, fn in pairs(prefixCombatHandlers[event]) do
      if fn == handler then
        table.remove(prefixCombatHandlers, index)
        return
      end
    end
  end
end

function api:UnregisterForCombatSuffixEvent(handler, event)
  if suffixCombatHandlers[event] then
    for index, fn in pairs(suffixCombatHandlers[event]) do
      if fn == handler then
        table.remove(suffixCombatHandlers[event], index)
        return
      end
    end
  end
end

local function ListenerCombatLogEventUnfiltered(event, timeStamp, subEvent, ...)
  if combatHandlers[subEvent] then
    -- Unfiltered Combat Log
    for _, handler in pairs(combatHandlers[subEvent]) do
      handler(timeStamp, subEvent, ...)
    end
  end
  if selfCombatHandlers[subEvent] then
    -- Unfiltered Combat Log with SourceGUID == PlayerGUID filter
    if select(2, ...) == player:GUID() then
      for _, handler in pairs(selfCombatHandlers[subEvent]) do
        handler(timeStamp, subEvent, ...)
      end
    end
  end
  if petCombatHandlers[subEvent] then
    -- Unfiltered Combat Log with SourceGUID == PetGUID filter
    if select(2, ...) == pet:GUID() then
      for _, handler in pairs(petCombatHandlers[subEvent]) do
        handler(timeStamp, subEvent, ...)
      end
    end
  end
  for i = 1, combatPrefixesCount do
    -- TODO : Optimize the str find
    if subEvent then
      local start, ending = string.find(subEvent, combatPrefixes[i])
      if start and ending then
        -- TODO: Optimize the double str sub
        local prefix, suffix = string.sub(subEvent, start, ending), string.sub(subEvent, ending + 1)
        if prefixCombatHandlers[prefix] then
          -- Unfiltered Combat Log with Prefix only
          for _, handler in pairs(prefixCombatHandlers[prefix]) do
            handler(timeStamp, subEvent, ...)
          end
        end
        if suffixCombatHandlers[suffix] then
          -- Unfiltered Combat Log with Suffix only
          for _, handler in pairs(suffixCombatHandlers[suffix]) do
            handler(timeStamp, subEvent, ...)
          end
        end
      end
    end
  end
end

api:RegisterForEvent(function(event)
  ListenerCombatLogEventUnfiltered(event, CombatLogGetCurrentEventInfo())
end, "COMBAT_LOG_EVENT_UNFILTERED")

--- ======= COMBATLOG =======
--- Combat Log Arguments
------- Base -------
-- 1          2      3           4           5           6            7                8         9         10         11
-- TimeStamp, Event, HideCaster, SourceGUID, SourceName, SourceFlags, SourceRaidFlags, DestGUID, DestName, DestFlags, DestRaidFlags

------- Prefixes -------
--- SWING
-- N/A

--- SPELL & SPELL_PERIODIC
-- 12        13          14
-- SpellID, SpellName, SpellSchool

--- SPELL_ABSORBED* - When absorbed damage originated from a spell, will have additional 3 columns with spell info.
-- 12                13                14                 15                     16       17         18           19
-- AbsorbSourceGUID, AbsorbSourceName, AbsorbSourceFlags, AbsorbSourceRaidFlags, SpellID, SpellName, SpellSchool, Amount

--- SPELL_ABSORBED
-- 12             13               14                 15                16                17                 18                     19       20         21           22
-- AbsorbSpellId, AbsorbSpellName, AbsorbSpellSchool, AbsorbSourceGUID, AbsorbSourceName, AbsorbSourceFlags, AbsorbSourceRaidFlags, SpellID, SpellName, SpellSchool, Amount

------- Suffixes -------
--- _CAST_START & _CAST_SUCCESS & _SUMMON & _RESURRECT
-- N/A

--- _CAST_FAILED
-- 15
-- FailedType

--- _AURA_APPLIED & _AURA_REMOVED & _AURA_REFRESH
-- 15
-- AuraType

--- _AURA_APPLIED_DOSE
-- 15        16
-- AuraType, Charges

--- _INTERRUPT
-- 15            16              17
-- ExtraSpellID, ExtraSpellName, ExtraSchool

--- _HEAL
-- 15      16           17        18
-- Amount, Overhealing, Absorbed, Critical

--- _DAMAGE
-- 15      16        17      18        19       20        21        22        23
-- Amount, Overkill, School, Resisted, Blocked, Absorbed, Critical, Glancing, Crushing

--- _MISSED
-- 15        16         17
-- MissType, IsOffHand, AmountMissed

------- Special -------
--- UNIT_DIED, UNIT_DESTROYED
-- N/A

--- End Combat Log Arguments

-- Arguments Variables

