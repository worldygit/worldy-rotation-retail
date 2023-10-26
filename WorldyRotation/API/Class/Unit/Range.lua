local api = WR.api
local cache = WR.cache
local dbc = WR.dbc
local unit = api.unit
local player = unit.player

local rangeTableByType = {
  melee = {
    hostile = {
      rangeIndex = {},
      itemRange = {}
    },
    friendly = {
      rangeIndex = {},
      itemRange = {}
    }
  },
  ranged = {
    hostile = {
      rangeIndex = {},
      itemRange = {}
    },
    friendly = {
      rangeIndex = {},
      itemRange = {}
    }
  }
}
do
  local types = { "melee", "ranged" }
  
  local function SortMixAsc(a, b)
    if type(a) == "string" and type(b) == "number" then
      return a < tostring(b)
    elseif type(a) == "number" and type(b) == "string" then
      return b < tostring(a)
    else
      return a < b
    end
  end

  for i = 1, #types do
    local type = types[i]
    local itemRange = dbc.itemRange[type]
    local hostile, friendly = rangeTableByType[type].hostile, rangeTableByType[type].friendly

    hostile.rangeIndex = { unpack(itemRange.hostile.rangeIndex) }
    table.sort(hostile.rangeIndex, SortMixAsc)
    friendly.rangeIndex = { unpack(itemRange.friendly.rangeIndex) }
    table.sort(friendly.rangeIndex, SortMixAsc)

    for k, v in pairs(itemRange.hostile.itemRange) do
      hostile.itemRange[k] = v[math.random(1, #v)]
    end
    for k, v in pairs(itemRange.friendly.itemRange) do
      friendly.itemRange[k] = v[math.random(1, #v)]
    end
  end
end

function unit:IsInRange(distance)
  assert(type(distance) == "number", "Distance must be a number.")
  assert(distance >= 5 and distance <= 100, "Distance must be between 5 and 100.")

  local guid = self:GUID()
  if not guid then
    return false
  end

  local unitInfo = cache.unitInfo[guid]
  if not unitInfo then
    unitInfo = {}
    cache.unitInfo[guid] = unitInfo
  end
  local unitInfoIsInRange = unitInfo.isInRange
  if not unitInfoIsInRange then
    unitInfoIsInRange = {}
    unitInfo.isInRange = unitInfoIsInRange
  end

  local identifier = distance
  local isInRange = unitInfoIsInRange[identifier]
  if isInRange == nil then
    local rangeTableByReaction = rangeTableByType.ranged
    local rangeTable = player:CanAttack(self) and rangeTableByReaction.hostile or rangeTableByReaction.friendly
    local itemRange = rangeTable.itemRange

    if not itemRange[distance] then
      local rangeIndex = rangeTable.rangeIndex
      for i = #rangeIndex, 1, -1 do
        local range = rangeIndex[i]
        if range == distance then
          break
        end
        if range < distance then
          distance = range
          break
        end
      end
    end

    isInRange = IsItemInRange(itemRange[distance], self:ID())
    unitInfoIsInRange[identifier] = isInRange
  end

  return isInRange
end

function unit:IsInMeleeRange(distance)
  assert(type(distance) == "number", "Distance must be a number.")
  assert(distance >= 5 and distance <= 100, "Distance must be between 5 and 100.")

  if (distance ~= 5) then
    return self:IsInRange(distance - 1.5)
  end

  local guid = self:GUID()
  if not guid then
    return false
  end

  local rangeTableByReaction = rangeTableByType.melee
  local rangeTable = player:CanAttack(self) and rangeTableByReaction.hostile or rangeTableByReaction.friendly
  local itemRange = rangeTable.itemRange

  return IsItemInRange(itemRange[distance], self:ID())
end

function unit:IsSpellInRange(thisSpell)
  local guid = self:GUID()
  if not guid then
    return false
  end
  if thisSpell:BookIndex() == nil then
    return false
  end

  return IsSpellInRange(thisSpell:BookIndex(), thisSpell:BookType(), self:ID()) == 1
end

function unit:IsActionInRange(actionSlot)
  return IsActionInRange(actionSlot, self:ID())
end

local function FindRange(thisUnit, max)
  local rangeTableByReaction = rangeTableByType.ranged
  local rangeTable = player:CanAttack(thisUnit) and rangeTableByReaction.hostile or rangeTableByReaction.friendly
  local rangeIndex = rangeTable.rangeIndex

  for i = #rangeIndex - (max and 1 or 0), 1, -1 do
    if not thisUnit:IsInRange(rangeIndex[i]) then
      return max and rangeIndex[i + 1] or rangeIndex[i]
    end
  end
end

function unit:MinDistance()
  return FindRange(self)
end

function unit:MaxDistance()
  return FindRange(self, true)
end
