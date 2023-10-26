local api = WR.api
local unit = api.unit
local player = unit.player
local pet = unit.pet
local target = unit.target
local spell = api.spell
local item = api.item

local restoreDB = {}
local overrideDB = {}

function api.AddCoreOverride(t, newfunction, specKey)
  local loadOverrideFunc = assert(loadstring([[
      return function (func)
      ]] .. t .. [[ = func
      end, ]] .. t .. [[
      ]]))
  setfenv(loadOverrideFunc, { api = api, player = player, spell = spell, item = item, target = target, unit = unit, pet = pet })
  local overrideFunc, oldfunction = loadOverrideFunc()
  if overrideDB[specKey] == nil then
    overrideDB[specKey] = {}
  end
  table.insert(overrideDB[specKey], { overrideFunc, newfunction })
  table.insert(restoreDB, { overrideFunc, oldfunction })
  return oldfunction
end

function api.LoadRestores()
  for _, v in pairs(restoreDB) do
    v[1](v[2])
  end
end

function api.LoadOverrides(specKey)
  if type(overrideDB[specKey]) == "table" then
    for _, v in pairs(overrideDB[specKey]) do
      v[1](v[2])
    end
  end
end
