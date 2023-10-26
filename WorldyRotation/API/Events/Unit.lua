local api = WR.api
local unit = api.unit
local target = unit.target

do
  local nameplateUnits = unit.nameplate

  api:RegisterForEvent(function(event, unitID)
    nameplateUnits[unitID]:Cache()
  end, "NAME_PLATE_UNIT_ADDED")
  api:RegisterForEvent(function(event, unitID)
    nameplateUnits[unitID]:Init()
  end, "NAME_PLATE_UNIT_REMOVED")
end

api:RegisterForEvent(function()
  target:Cache()
end, "PLAYER_TARGET_CHANGED")

do
  local focus = unit.focus

  api:RegisterForEvent(function()
    focus:Cache()
  end, "PLAYER_FOCUS_CHANGED")
end

do
  local arenaUnits = unit.arena

  api:RegisterForEvent(
      function(event, unitID)
        local arenaUnit = arenaUnits[unitID]
        if arenaUnit then
          arenaUnit:Cache()
        end
      end,
      "ARENA_OPPONENT_UPDATE"
  )
end

do
  local bossUnits = unit.boss

  api:RegisterForEvent(
      function()
        for _, bossUnit in pairs(bossUnits) do
          bossUnit:Cache()
        end
      end,
      "INSTANCE_ENCOUNTER_ENGAGE_UNIT"
  )
end

api:RegisterForEvent(
    function()
      for _, partyUnit in pairs(unit.party) do
        partyUnit:Cache()
      end
      for _, raidUnit in pairs(unit.raid) do
        raidUnit:Cache()
      end
    end,
    "GROUP_ROSTER_UPDATE"
)
-- TODO: Need to maybe also update friendly units with:
-- PARTY_MEMBER_ENABLE
-- PARTY_MEMBER_DISABLE

-- General Unit Target Updated
do
  local focus = unit.focus
  local bossUnits, partyUnits, raidUnits, nameplateUnits = unit.boss, unit.party, unit.raid, unit.nameplate

  api:RegisterForEvent(
      function(event, unitID)
        if unitID == target:ID() then
          target:Cache()
        elseif unitID == focus:ID() then
          focus:Cache()
        else
          local foundUnit = partyUnits[unitID] or raidUnits[unitID] or bossUnits[unitID] or nameplateUnits[unitID]
          if foundUnit then
            foundUnit:Cache()
          end
        end
      end,
      "UNIT_TARGETABLE_CHANGED", "UNIT_FACTION", "UNIT_FLAGS"
  )
end
