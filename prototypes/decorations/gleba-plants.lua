local virentis_tile = require("prototypes.tiles.tile-utils")

local slipstack = table.deepcopy(data.raw["tree"]["slipstack"])
slipstack.name = "virentis-slipstack"
slipstack.autoplace.probability_expression = "virentis_slipstack_probability"
slipstack.autoplace.control = "virentis_plants"
slipstack.autoplace.tile_restriction = virentis_tile.all_tiles_exclude_oil_and_town

local cuttlepop = table.deepcopy(data.raw["tree"]["cuttlepop"])
cuttlepop.name = "virentis-cuttlepop"
cuttlepop.autoplace.probability_expression = "virentis_cuttlepop_probability"
cuttlepop.autoplace.control = "virentis_plants"
cuttlepop.autoplace.tile_restriction = virentis_tile.all_tiles_exclude_oil_and_town

data:extend({ slipstack, cuttlepop })