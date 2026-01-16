local landfillable_tiles = {
  "virentis-wetland-dead-skin",
  "virentis-wetland-light-dead-skin",
  "virentis-wetland-mud",
  "virentis-wetland-mud-slime",
  "virentis-wetland-light-mud-slime",
  "virentis-wetland-red-tentacle",
  "virentis-wetland-pink-tentacle",
  "virentis-wetland-blue-slime",
  "tar-puddle",
}

for _, tile in pairs(landfillable_tiles) do
  table.insert(data.raw.item.landfill.place_as_tile.tile_condition, tile)
end

local foundationable_tiles = {
  "virentis-deep-water",
  table.unpack(landfillable_tiles),
}

for _, tile in pairs(foundationable_tiles) do
  table.insert(data.raw.item.foundation.place_as_tile.tile_condition, tile)
end