local api = WR.api
local cache = WR.cache
local unit = api.unit
local spell = api.spell

local isStunnedDebuffs = {
  -- Demon Hunter
  -- Druid
  -- General
  spell(5211), -- Mighty Bash
  -- Feral
  spell(203123), -- Maim
  spell(163505), -- Rake
  -- Paladin
  -- General
  spell(853), -- Hammer of Justice
  -- Retribution
  spell(205290), -- Wake of Ashes
  -- Rogue
  -- General
  spell(199804), -- Between the Eyes
  spell(1833), -- Cheap Shot
  spell(408), -- Kidney Shot
  spell(196958), -- Strike from the Shadows
  -- Warrior
  -- General
  spell(132168), -- Shockwave
  spell(132169), -- Storm Bolt
}
function unit:IterateStunDebuffs()
  for i = 1, #isStunnedDebuffs do
    local isStunnedDebuff = isStunnedDebuffs[i]
    if self:DebuffUp(isStunnedDebuff, nil, true) then
      return true
    end
  end

  return false
end

function unit:IsStunned()
  local guid = self:GUID()
  if not guid then return end

  local unitInfo = cache.unitInfo[guid]
  if not unitInfo then
    unitInfo = {}
    cache.unitInfo[guid] = unitInfo
  end

  local isStunned = unitInfo.isStunned
  if isStunned == nil then
    isStunned = self:IterateStunDebuffs()
    unitInfo.isStunned = isStunned
  end

  return isStunned
end

local isStunnableClassification = {
  ["trivial"] = true,
  ["minus"] = true,
  ["normal"] = true,
  ["rare"] = true,
  ["rareelite"] = false,
  ["elite"] = false,
  ["worldboss"] = false,
  [""] = false
}
function unit:IsStunnable()
  -- TODO: Add DR Check
  local guid = self:GUID()
  if not guid then return end

  local unitInfo = cache.unitInfo[guid]
  if not unitInfo then
    unitInfo = {}
    cache.unitInfo[guid] = unitInfo
  end

  local isStunnable = unitInfo.IsStunnable
  if isStunnable == nil then
    isStunnable = isStunnableClassification[self:Classification()]
    unitInfo.isStunnable = isStunnable
  end

  return isStunnable
end

function unit:CanBeStunned(ignoreClassification)
  return ((ignoreClassification or self:IsStunnable()) and not self:IsStunned()) or false
end
