local api = WR.api
local bind = WR.bind
local utils = WR.utils
local unit = api.unit
local player = unit.player
local target = unit.target
local mouseover = unit.mouseover
local focus = unit.focus
local spell = api.spell
local macro = api.macro

api.classesSpecsBySpecID = {
  -- Death Knight
  [250] = { "deathKnight", "blood" },
  [251] = { "deathKnight", "frost" },
  [252] = { "deathKnight", "unholy" },
  -- Demon Hunter
  [577] = { "demonHunter", "havoc" },
  [581] = { "demonHunter", "vengeance" },
  -- Druid
  [102] = { "druid", "balance" },
  [103] = { "druid", "feral" },
  [104] = { "druid", "guardian" },
  [105] = { "druid", "restoration" },
  -- Evoker
  [1467] = { "evoker", "devastation" },
  [1468] = { "evoker", "preservation" },
  [1473] = { "evoker", "augmentation" },
  -- Hunter
  [253] = { "hunter", "beastMastery" },
  [254] = { "hunter", "marksmanship" },
  [255] = { "hunter", "survival" },
  -- Mage
  [62] = { "mage", "arcane" },
  [63] = { "mage", "fire" },
  [64] = { "mage", "frost" },
  -- Monk
  [268] = { "monk", "brewmaster" },
  [269] = { "monk", "windwalker" },
  [270] = { "monk", "mistweaver" },
  -- Paladin
  [65] = { "paladin", "holy" },
  [66] = { "paladin", "protection" },
  [70] = { "paladin", "retribution" },
  -- Priest
  [256] = { "priest", "discipline" },
  [257] = { "priest", "holy" },
  [258] = { "priest", "shadow" },
  -- Rogue
  [259] = { "rogue", "assassination" },
  [260] = { "rogue", "outlaw" },
  [261] = { "rogue", "subtlety" },
  -- Shaman
  [262] = { "shaman", "elemental" },
  [263] = { "shaman", "enhancement" },
  [264] = { "shaman", "restoration" },
  -- Warlock
  [265] = { "warlock", "affliction" },
  [266] = { "warlock", "demonology" },
  [267] = { "warlock", "destruction" },
  -- Warrior
  [71] = { "warrior", "arms" },
  [72] = { "warrior", "fury" },
  [73] = { "warrior", "protection" }
}

function api.Print(text)
  WR:Print(text)
end

function api.PrintDebug(text)
  WR:PrintDebug(text)
end

function api.AddApl(specID, aplName, apl, aplInit, defaultSettings)
  WR:AddApl(specID, aplName, apl, aplInit, defaultSettings)
end

function api.GetSettings(spec, name)
  return WR.db.profile[spec][name]
end

function api.IsReady()
  return not player:IsDeadOrGhost() and not player:IsMounted() and not player:IsInVehicle() and not C_PetBattles.IsInBattle() and not ACTIVE_CHAT_EDIT_BOX
end

function api.IsPaused()
  return WR.db.global.general.enabled.shiftKeyPause and IsShiftKeyDown()
end

function api.Break()
  WR:ChangePulseTimer(player:GCD() + 1)
end

function api.CDsOn()
  return WR.db.global.frames.toggles.cds
end

function api.AoEOn()
  return WR.db.global.frames.toggles.aoe
end

function api.AutoFocusOn()
  return WR.db.global.general.enabled.autoFocus
end

function api.DispelBuffsOn()
  return WR.db.global.general.enabled.dispelBuffs
end

function api.DispelDebuffsOn()
  return WR.db.global.general.enabled.dispelDebuffs
end

function api.HandleAfflictedOn()
  return WR.db.global.general.enabled.handleAfflicted
end

function api.HandleIncorporealOn()
  return WR.db.global.general.enabled.handleIncorporeal
end

function api.ItemsOn()
  return WR.db.global.general.enabled.items
end

function api.OpenerOn()
  return WR.db.global.general.enabled.opener
end

function api.PotionsOn()
  return WR.db.global.general.enabled.potions
end

function api.RacialsOn()
  return WR.db.global.general.enabled.racials
end

function api.TrinketsOn()
  return WR.db.global.general.enabled.trinkets
end

function api.HealthstoneHp()
  return WR.db.global.general.hp.healthstone
end

function api.AddToggle(name, settings, settingName)
  WR.frames.toggles:AddButton(name, settings, settingName)
end

function api.Bind(object)
  return WR.bind.Bind(object)
end

local silenceSpellIDs = {
  377004,
  397892,
  196543,
  381516,
}
local quakingSpell = spell(240447)
local poolSpellID = 999910
local spellQueueWindow = tonumber(C_CVar.GetCVar("SpellQueueWindow"))
function api.Cast(object, outOfRange, immovable, offGCD)
  local spellID = object.spellID
  local itemID = object.itemID
  local macroID = object.macroID
  local usable = macroID or object:IsUsable()
  local showPooling = object.spellID == poolSpellID
  local targetIsCastingSilence = target:Exists() and utils.IsValueInArray(silenceSpellIDs, target:CastSpellID())

  if spellID and IsCurrentSpell(spellID) then
    showPooling = true
  end

  if showPooling then
    WR.frames.root:SetBind(nil)
    object.lastDisplayTime = GetTime()
    return true
  end

  local precastWindow = math.min(math.max(spellQueueWindow - api.Latency(), 75), 150)
  if (not usable) or outOfRange or (immovable and (player:IsMoving() or player:DebuffUp(quakingSpell, true) or targetIsCastingSilence)) or ((not offGCD) and ((player:CastEnd() - precastWindow > 0) or (player:GCDRemains() - precastWindow > 0))) then
    WR.frames.root:SetBind(nil)
    object.lastDisplayTime = GetTime()
    return false
  end

  local binding
  if spellID then
    binding = bind.spell[spellID]
    if not binding then
      local actionKey = bind.GetBindingKey(object)
      if actionKey ~= nil then
        WR.frames.root:SetBind(actionKey)
        object.lastDisplayTime = GetTime()
        return true
      end
      WR:Print(object:Name() .. " is not bound.")
      return false
    end
  elseif itemID then
    binding = bind.item[itemID]
    if not binding then
      local actionKey = bind.GetBindingKey(object)
      if actionKey ~= nil then
        WR.frames.root:SetBind(actionKey)
        object.lastDisplayTime = GetTime()
        return true
      end
      WR:Print(object:Name() .. " is not bound.")
      return false
    end
  elseif macroID then
    binding = bind.macro[macroID]
    if not binding then
      local actionKey = bind.GetBindingKey(object)
      if actionKey ~= nil then
        WR.frames.root:SetBind(actionKey)
        object.lastDisplayTime = GetTime()
        return true
      end
      WR:Print(object.macroID .. " is not bound.")
      return false
    end
  end

  WR.frames.root:SetBind(binding.key)
  object.lastDisplayTime = GetTime()
  return true
end

function api.CastTargetIf(spell, outOfRange, immovable, offGCD, conditionFn, hostile)
  if api.UnitIsValid(target, conditionFn, hostile) then
    return api.Cast(spell, outOfRange, immovable, offGCD)
  end
end

function api.CastTargetOrMouseover(spell, macro, range, immovable, offGCD, conditionFn, hostile, prioritizeMouseover)
  if not range then
    range = 40
  end

  if not prioritizeMouseover and api.UnitIsValid(target, conditionFn, hostile) then
    return api.Cast(spell, not target:IsInRange(range), immovable, offGCD)
  end

  if api.UnitIsValid(mouseover, conditionFn, hostile) then
    if not macro then
      return api.Cast(spell, not mouseover:IsInRange(range), immovable, offGCD)
    else
      return api.Cast(macro, not mouseover:IsInRange(range), immovable, offGCD)
    end
  end

  if prioritizeMouseover and api.UnitIsValid(target, conditionFn, hostile) then
    return api.Cast(spell, not target:IsInRange(range), immovable, offGCD)
  end
end

function api.CastCursor(macro, range, immovable, offGCD, conditionFn, hostile)
  if not range then
    range = 40
  end

  if api.UnitIsValid(mouseover, conditionFn, hostile) then
    return api.Cast(macro, not mouseover:IsInRange(range), immovable, offGCD)
  end
end

function api.CastCycle(spell, macro, range, immovable, offGCD, compareMode, compareFn, conditionFn, hostile)
  if compareFn then
    local compareValue = compareFn(target)
    if utils.CompareThis(compareMode, compareFn(mouseover), compareValue) then
      return api.CastTargetOrMouseover(spell, macro, range, immovable, offGCD, conditionFn, hostile, true)
    else
      return api.CastTargetOrMouseover(spell, macro, range, immovable, offGCD, conditionFn, hostile)
    end
  end
end

function api.UnitIsValid(unit, conditionFn, hostile)
  if hostile == nil then
    hostile = true
  end
  return unit:Exists() and not unit:IsDeadOrGhost() and (not conditionFn or conditionFn(unit)) and (player:CanAttack(unit) == hostile)
end

function api.HandleNpc(spell, macro, range, immovable, offGCD, conditionFn, npcID, hostile)
  local thisConditionFn = function(u)
    return conditionFn ~= nil and conditionFn(u) and u:NPCID() == npcID
  end

  if spell:IsReady() then
    return api.CastTargetOrMouseover(spell, macro, range, immovable, offGCD, thisConditionFn, hostile)
  end
end

local incorporealNpcID = 204560
function api.HandleIncorporeal(spell, macro, range, immovable, offGCD)
  return api.HandleNpc(spell, macro, range, immovable, offGCD, nil, incorporealNpcID, true)
end

local afflictedNpcID = 204773
function api.HandleAfflicted(spell, macro, range, immovable, offGCD)
  local conditionFn = function(u)
    return not player:CanAttack(u)
  end

  return api.HandleNpc(spell, macro, range, immovable, offGCD, conditionFn, afflictedNpcID, false)
end

local chromieNpcID = 204449
function api.HandleChromie(spell, macro, range, immovable, offGCD)
  local conditionFn = function(u)
    return not player:CanAttack(u)
  end

  return api.HandleNpc(spell, macro, range, immovable, offGCD, conditionFn, chromieNpcID, false)
end

local interruptWhitelistIDs = {
  396812,
  388392,
  388863,
  377389,
  396640,
  387843,
  209413,
  207980,
  208165,
  198595,
  198959,
  215433,
  199726,
  198750,
  373017,
  392451,
  385310,
  152818,
  -- 154327, -- Domination Manual Interrupt
  156776,
  398206,
  156718,
  153524,
  397888,
  397889,
  395859,
  396073,
  397914,
  387564,
  375602,
  386546,
  377488,
  373932,
  384365,
  386024,
  387411,
  387606,
  384808,
  373395,
  376725,
  192288,
  -- Underrot
  265089,
  265091,
  278755,
  278961,
  266106,
  272183,
  413044,
  265433,
  265487,
  260879,
  -- Freehold
  257397,
  281420,
  257784,
  259092,
  -- Neltharions Lair
  202108,
  202075,
  193585,
  -- Uldaman
  369400,
  369365,
  369411,
  369675,
  369823,
  369399,
  377500,
  -- Brackenhide Hollow
  367500,
  367503,
  382347,
  372711,
  374544,
  385029,
  382474,
  -- Neltharus
  378172,
  395427,
  372223,
  372538,
  384161,
  383656,
  396925,
  -- Vortex
  410870,
  88170,
  88186,
  87779,
  87761,
  86331,
  -- Halls of Infusion
  374045,
  374020,
  374339,
  374563,
  395694,
  374706,
  374699,
  385036,
  377384,
  377348,
  377402,
  376171,
  -- Dawn of the Infinite
  411994,
  415770,
  415435,
  415437,
  416256,
  400165,
  412922,
  417481,
  412378,
  412233,
  413427,
}
function api.Interrupt(spell, macro, range, immovable, offGCD)
  if WR.db.global.general.enabled.interrupt and spell:IsReady() then
    local conditionFn = function(u)
      return player:CanAttack(u) and u:IsInterruptible() and (u:CastPercentage() >= WR.db.global.general.threshold.interrupt or u:IsChanneling()) and (WR.db.global.general.enabled.interruptEverything or utils.IsValueInArray(interruptWhitelistIDs, u:CastSpellID()) or utils.IsValueInArray(interruptWhitelistIDs, u:ChannelSpellID()))
    end

    if api.CastTargetOrMouseover(spell, macro, range, immovable, offGCD, conditionFn) then
      return spell:Name() .. " interrupt"
    end
  end
end

local stunWhitelistIDs = {
  210261,
  198959,
  398206,
  388392,
  395859,
  397889,
  397914,
  153524,
  215433,
  396812,
  372749,
  372735,
  370225,
  386526,
  384476,
  383823,
  386490,
  387615,
  382077,
  387564,
  386546,
  385536,
  387910,
  212784,
  199210,
  114646,
  397899,
  397931,
  -- Underrot
  265540,
  265376,
  265089,
  265091,
  278961,
  266106,
  272183,
  413044,
  -- Freehold
  257397,
  272402,
  281420,
  257784,
  257756,
  257739,
  -- Neltharions Lair
  193941,
  183526,
  202108,
  202075,
  193803,
  188587,
  200154,
  193585,
  -- Uldaman
  369400,
  369365,
  369423,
  369411,
  369674,
  369675,
  369823,
  369465,
  377486,
  377500,
  -- Brackenhide Hollow
  367484,
  367521,
  372711,
  385029,
  385039,
  -- Neltharus
  378818,
  371875,
  372223,
  384161,
  -- Vortex
  410870,
  88170,
  88186,
  87779,
  -- Halls of Infusion
  374045,
  374020,
  374339,
  374563,
  395694,
  376171,
  385036,
  377384,
  377348,
  -- Dawn of the Infinite
  412012,
  413606,
  419327,
  407535,
}
function api.InterruptStun(spell, macro, range, immovable, offGCD)
  if WR.db.global.general.enabled.interruptWithStun and spell:IsReady() then
    local conditionFn = function(u)
      return player:CanAttack(u) and (u:CastPercentage() >= WR.db.global.general.threshold.interrupt or u:IsChanneling()) and ((WR.db.global.general.enabled.interruptEverything and u:CanBeStunned()) or utils.IsValueInArray(stunWhitelistIDs, u:CastSpellID()) or utils.IsValueInArray(stunWhitelistIDs, u:ChannelSpellID()))
    end

    if api.CastTargetOrMouseover(spell, macro, range, immovable, offGCD, conditionFn) then
      return spell:Name() .. " interrupt_stun"
    end
  end
end

local mitigateIDs = {
  388911,
  193092,
  193668,
  381514,
  396019,
  397904,
  106823,
  106841,
  389804,
  377105,
  384978,
  384686,
  382836,
  -- Freehold
  222501,
  -- Dawn of the Infinite
  413013,
  413487,
  410254,
}
function api.ShouldMitigate()
  return api.UnitIsValid(target) and utils.IsValueInArray(mitigateIDs, target:CastSpellID()) or utils.IsValueInArray(mitigateIDs, target:ChannelSpellID())
end

local dispellableEnrageBuffIDs = {
  spell(390938),
  spell(397410),
  spell(190225),
  spell(396018),
  -- Underrot
  spell(265081),
  spell(266209),
  -- Freehold
  spell(257476),
  spell(257739),
  spell(257899),
  -- Neltharions Lair
  spell(201983),
  -- Uldaman
  spell(369806),
  -- Brackenhide Hollow
  spell(382555),
  spell(385827),
  -- Neltharus
  spell(371875),
  -- Halls of Infusion
  spell(377384),
  -- Dawn of the Infinite
  spell(412695),
}
function api.UnitHasEnrageBuff(unit)
  for i = 1, #dispellableEnrageBuffIDs do
    if unit:BuffUp(dispellableEnrageBuffIDs[i], true) then
      return true
    end
  end

  return false
end

local dispellableMagicBuffIDs = {
  spell(392454),
  spell(398151),
  spell(386223),
  -- Underrot
  spell(265091),
  spell(266201),
  -- Uldaman
  spell(369400),
  spell(369823),
  -- Neltharus
  spell(378149),
  -- Vortex
  spell(411743),
  -- Halls of Infusion
  spell(395694),
  spell(377402),
}
function api.UnitHasMagicBuff(unit)
  for i = 1, #dispellableMagicBuffIDs do
    if unit:BuffUp(dispellableMagicBuffIDs[i], true) then
      return true
    end
  end

  return false
end

api.dispellableMagicDebuffs = {
  spell(388392),
  spell(391977),
  -- Manual
  --Spell(374352),
  spell(207278),
  spell(207981),
  spell(372682),
  spell(392641),
  spell(397878),
  spell(114803),
  spell(395872),
  spell(386549),
  spell(377488),
  spell(386025),
  spell(384686),
  spell(376827),
  spell(106113),
  spell(209516),
  spell(215429),
  -- Underrot
  spell(266265),
  -- Freehold
  spell(257908),
  spell(256106),
  -- Uldaman
  spell(377405),
  -- Brackenhide Hollow
  spell(373899),
  spell(381379),
  -- Vortex
  spell(410997),
  spell(87618),
  -- Halls of Infusion
  spell(374724),
  --     Spell(389179), -- manual
  spell(383935),
  spell(385963),
  spell(387359),
  -- Dawn of the Infinite
  spell(415436),
  spell(415437),
  spell(413547),
  spell(400681),
  spell(401667),
  spell(407121),
  spell(417030),
  spell(412027),
}
function api.UnitHasMagicDebuff(unit)
  for i = 1, #api.dispellableMagicDebuffs do
    if unit:DebuffUp(api.dispellableMagicDebuffs[i], true) then
      return true
    end
  end

  return false
end

api.dispellableDiseaseDebuffs = {
  -- Underrot
  spell(278961),
  -- Freehold
  spell(258323),
  spell(257775),
  -- Uldaman
  spell(369818),
  -- Brackenhide Hollow
  spell(368081),
  spell(385039),
  spell(396305),
  spell(377864),
  spell(382808),
}
function api.UnitHasDiseaseDebuff(unit)
  for i = 1, #api.dispellableDiseaseDebuffs do
    if unit:DebuffUp(api.dispellableDiseaseDebuffs[i], true) then
      return true
    end
  end

  return false
end

api.dispellableCurseDebuffs = {
  spell(397911),
  spell(387615),
  -- Uldaman
  spell(369365),
  -- Dawn of the Infinite
  spell(413618),
}
function api.UnitHasCurseDebuff(unit)
  for i = 1, #api.dispellableCurseDebuffs do
    if unit:DebuffUp(api.dispellableCurseDebuffs[i], true) then
      return true
    end
  end

  return false
end

function api.UnitsWithBuffCount(units, buff)
  return utils.CountValuesInTable(units, function(u)
    return not u:IsDeadOrGhost() and u:BuffUp(buff)
  end)
end

function api.UnitsWithoutBuffCount(units, buff)
  return #units - api.UnitsWithBuffCount(units, buff)
end

function api.UnitsWithDebuffCount(units, debuff)
  return utils.CountValuesInTable(units, function(u)
    return not u:IsDeadOrGhost() and u:DebuffUp(debuff)
  end)
end

function api.UnitsWithoutDebuffCount(units, debuff)
  return #units - api.UnitsWithDebuffCount(units, debuff)
end

function api.GroupUnitsWithBuffCount(buff, onlyTanks, onlyNonTanks)
  return utils.CountValuesInTable(api.GroupUnits(), function(u)
    return not u:IsDeadOrGhost() and (not onlyTanks or api.UnitRole(u) == "TANK") and (not onlyNonTanks or api.UnitRole(u) ~= "TANK") and u:BuffUp(buff)
  end)
end

function api.GroupUnitsWithoutBuffCount(buff, onlyTanks, onlyNonTanks)
  return #api.GroupUnits() - api.GroupUnitsWithBuffCount(buff, onlyTanks, onlyNonTanks)
end

function api.IsSolo()
  return not player:IsInRaid() and not player:IsInParty()
end

function api.GroupUnits()
  local group = { player }
  if player:IsInRaid() then
    for _, cycleUnit in pairs(unit.raid) do
      group[#group + 1] = cycleUnit
    end
  elseif player:IsInParty() then
    for _, cycleUnit in pairs(unit.party) do
      group[#group + 1] = cycleUnit
    end
  end
  return group
end

function api.GroupHealthPercentage()
  local group = api.GroupUnits()
  local curHP = 0
  local maxHP = 0

  for i = 1, #group do
    local cycleUnit = group[i]
    if cycleUnit:Exists() and cycleUnit:IsInRange(40) and not cycleUnit:IsDeadOrGhost() then
      curHP = curHP + cycleUnit:Health()
      maxHP = maxHP + cycleUnit:MaxHealth()
    end
  end

  return (curHP / maxHP) * 100
end

function api.LowestGroupUnit(range)
  if not range then
    range = 40
  end

  local lowestGroupUnit
  local group = api.GroupUnits()
  for i = 1, #group do
    local cycleUnit = group[i]
    if not cycleUnit:IsDeadOrGhost() and cycleUnit:IsInRange(range) then
      if not lowestGroupUnit or cycleUnit:HealthPercentage() < lowestGroupUnit:HealthPercentage() then
        lowestGroupUnit = cycleUnit
      end
    end
  end

  return lowestGroupUnit
end

function api.GroupUnitsBelowHealthPercentageCount(healthPercentage, range)
  if not range then
    range = 40
  end

  return utils.CountValuesInTable(api.GroupUnits(), function(u)
    return not u:IsDeadOrGhost() and u:IsInRange(range) and u:HealthPercentage() <= healthPercentage
  end)
end

api.dispellableDebuffs = {}
function api.DispellableGroupUnits(dispellableDebuffs)
  if not dispellableDebuffs then
    dispellableDebuffs = api.dispellableDebuffs
  end

  local group = api.GroupUnits()
  local dispellableUnits = {}
  for i = 1, #group do
    local cycleUnit = group[i]
    for j = 1, #dispellableDebuffs do
      if cycleUnit:DebuffUp(dispellableDebuffs[j], true) then
        table.insert(dispellableUnits, cycleUnit)
      end
    end
  end

  return dispellableUnits
end

function api.DispellableGroupUnit(range, dispellableDebuffs)
  local dispellableGroupUnits = api.DispellableGroupUnits(dispellableDebuffs)

  -- prioritize non tank dispels
  for i = 1, #dispellableGroupUnits do
    local cycleUnit = dispellableGroupUnits[i]
    if api.UnitRole(cycleUnit) ~= "TANK" then
      if not range or cycleUnit:IsInRange(range) then
        return cycleUnit
      end
    end
  end

  for i = 1, #dispellableGroupUnits do
    local cycleUnit = dispellableGroupUnits[i]
    if not range or cycleUnit:IsInRange(range) then
      return cycleUnit
    end
  end
end

function api.IsDispellableGroupUnit(unit, range, dispellableDebuffs)
  if not range then
    range = 40
  end

  if not dispellableDebuffs then
    dispellableDebuffs = api.dispellableDebuffs
  end

  if api.UnitIsValid(unit, nil, false) and unit:IsInRange(range) then
    for i = 1, #dispellableDebuffs do
      if unit:DebuffUp(dispellableDebuffs[i], true) then
        return true
      end
    end
  end

  return false
end

function api.UnitRole(unit)
  return UnitGroupRolesAssigned(unit:ID())
end

function api.FindGroupUnitWithRole(role)
  return utils.FindValueInTable(api.GroupUnits(), function(u)
    return api.UnitRole(u) == role
  end)
end

function api.DeadGroupUnitsCount()
  return utils.CountValuesInTable(api.GroupUnits(), function(u)
    return u:IsDeadOrGhost()
  end)
end

function api.DefaultGetFocusUnit(range)
  -- prioritize target
  if api.UnitIsValid(target, function(u)
    return u:HealthPercentage() < 100 and target:IsInRange(range)
  end, false) then
    return target
  end

  -- otherwise return lowest group unit
  return api.LowestGroupUnit(range)
end

function api.FocusUnit(getFocusUnitFn, range)
  if not range then
    range = 40
  end

  local newFocus = (getFocusUnitFn and getFocusUnitFn()) or api.DefaultGetFocusUnit(range)
  if newFocus ~= nil and (focus == nil or not focus:Exists() or newFocus:GUID() ~= focus:GUID() or not focus:IsInRange(range)) then
    local focusUnitKey = string.format("%s%s", "focus", newFocus:ID())
    local focusUnitMacro = macro.focus[focusUnitKey]
    if api.Cast(focusUnitMacro, nil, nil, true) then
      return focusUnitKey .. " focus_unit";
    end
  end
end

local blessingOfTheBronzeBuffIDs = { 381732, 381741, 381746, 381748, 381749, 381750, 381751, 381752, 381753, 381754, 381756, 381757, 381758 }
function api.IsGroupBuffMissing(thisSpell, range)
  if not range then
    range = thisSpell:Name() == "Battle Shout" and 100 or 40
  end

  local group = api.GroupUnits()
  for i = 1, #group do
    local cycleUnit = group[i]
    if cycleUnit:Exists() and not cycleUnit:IsDeadOrGhost() and cycleUnit:IsInRange(range) then
      if thisSpell:Name() == "Blessing of the Bronze" then
        for j = 1, #blessingOfTheBronzeBuffIDs do
          if cycleUnit:BuffUp(spell(blessingOfTheBronzeBuffIDs[j]), true) then
            return false
          end
        end

        return true
      elseif cycleUnit:BuffDown(thisSpell, true) then
        return true
      end
    end
  end

  return false
end

function api.UseHealthstone()
  if api.item.healthstone:IsReady() and player:HealthPercentage() <= api.HealthstoneHp() then
    if api.Cast(api.macro.item.healthstone, nil, nil, true) then
      return "healthstone"
    end
  end
end

function api.UseTrinkets(range, onUseExcludes, conditionFn)
  if not range then
    range = 40
  end

  if api.TrinketsOn() and api.CDsOn() and target:IsInRange(range) and (conditionFn == nil or conditionFn(target)) then
    local trinket1ToUse = player:GetUseableItems(onUseExcludes, 13)
    if trinket1ToUse then
      if api.Cast(api.macro.item.trinket1, nil, nil, true) then
        return "trinket1"
      end
    end
    local trinket2ToUse = player:GetUseableItems(onUseExcludes, 14)
    if trinket2ToUse then
      if api.Cast(api.macro.item.trinket2, nil, nil, true) then
        return "trinket2"
      end
    end
  end
end
