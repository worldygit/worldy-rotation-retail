local api = WR.api
local unit = api.unit
local spell = api.spell

function unit:CastingInfo()
  local unitID = self:ID()
  if not unitID then return end

  return UnitCastingInfo(unitID)
end

function unit:ChannelingInfo()
  local unitID = self:ID()
  if not unitID then return end

  return UnitChannelInfo(unitID)
end

function unit:CastName()
  local castName = self:CastingInfo()

  return castName
end

function unit:ChannelName()
  local channelName = self:ChannelingInfo()

  return channelName
end

function unit:CastSpellID()
  local _, _, _, _, _, _, _, _, castSpellID = self:CastingInfo()

  return castSpellID
end

function unit:ChannelSpellID()
  local _, _, _, _, _, _, _, channelSpellID = self:ChannelingInfo()

  return channelSpellID
end

function unit:CastCost()
  local castSpellID = self:CastSpellID()

  if castSpellID then
    return spell(castSpellID):Cost(1, "cost")
  end

  return 0
end

function unit:IsCasting(thisSpell)
  local castName, _, _, _, _, _, _, _, castSpellID = self:CastingInfo()

  if thisSpell then
    return castSpellID == thisSpell:ID() and true or false
  end

  return castName and true or false
end


function unit:IsChanneling(thisSpell)
  local channelName, _, _, _, _, _, _, channelSpellID = self:ChannelingInfo()

  if thisSpell then
    return channelSpellID == thisSpell:ID() and true or false
  end

  return channelName and true or false
end

function unit:IsInterruptible()
  local _, _, _, _, _, _, _, castNotInterruptible = self:CastingInfo()
  local _, _, _, _, _, _, channelNotInterruptible = self:ChannelingInfo()

  return ((castNotInterruptible == false or channelNotInterruptible == false) and true) or false
end

function unit:CastStart()
  local _, _, _, castStartTime = self:CastingInfo()
  local _, _, _, channelStartTime = self:ChannelingInfo()

  if castStartTime then return castStartTime / 1000 end
  if channelStartTime then return channelStartTime / 1000 end

  return 0
end

function unit:ChannelStart()
  return self:CastStart()
end

function unit:CastEnd()
  local _, _, _, _, castEndTime = self:CastingInfo()
  local _, _, _, _, channelEndTime = self:ChannelingInfo()

  if castEndTime then return castEndTime / 1000 end
  if channelEndTime then return channelEndTime / 1000 end

  return 0
end

function unit:ChannelEnd()
  return self:CastEnd()
end

function unit:CastDuration()
  local _, _, _, castStartTime, castEndTime = self:CastingInfo()
  local _, _, _, channelStartTime, channelEndTime = self:ChannelingInfo()

  if castStartTime then
    return (castEndTime - castStartTime) / 1000
  end
  if channelStartTime then
    return (channelEndTime - channelStartTime) / 1000
  end
end

function unit:ChannelDuration()
  return self:CastDuration()
end

function unit:CastRemains()
  local castEnd = self:CastEnd()

  return (castEnd and (castEnd - GetTime())) or 0
end

function unit:ChannelRemains()
  return self:CastRemains()
end

function unit:CastPercentage(reverseChannel)
  local _, _, _, castStartTime, castEndTime = self:CastingInfo()
  local _, _, _, channelStartTime, channelEndTime = self:ChannelingInfo()

  if castStartTime then
    return (GetTime() * 1000 - castStartTime) / (castEndTime - castStartTime) * 100
  end

  if channelStartTime then
    return reverseChannel and (GetTime() * 1000 - channelStartTime) / (channelEndTime - channelStartTime) * 100 or 100 - (GetTime() * 1000 - channelStartTime) / (channelEndTime - channelStartTime) * 100
  end

  return 0
end

function unit:ChannelPercentage(reverseChannel)
  return self:CastPercentage(reverseChannel)
end
