local api = WR.api
local dbc = WR.dbc
local unit = api.unit
local player = unit.player
local pet = unit.pet
local spell = api.spell

local triggerGCD = dbc.spellGCD
local lastRecord = 15
local prevGCDPredicted = 0
local prevGCDCastTime = 0
local prevOffGCDCastTime = 0
local prev = {
  gcd = {},
  offGCD = {},
  petGCD = {},
  petOffGCD = {},
}
local custom = {
  whitelist = {},
  blacklist = {}
}
local prevSuggested = {
  spell = nil,
  time = 0
}
local gcdSpell = spell(61304)

for i = 1, lastRecord do
  for _, t in pairs(prev) do
    table.insert(t, 0)
  end
end

local function RemoveOldRecords()
  for _, t in pairs(prev) do
    local n = #t
    while n > lastRecord do
      t[n] = nil
      n = n - 1
    end
  end
end

api:RegisterForSelfCombatEvent(
  function(_, _, _, _, _, _, _, _, _, _, _, spellID)
    if triggerGCD[spellID] ~= nil then
      if triggerGCD[spellID] then
        -- WR:PrintDebug(GetTime() .. " Self SPELL_CAST_SUCCESS " .. SpellID)
        table.insert(prev.gcd, 1, spellID)
        prevGCDCastTime = GetTime()
        prev.offGCD = {}
        prevOffGCDCastTime = 0
        prevGCDPredicted = 0
      else -- Prevents unwanted spells to be registered as OffGCD.
        table.insert(prev.offGCD, 1, spellID)
        prevOffGCDCastTime = GetTime()
        prevGCDCastTime = 0
      end
    end
    RemoveOldRecords()
  end,
  "SPELL_CAST_SUCCESS"
)

api:RegisterForSelfCombatEvent(
  function(_, _, _, _, _, _, _, _, _, _, _, spellID)
    if triggerGCD[spellID] then
      prevGCDPredicted = spellID
    end
  end,
  "SPELL_CAST_START"
)

api:RegisterForSelfCombatEvent(
  function(_, _, _, _, _, _, _, _, _, _, _, spellID)
    if prevGCDPredicted == spellID then
      prevGCDPredicted = 0
    end
  end,
  "SPELL_CAST_FAILED"
)

api:RegisterForPetCombatEvent(
  function(_, _, _, _, _, _, _, _, _, _, _, spellID)
    if triggerGCD[spellID] ~= nil then
      if triggerGCD[spellID] then
        table.insert(prev.petGCD, 1, spellID)
        prev.petOffGCD = {}
      else -- Prevents unwanted spells to be registered as OffGCD.
        table.insert(prev.petOffGCD, 1, spellID)
      end
    end
    RemoveOldRecords()
  end,
  "SPELL_CAST_SUCCESS"
)

function player:FilterTriggerGCD(specID)
  local registeredSpells = {}
  local baseTriggerGCD = dbc.spellGCD -- In case FilterTriggerGCD is called multiple time, we take the Enum table as base.
  -- Fetch registered spells during the init
  for spec, spells in pairs(api.spell[api.classesSpecsBySpecID[specID][1]]) do
    for _, spell in pairs(spells) do
      local spellID = spell:ID()
      local triggerGCDInfo = baseTriggerGCD[spellID]
      if triggerGCDInfo ~= nil then
        registeredSpells[spellID] = (triggerGCDInfo > 0)
      end
    end
  end
  
  for spellID, value in pairs(custom.whitelist) do
    registeredSpells[spellID] = value
  end
  
  for i = 1, #custom.blacklist do
    local spellID = custom.blacklist[i]
    if registeredSpells[spellID] then
      registeredSpells[spellID] = nil
    end
  end
  triggerGCD = registeredSpells
end

function spell:AddToTriggerGCD(value)
  if type(value) ~= "boolean" then error("You must give a boolean as argument.") end
  custom.whitelist[self.spellID] = value
end

function spell:RemoveFromTriggerGCD()
  table.insert(custom.blacklist, self.spellID)
end

function player:PrevGCDTime()
  return prevGCDCastTime
end

function player:PrevOffGCDTime()
  return prevOffGCDCastTime
end

function player:PrevCastTime()
  return math.max(prevGCDCastTime, prevOffGCDCastTime)
end

function player:IsPrevCastPending()
  if prevGCDPredicted > 0 then
    return false
  end

  local gcdStartTime, gcdDuration = gcdSpell:CooldownInfo()
  if gcdDuration > 0 and gcdStartTime > prevGCDCastTime then
    return true
  end

  return false
end

function player:SetPrevSuggestedSpell(suggestedSpell)
  if suggestedSpell == nil or suggestedSpell.spellID ~= nil then
    local gcdStartTime, gcdDuration = gcdSpell:CooldownInfo()
    if gcdDuration > 0 and gcdStartTime > prevGCDCastTime then
      return
    end
    prevSuggested.spell = suggestedSpell
    prevSuggested.time = GetTime()
  end
end

function player:PrevGCD(index, spell)
  if index > lastRecord then error("Only the last " .. lastRecord .. " GCDs can be checked.") end
  if spell then
    return prev.gcd[index] == spell:ID()
  else
    return prev.gcd[index]
  end
end

function player:PrevGCDP(index, spell, forcePred)
  if index > lastRecord then error("Only the last " .. (lastRecord) .. " GCDs can be checked.") end

  local predictedGCD = prevGCDPredicted
  if predictedGCD == 0 and prevSuggested.spell and prevSuggested.time > prevGCDCastTime then
    local spellId = prevSuggested.spell:ID()
    local gcdStartTime, gcdDuration = gcdSpell:CooldownInfo()
    if gcdDuration > 0 and gcdStartTime > prevGCDCastTime and triggerGCD[spellId] then
      predictedGCD = spellId
    end
  end

  if predictedGCD > 0 and index == 1 or forcePred then
    return predictedGCD == spell:ID()
  elseif predictedGCD > 0 then
    return player:PrevGCD(index - 1, spell)
  else
    return player:PrevGCD(index, spell)
  end
end

function player:PrevOffGCD(index, spell)
  if index > lastRecord then error("Only the last " .. lastRecord .. " OffGCDs can be checked.") end
  return prev.offGCD[index] == spell:ID()
end

function player:PrevOffGCDP(index, spell)
  if index > lastRecord then error("Only the last " .. (lastRecord) .. " GCDs can be checked.") end
  if prevGCDPredicted > 0 and index == 1 then
    return false
  elseif prevGCDPredicted > 0 then
    return player:PrevOffGCD(index - 1, spell)
  else
    return player:PrevOffGCD(index, spell)
  end
end

function pet:PrevGCD(index, spell)
  if index > lastRecord then error("Only the last " .. lastRecord .. " GCDs can be checked.") end
  return prev.petGCD[index] == spell:ID()
end

function pet:PrevOffGCD(index, spell)
  if index > lastRecord then error("Only the last " .. lastRecord .. " OffGCDs can be checked.") end
  return prev.petOffGCD[index] == spell:ID()
end
