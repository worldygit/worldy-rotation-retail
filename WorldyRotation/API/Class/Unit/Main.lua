local api = WR.api
local cache = WR.cache
local unit = api.unit
local player = unit.player
local boss = unit.boss

function unit:Cache()
  self:RemoveUnitGUIDMapEntry()
  self.unitExists = UnitExists(self.unitID) or false
  self.unitGUID = UnitGUID(self.unitID)
  self.unitName = UnitName(self.unitID)
  self.unitCanBeAttacked = UnitCanAttack("player", self.unitID) or false
  self.unitNPCID = self:NPCID(true)
  if self.unitGUID and self.unitID then
    self:AddUnitGUIDMapEntry()
  end
  -- Level?
  -- IsDummy?
  -- IsAPlayer?
  -- Classification?
end

function unit:ID()
  return self.unitID
end

function unit:GUID()
  if self.useCache then
    return self.unitGUID
  end

  return UnitGUID(self.unitID)
end

function unit:Name()
  if self.useCache then
    return self.unitName
  end

  return UnitName(self.unitID)
end

function unit:Exists()
  if self.useCache then
    return self.unitExists and UnitIsVisible(self.unitID)
  end

  return UnitExists(self.unitID) and UnitIsVisible(self.unitID)
end

function unit:NPCID(bypassCache)
  if not bypassCache and self.useCache and self.unitNPCID then
    return self.unitNPCID
  end

  local guid = self:GUID()
  if not guid then return -1 end

  local unitInfo = cache.unitInfo[guid]
  if not unitInfo then
    unitInfo = {}
    cache.unitInfo[guid] = unitInfo
  end

  local npcid = unitInfo.npcid
  if not npcid then
    local type, _, _, _, _, npcidFromGUID = strsplit('-', guid)
    if type == "Creature" or type == "Pet" or type == "Vehicle" then
      npcid = tonumber(npcidFromGUID)
    else
      npcid = -2
    end
    unitInfo.npcid = npcid
  end

  return npcid
end

function unit:Level()
  return UnitLevel(self.unitID)
end

function unit:IsInBossList(npcid)
  local thisNPCID = npcid or self:NPCID()

  for _, thisUnit in pairs(boss) do
    if thisUnit:Exists() and thisUnit:NPCID() == thisNPCID then
      return true
    end
  end

  return false
end

function unit:CheckHPFromBossList(npcid, hp)
  local thisNPCID = npcid or self:NPCID()
  local thisHP = hp or 100

  for _, thisUnit in pairs(boss) do
    if thisUnit:Exists() and thisUnit:NPCID() == thisNPCID and thisUnit:HealthPercentage() <= thisHP then
      return true
    end
  end

  return false
end

function unit:CanAttack(other)
  local unitID = self:ID()
  if unitID == "player" and other.useCache then
    return other.unitCanBeAttacked
  end

  return UnitCanAttack(unitID, other:ID())
end

local dummyUnits = {
  -- City (SW, Orgri, ...)
  [31146] = true, -- Raider's Training Dummy
  [31144] = true, -- Training Dummy
  [32666] = true, -- Training Dummy
  [32667] = true, -- Training Dummy
  [46647] = true, -- Training Dummy
  [114832] = true, -- PvP Training Dummy
  [153285] = true, -- Training Dummy
  [153292] = true, -- Training Dummy
  -- MoP Shrine of Two Moons
  [67127] = true, -- Training Dummy
  -- WoD Alliance Garrison
  [87317] = true, -- Mage Tower Damage Training Dummy
  [87318] = true, -- Mage Tower Damage Dungeoneer's Training Dummy (& Garrison)
  [87320] = true, -- Mage Tower Damage Raider's Training Dummy
  [88314] = true, -- Tanking Dungeoneer's Training Dummy
  [88316] = true, -- Healing Training Dummy ----> FRIENDLY
  -- WoD Horde Garrison
  [87760] = true, -- Mage Tower Damage Training Dummy
  [87761] = true, -- Mage Tower Damage Dungeoneer's Training Dummy (& Garrison)
  [87762] = true, -- Mage Tower Damage Raider's Training Dummy
  [88288] = true, -- Tanking Dungeoneer's Training Dummy
  [88289] = true, -- Healing Training Dummy ----> FRIENDLY
  -- Legion Druid Class Order Hall
  [113964] = true, -- Raider's Training Dummy
  [113966] = true, -- Dungeoneer's Training Dummy
  -- Legion Mage Class Order Hall
  [103397] = true, -- Greater Bullwark Construct
  [103404] = true, -- Bullwark Construct
  [103402] = true, -- Lesser Bullwark Construct
  -- Legion Priest Class Order Hall
  [107555] = true, -- Bound void Wraith
  [107556] = true, -- Bound void Walker
  -- Legion Rogue Class Order Hall
  [92164] = true, -- Training Dummy
  [92165] = true, -- Dungeoneer's Training Dummy
  [92166] = true, -- Raider's Training Dummy
  -- Legion Warlock Class Order Hall
  [101956] = true, -- Rebellious Fel Lord
  [102045] = true, -- Rebellious WrathGuard
  [102048] = true, -- Rebellious Felguard
  [102052] = true, -- Rebellious imp
  -- BfA Dazar'Alor
  [144081] = true, -- Training Dummy
  [144082] = true, -- Training Dummy
  [144085] = true, -- Training Dummy
  [144086] = true, -- Raider's Training Dummy
  -- BfA Boralus
  [126781] = true, -- Training Dummy
  [131983] = true, -- Raider's Training Dummy
  [131989] = true, -- Training Dummy
  [131992] = true, -- Dungeoneer's Training Dummy
  -- Shadowlands Kyrian
  [154564] = true, -- Valiant's Humility
  [154567] = true, -- Purity's Cleaning
  [154580] = true, -- Reinforced Guardian
  [154583] = true, -- Starlwart Guardian
  [154585] = true, -- Valiant's Resolve
  [154586] = true, -- Stalwart Phalanx
  [160325] = true, -- Humility's Obedience
  -- Shadowlands Venthyr
  [173942] = true, -- Training Dummy
  [175449] = true, -- Raider's Training Dummy
  [175450] = true, -- Dungeoneer's Training Dummy
  [175451] = true, -- Dungeoneer's Tanking Dummy
  [175452] = true, -- Raider's Tanking Dummy
  [175455] = true, -- Cleave Training Dummy
  [175456] = true, -- Swarm Training Dummy
  [175462] = true, -- Sinfall Fiend
  -- Shadowlands Night Fae
  [174565] = true, -- Dungeoneer's Tanking Dummy
  [174566] = true, -- Raider's Tanking Dummy
  [174567] = true, -- Raider's Training Dummy
  [174568] = true, -- Dungeoneer's Training Dummy
  [174569] = true, -- Training Dummy
  [174570] = true, -- Swarm Training Dummy
  [174571] = true, -- Cleave Training Dummy
  -- Shadowlands Necrolord
  [174484] = true, -- Dungeoneer's Training Dummy
  [174487] = true, -- Training Dummy
  [174488] = true, -- Raider's Training Dummy
  [174491] = true, -- Tanking Dummy
  -- DargonFlight Valdrakken
  [198594] = true, -- Cleave Training Dummy
  [194648] = true, -- Training Dummy
  [189632] = true, -- Animated Duelist
  [194643] = true, -- Dungeoneer's Training Dummy
  [194644] = true, -- Dungeoneer's Training Dummy
  [197833] = true, -- PvP Training Dummy
  [189617] = true, -- Boulderfist
  [194649] = true, -- Normal Tank Dummy
  -- DargonFlight Iskaara
  [193563] = true, -- Training Dummy
  -- Other
  [65310] = true, -- Turnip Punching Bag (toy)
  [66374] = true, -- Anatomical Dummy (toy)
  [196394] = true, -- Tuskarr Training Dummy (toy)
  [196406] = true, -- Rubbery Fish Head (toy)
  [199057] = true, -- Black Dragon's Challenge Dummy (toy)
}
function unit:IsDummy()
  local npcid = self:NPCID()

  return npcid >= 0 and dummyUnits[npcid] == true
end

function unit:IsAPlayer()
  return UnitIsPlayer(self.unitID)
end

function unit:Health()
  return UnitHealth(self.unitID) or -1
end

function unit:MaxHealth()
  return UnitHealthMax(self.unitID) or -1
end

function unit:HealthPercentage()
  local health = self:Health()
  local maxHealth = self:MaxHealth()

  return health > 0 and maxHealth > 0 and health / maxHealth * 100 or -1
end

function unit:IsDeadOrGhost()
  return UnitIsDeadOrGhost(self.unitID)
end

function unit:AffectingCombat()
  return UnitAffectingCombat(self.unitID)
end

function unit:IsUnit(other)
  return UnitIsUnit(self.unitID, other.unitID)
end

function unit:Classification()
  return UnitClassification(self.unitID) or ""
end

function unit:IsTanking(other, threatThreshold)
  local threatSituation = UnitThreatSituation(self:ID(), other:ID())

  return (threatSituation and threatSituation >= (threatThreshold or 2)) or false
end

function unit:IsTankingAoE(radius, threatSituation)
  local isTankingAOE = false
  for _, thisUnit in pairs(player:GetEnemiesInRange(radius or 6.5)) do
    if self:IsTanking(thisUnit, threatSituation) then
      isTankingAOE = true
    end
  end

  return isTankingAOE
end

function unit:IsMoving()
  return GetUnitSpeed(self.unitID) ~= 0
end
