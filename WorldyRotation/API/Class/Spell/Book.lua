local api = WR.api
local cache = WR.cache
local spell = api.spell

local function FindBookIndex(spellID, spellType)
  if spellType == "player" then
    for i = 1, GetNumSpellTabs() do
      local offset, numSpells, _, offSpec = select(3, GetSpellTabInfo(i))
      if offSpec == 0 then
        for j = 1, (offset + numSpells) do
          local currentSpellID = select(7, GetSpellInfo(j, BOOKTYPE_SPELL))
          if currentSpellID and currentSpellID == spellID then
            return j
          end
        end
      end
    end
  elseif spellType == "pet" then
    local numPetSpells = HasPetSpells()
    if numPetSpells then
      for i = 1, numPetSpells do
        local currentSpellID = select(7, GetSpellInfo(i, BOOKTYPE_PET))
        if currentSpellID and currentSpellID == spellID then
          return i
        end
      end
    end
  else
    error("Incorrect spellType.")
  end
end

function spell:BookIndex()
  local spellID = self.spellID
  local spellType = self.spellType

  local bookIndex = cache.persistent.bookIndex[spellType][spellID]
  if not bookIndex then
    bookIndex = FindBookIndex(spellID, spellType)
    cache.persistent.bookIndex[spellType][spellID] = bookIndex
  end

  return bookIndex
end

function spell:BookType()
  local spellType = self.spellType
  if spellType == "player" then
    return BOOKTYPE_SPELL
  elseif spellType == "pet" then
    return BOOKTYPE_PET
  else
    error("Incorrect spellType.")
  end
end
