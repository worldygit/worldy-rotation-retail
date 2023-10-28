local api = WR.api
local cache = WR.cache
local unit = api.unit
local player = unit.player

local itemActionEnemies = cache.enemies.itemAction
local meleeEnemies = cache.enemies.melee
local rangedEnemies = cache.enemies.ranged
local spellActionEnemies = cache.enemies.spellAction
local spellEnemies = cache.enemies.spell
local unitIDs = {
  "arena",
  "boss",
  "nameplate"
}

local function InsertAvailableUnits(enemiesTable, rangeCheck)
  local insertedUnits = {}
  for i = 1, #unitIDs do
    local units = unit[unitIDs[i]]
    for _, thisUnit in pairs(units) do
      local guid = thisUnit:GUID()
      if not insertedUnits[guid] and thisUnit:Exists() and not thisUnit:IsBlacklisted() and not thisUnit:IsUserBlacklisted()
        and not thisUnit:IsDeadOrGhost() and player:CanAttack(thisUnit) and rangeCheck(thisUnit) then
        table.insert(enemiesTable, thisUnit)
        insertedUnits[guid] = true
      end
    end
  end
end

do
  local rangeCheckByRadius = {}

  function player:GetEnemiesInRange(radius)
    local enemies = rangedEnemies

    if enemies[radius] then return enemies[radius] end
    local enemiesTable = {}
    enemies[radius] = enemiesTable
    if #enemies >= 1 then
      local radiuses = {}
      for key, _ in pairs(enemies) do
        if key >= radius then table.insert(radiuses, key) end
      end
      if #radiuses >= 1 then
        if #radiuses >= 2 then table.sort(radiuses, function(a, b) return a < b end) end
        for _, thisUnit in pairs(enemies[radiuses[1]]) do
          if thisUnit:IsInRange(radius) then table.insert(enemiesTable, unit) end
        end

        return enemiesTable
      end
    end

    local rangeCheck = rangeCheckByRadius[radius]
    if not rangeCheck then
      rangeCheck = function (thisUnit) return thisUnit:IsInRange(radius) end
      rangeCheckByRadius[radius] = rangeCheck
    end
    InsertAvailableUnits(enemiesTable, rangeCheck)

    return enemiesTable
  end
end

do
  local rangeCheckByRadius = {}

  function player:GetEnemiesInMeleeRange(radius)
    local enemies = meleeEnemies

    if enemies[radius] then return enemies[radius] end

    local enemiesTable = {}
    enemies[radius] = enemiesTable

    local rangeCheck = rangeCheckByRadius[radius]
    if not rangeCheck then
      rangeCheck = function (thisUnit) return thisUnit:IsInMeleeRange(radius) end
      rangeCheckByRadius[radius] = rangeCheck
    end
    InsertAvailableUnits(enemiesTable, rangeCheck)

    return enemiesTable
  end
end

do
  local rangeCheckByIdentifier = {}

  function player:GetEnemiesInSpellRange(thisSpell)
    local identifier = thisSpell.spellID
    local enemies = spellEnemies

    if enemies[identifier] then return enemies[identifier] end

    local enemiesTable = {}
    enemies[identifier] = enemiesTable

    local rangeCheck = rangeCheckByIdentifier[identifier]
    if not rangeCheck then
      rangeCheck = function (thisUnit) return thisUnit:IsSpellInRange(thisSpell) end
      rangeCheckByIdentifier[identifier] = rangeCheck
    end
    InsertAvailableUnits(enemiesTable, rangeCheck)

    return enemiesTable
  end
end

do
  local rangeCheckByIdentifier = {}

  function player:GetEnemiesInItemActionRange(thisItem)
    local identifier = thisItem.itemID
    local enemies = itemActionEnemies

    if enemies[identifier] then return enemies[identifier] end

    local enemiesTable = {}
    enemies[identifier] = enemiesTable

    local rangeCheck = rangeCheckByIdentifier[identifier]
    if not rangeCheck then
      rangeCheck = function (thisUnit) return thisUnit:IsItemInActionRange(thisItem) end
      rangeCheckByIdentifier[identifier] = rangeCheck
    end
    InsertAvailableUnits(enemiesTable, rangeCheck)

    return enemiesTable
  end
end

do
  local rangeCheckByIdentifier = {}

  function player:GetEnemiesInSpellActionRange(thisSpell)
    local identifier = thisSpell.spellID
    local enemies = spellActionEnemies

    if enemies[identifier] then return enemies[identifier] end

    local enemiesTable = {}
    enemies[identifier] = enemiesTable

    local rangeCheck = rangeCheckByIdentifier[identifier]
    if not rangeCheck then
      rangeCheck = function (thisUnit) return thisUnit:IsSpellInActionRange(thisSpell) end
      rangeCheckByIdentifier[identifier] = rangeCheck
    end
    InsertAvailableUnits(enemiesTable, rangeCheck)

    return enemiesTable
  end
end
