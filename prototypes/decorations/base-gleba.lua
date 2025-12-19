local land_tiles = {
  "mangroove-fertile-soil",
  "rockmalt-fertile-soil",
  "redbloom-fertile-soil",
  "nyxoleum-fertile-soil",
  "town-floor",
  "virentis-lowland-brown-blubber",
  "virentis-lowland-olive-blubber",
  "virentis-lowland-olive-blubber-2",
  "virentis-lowland-olive-blubber-3",
  "virentis-lowland-pale-green",
  "virentis-lowland-cream-cauliflower",
  "virentis-lowland-cream-cauliflower-2",
  "virentis-lowland-dead-skin",
  "virentis-lowland-dead-skin-2",
  "virentis-lowland-cream-red",
  "virentis-lowland-red-vein",
  "virentis-lowland-red-vein-2",
  "virentis-lowland-red-vein-3",
  "virentis-lowland-red-vein-4",
  "virentis-lowland-red-vein-dead",
  "virentis-lowland-red-infection",
  "virentis-midland-turquoise-bark",
  "virentis-midland-turquoise-bark-2",
  "virentis-midland-cracked-lichen",
  "virentis-midland-cracked-lichen-dull",
  "virentis-midland-cracked-lichen-dark",
  "virentis-midland-yellow-crust",
  "virentis-midland-yellow-crust-2",
  "virentis-midland-yellow-crust-3",
  "virentis-midland-yellow-crust-4",
  "virentis-highland-dark-rock",
  "virentis-highland-dark-rock-2",
  "virentis-highland-yellow-rock",
}

local land_tiles_exclude_town = {
  "mangroove-fertile-soil",
  "rockmalt-fertile-soil",
  "redbloom-fertile-soil",
  "virentis-lowland-brown-blubber",
  "virentis-lowland-olive-blubber",
  "virentis-lowland-olive-blubber-2",
  "virentis-lowland-olive-blubber-3",
  "virentis-lowland-pale-green",
  "virentis-lowland-cream-cauliflower",
  "virentis-lowland-cream-cauliflower-2",
  "virentis-lowland-dead-skin",
  "virentis-lowland-dead-skin-2",
  "virentis-lowland-cream-red",
  "virentis-lowland-red-vein",
  "virentis-lowland-red-vein-2",
  "virentis-lowland-red-vein-3",
  "virentis-lowland-red-vein-4",
  "virentis-lowland-red-vein-dead",
  "virentis-lowland-red-infection",
  "virentis-midland-turquoise-bark",
  "virentis-midland-turquoise-bark-2",
  "virentis-midland-cracked-lichen",
  "virentis-midland-cracked-lichen-dull",
  "virentis-midland-cracked-lichen-dark",
  "virentis-midland-yellow-crust",
  "virentis-midland-yellow-crust-2",
  "virentis-midland-yellow-crust-3",
  "virentis-midland-yellow-crust-4",
  "virentis-highland-dark-rock",
  "virentis-highland-dark-rock-2",
  "virentis-highland-yellow-rock",
}

local all_tiles_exclude_oil = {
  "mangroove-fertile-soil",
  "rockmalt-fertile-soil",
  "redbloom-fertile-soil",
  "virentis-lowland-brown-blubber",
  "virentis-lowland-olive-blubber",
  "virentis-lowland-olive-blubber-2",
  "virentis-lowland-olive-blubber-3",
  "virentis-lowland-pale-green",
  "virentis-lowland-cream-cauliflower",
  "virentis-lowland-cream-cauliflower-2",
  "virentis-lowland-dead-skin",
  "virentis-lowland-dead-skin-2",
  "virentis-lowland-cream-red",
  "virentis-lowland-red-vein",
  "virentis-lowland-red-vein-2",
  "virentis-lowland-red-vein-3",
  "virentis-lowland-red-vein-4",
  "virentis-lowland-red-vein-dead",
  "virentis-lowland-red-infection",
  "virentis-midland-turquoise-bark",
  "virentis-midland-turquoise-bark-2",
  "virentis-midland-cracked-lichen",
  "virentis-midland-cracked-lichen-dull",
  "virentis-midland-cracked-lichen-dark",
  "virentis-midland-yellow-crust",
  "virentis-midland-yellow-crust-2",
  "virentis-midland-yellow-crust-3",
  "virentis-midland-yellow-crust-4",
  "virentis-highland-dark-rock",
  "virentis-highland-dark-rock-2",
  "virentis-highland-yellow-rock",
  "virentis-wetland-dead-skin",
  "virentis-wetland-light-dead-skin",
  "virentis-wetland-mud",
  "virentis-wetland-mud-slime",
  "virentis-wetland-light-mud-slime",
  "virentis-wetland-red-tentacle",
  "virentis-wetland-pink-tentacle",
  "virentis-wetland-blue-slime"
}

local pink_lichen_decal = table.deepcopy(data.raw["optimized-decorative"]["pink-lichen-decal"])
pink_lichen_decal.name = "virentis-pink-lichen-decal"
pink_lichen_decal.autoplace = {
  probability_expression = "virentis_pink_lichen_probability"
}

local red_lichen_decal = table.deepcopy(data.raw["optimized-decorative"]["red-lichen-decal"])
red_lichen_decal.name = "virentis-red-lichen-decal"
red_lichen_decal.autoplace = {
  probability_expression =
  "grpi(0.3) + virentis_select(virentis_red_lichen - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.4, 0, 1)"
}

local yellow_lettuce_lichen_1x1 = table.deepcopy(data.raw["optimized-decorative"]["yellow-lettuce-lichen-1x1"])
yellow_lettuce_lichen_1x1.name = "virentis-yellow-lettuce-lichen-1x1"
yellow_lettuce_lichen_1x1.autoplace = { -- process: survival_chance + subtype_selection_band_of: (region_box - small_scale_knockout)
  order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
  probability_expression =
  "grpi(0.5) + virentis_select(virentis_yellow_lettuce - 0.6 * clamp(virentis_decorative_knockout, 0, 1), -0.6, -0.1, 0.1, 0, 1)"
}

local yellow_lettuce_lichen_3x3 = table.deepcopy(data.raw["optimized-decorative"]["yellow-lettuce-lichen-3x3"])
yellow_lettuce_lichen_3x3.name = "virentis-yellow-lettuce-lichen-3x3"
yellow_lettuce_lichen_3x3.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
  probability_expression =
  "grpi(0.5) + virentis_select(virentis_yellow_lettuce - 0.7 * clamp(virentis_decorative_knockout, 0, 1), 0.-0.1, 0.3, 0.1, 0, 1)"
}

local yellow_lettuce_lichen_6x6 = table.deepcopy(data.raw["optimized-decorative"]["yellow-lettuce-lichen-6x6"])
yellow_lettuce_lichen_6x6.name = "virentis-yellow-lettuce-lichen-6x6"
yellow_lettuce_lichen_6x6.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-a[inner]",
  probability_expression =
  "grpi(0.5) + virentis_select(virentis_yellow_lettuce - 0.8 * clamp(virentis_decorative_knockout, 0, 1), 0.3, 10, 0.1, 0, 1)"
}

local yellow_lettuce_lichen_cups_1x1 = table.deepcopy(data.raw["optimized-decorative"]["yellow-lettuce-lichen-cups-1x1"])
yellow_lettuce_lichen_cups_1x1.name = "virentis-yellow-lettuce-lichen-cups-1x1"
yellow_lettuce_lichen_cups_1x1.autoplace = {
  order = "d[decorative]-c[trivial]-d[cups]-c[outer]",
  tile_restriction = land_tiles_exclude_town,
  probability_expression =
  "grpi(0.3) + virentis_select(virentis_yellow_lettuce_cups - 0.7 * clamp(virentis_decorative_knockout, 0, 1), -0.5, -0.2, 0.1, 0, 1)"
}

local yellow_lettuce_lichen_cups_3x3 = table.deepcopy(data.raw["optimized-decorative"]["yellow-lettuce-lichen-cups-3x3"])
yellow_lettuce_lichen_cups_3x3.name = "virentis-yellow-lettuce-lichen-cups-3x3"
yellow_lettuce_lichen_cups_3x3.autoplace = {
  order = "d[decorative]-c[trivial]-d[cups]-b[mid-ring]",
  tile_restriction = land_tiles_exclude_town,
  probability_expression =
  "grpi(0.2) + virentis_select(virentis_yellow_lettuce_cups - 0.8 * clamp(virentis_decorative_knockout, 0, 1), -0.2, 0.2, 0.1, 0, 1)"
}

local yellow_lettuce_lichen_cups_6x6 = table.deepcopy(data.raw["optimized-decorative"]["yellow-lettuce-lichen-cups-6x6"])
yellow_lettuce_lichen_cups_6x6.name = "virentis-yellow-lettuce-lichen-cups-6x6"
yellow_lettuce_lichen_cups_6x6.autoplace = {
  order = "d[decorative]-c[trivial]-d[cups]-a[inner]",
  tile_restriction = land_tiles_exclude_town,
  probability_expression =
  "grpi(0.1) + virentis_select(virentis_yellow_lettuce_cups - 0.9 * clamp(virentis_decorative_knockout, 0, 1), 0.2, 0.5, 0.1, 0, 1)"
}

local honeycomb_fungus = table.deepcopy(data.raw["optimized-decorative"]["honeycomb-fungus"])
honeycomb_fungus.name = "virentis-honeycomb-fungus"
honeycomb_fungus.autoplace = {
  tile_restriction = land_tiles_exclude_town,
  probability_expression =
  "grpi(0.7) + min(virentis_decorative_subtype_mixer, virentis_select(virentis_honeycomb, 0.3, 2, 0.1, 0, 1))"
}

local honeycomb_fungus_1x1 = table.deepcopy(data.raw["optimized-decorative"]["honeycomb-fungus-1x1"])
honeycomb_fungus_1x1.name = "virentis-honeycomb-fungus-1x1"
honeycomb_fungus_1x1.autoplace = {
  tile_restriction = land_tiles_exclude_town,
  probability_expression =
  "grpi(0.4) + min(virentis_decorative_subtype_mixer, virentis_select(virentis_honeycomb, 0, 0.4, 0.1, 0, 1))"
}

local honeycomb_fungus_decayed = table.deepcopy(data.raw["optimized-decorative"]["honeycomb-fungus-decayed"])
honeycomb_fungus_decayed.name = "virentis-honeycomb-fungus-decayed"
honeycomb_fungus_decayed.autoplace = {
  tile_restriction = land_tiles_exclude_town,
  probability_expression =
  "grpi(0.2) + min(-virentis_decorative_subtype_mixer, virentis_select(virentis_honeycomb, 0, 0.5, 0.1, 0, 1))"
}

local green_lettuce_lichen_1x1 = table.deepcopy(data.raw["optimized-decorative"]["green-lettuce-lichen-1x1"])
green_lettuce_lichen_1x1.name = "virentis-green-lettuce-lichen-1x1"
green_lettuce_lichen_1x1.autoplace = { -- process: survival_chance + subtype_selection_band_of: (region_box - small_scale_knockout)
  tile_restriction = land_tiles,
  probability_expression =
  "grpi(0.3) + virentis_select(virentis_green_lettuce - 0.7 * clamp(virentis_decorative_knockout, 0, 1), -0.5, 0.1, 0.1, 0, 1)"
}

local green_lettuce_lichen_3x3 = table.deepcopy(data.raw["optimized-decorative"]["green-lettuce-lichen-3x3"])
green_lettuce_lichen_3x3.name = "virentis-green-lettuce-lichen-3x3"
green_lettuce_lichen_3x3.autoplace = {
  tile_restriction = land_tiles,
  probability_expression =
  "grpi(0.3) + virentis_select(virentis_green_lettuce - 0.8 * clamp(virentis_decorative_knockout, 0, 1), 0.1, 0.4, 0.1, 0, 1)"
}

local green_lettuce_lichen_6x6 = table.deepcopy(data.raw["optimized-decorative"]["green-lettuce-lichen-6x6"])
green_lettuce_lichen_6x6.name = "virentis-green-lettuce-lichen-6x6"
green_lettuce_lichen_6x6.autoplace = {
  tile_restriction = land_tiles,
  probability_expression =
  "grpi(0.3) + virentis_select(virentis_green_lettuce - 0.9 * clamp(virentis_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)"
}

local green_lettuce_lichen_water_1x1 = table.deepcopy(data.raw["optimized-decorative"]["green-lettuce-lichen-water-1x1"])
green_lettuce_lichen_water_1x1.name = "virentis-green-lettuce-lichen-water-1x1"
green_lettuce_lichen_water_1x1.autoplace = { -- process: survival_chance + subtype_selection_band_of: (region_box - small_scale_knockout)
  order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
  probability_expression =
  "grpi(0.3) + virentis_water_plant_ramp * virentis_select(virentis_green_lettuce - 0.7 * clamp(virentis_decorative_knockout, 0, 1), -0.5, 0.1, 0.1, 0, 1)"
}

local green_lettuce_lichen_water_3x3 = table.deepcopy(data.raw["optimized-decorative"]["green-lettuce-lichen-water-3x3"])
green_lettuce_lichen_water_3x3.name = "virentis-green-lettuce-lichen-water-3x3"
green_lettuce_lichen_water_3x3.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
  tile_restriction = all_tiles_exclude_oil,
  probability_expression =
  "grpi(0.3) + virentis_water_plant_ramp * virentis_select(virentis_green_lettuce - 0.8 * clamp(virentis_decorative_knockout, 0, 1), 0.1, 0.4, 0.1, 0, 1)"
}

local green_lettuce_lichen_water_6x6 = table.deepcopy(data.raw["optimized-decorative"]["green-lettuce-lichen-water-6x6"])
green_lettuce_lichen_water_6x6.name = "virentis-green-lettuce-lichen-water-6x6"
green_lettuce_lichen_water_6x6.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-a[inner]",
  tile_restriction = all_tiles_exclude_oil,
  probability_expression =
  "grpi(0.3) + virentis_water_plant_ramp * virentis_select(virentis_green_lettuce - 0.9 * clamp(virentis_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)"
}

local split_gill_1x1 = table.deepcopy(data.raw["optimized-decorative"]["split-gill-1x1"])
split_gill_1x1.name = "virentis-split-gill-1x1"
split_gill_1x1.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
  tile_restriction = land_tiles_exclude_town,
  probability_expression =
  "grpi(0.5) + virentis_select(0.4 + virentis_split_gill + 0.2 * virentis_decorative_knockout, -0.5, 0.2, 0.1, 0, 1)"
}

local split_gill_2x2 = table.deepcopy(data.raw["optimized-decorative"]["split-gill-2x2"])
split_gill_2x2.name = "virentis-split-gill-2x2"
split_gill_2x2.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
  tile_restriction = land_tiles_exclude_town,
  probability_expression =
  "grpi(0.6) + virentis_select(0.4 + virentis_split_gill + 0.3 * virentis_decorative_knockout, 0.2, 2, 0.1, 0, 1)"
}

local split_gill_dying_1x1 = table.deepcopy(data.raw["optimized-decorative"]["split-gill-dying-1x1"])
split_gill_dying_1x1.name = "virentis-split-gill-dying-1x1"
split_gill_dying_1x1.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
  tile_restriction = land_tiles_exclude_town,
  probability_expression =
  "grpi(0.5) + virentis_select(0.4 + virentis_split_gill_dying + 0.2 * virentis_decorative_knockout, -0.5, 0.2, 0.1, 0, 1)"
}

local split_gill_dying_2x2 = table.deepcopy(data.raw["optimized-decorative"]["split-gill-dying-2x2"])
split_gill_dying_2x2.name = "virentis-split-gill-dying-2x2"
split_gill_dying_2x2.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
  tile_restriction = land_tiles_exclude_town,
  probability_expression =
  "grpi(0.6) + virentis_select(0.4 + virentis_split_gill_dying + 0.3 * virentis_decorative_knockout, 0.2, 2, 0.1, 0, 1)"
}

local split_gill_red_1x1 = table.deepcopy(data.raw["optimized-decorative"]["split-gill-red-1x1"])
split_gill_red_1x1.name = "virentis-split-gill-red-1x1"
split_gill_red_1x1.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
  tile_restriction = land_tiles_exclude_town,
  probability_expression =
  "grpi(0.5) + virentis_select(0.4 + virentis_split_gill_red + 0.2 * virentis_decorative_knockout, -0.5, 0.2, 0.1, 0, 1)"
}

local split_gill_red_2x2 = table.deepcopy(data.raw["optimized-decorative"]["split-gill-red-2x2"])
split_gill_red_2x2.name = "virentis-split-gill-red-2x2"
split_gill_red_2x2.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
  tile_restriction = land_tiles_exclude_town,
  probability_expression =
  "grpi(0.6) + virentis_select(0.4 + virentis_split_gill_red + 0.3 * virentis_decorative_knockout, 0.2, 2, 0.1, 0, 1)"
}

local fuchsia_pita = table.deepcopy(data.raw["optimized-decorative"]["fuchsia-pita"])
fuchsia_pita.name = "virentis-fuchsia-pita"
fuchsia_pita.autoplace = {
  tile_restriction = land_tiles,
  probability_expression =
  "grpi(0.7) + virentis_select(virentis_fuchsia_pita - clamp(virentis_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)"
}

local wispy_lichen = table.deepcopy(data.raw["optimized-decorative"]["wispy-lichen"])
wispy_lichen.name = "virentis-wispy-lichen"
wispy_lichen.autoplace = {
  placement_density = 2,
  probability_expression =
  "grpi(0.7) + virentis_select(virentis_wispy_lichen - 0.5 * clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
}

local coral_land = table.deepcopy(data.raw["optimized-decorative"]["coral-land"])
coral_land.name = "virentis-coral-land"
coral_land.autoplace = {
  tile_restriction = all_tiles_exclude_oil,
  placement_density = 2,
  probability_expression =
  "grpi(0.5) + virentis_select(virentis_corals - clamp(virentis_decorative_knockout, 0, 1), 0.3, 2, 0.1, 0, 1)"
}

local coral_water = table.deepcopy(data.raw["optimized-decorative"]["coral-water"])
coral_water.name = "virentis-coral-water"
coral_water.autoplace = {
  tile_restriction = all_tiles_exclude_oil,
  placement_density = 2,
  probability_expression =
  "grpi(0.7) + virentis_water_plant_ramp * virentis_select(virentis_corals - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
}

local black_sceptre = table.deepcopy(data.raw["optimized-decorative"]["black-sceptre"])
black_sceptre.name = "virentis-black-sceptre"
black_sceptre.autoplace = {
  tile_restriction = land_tiles_exclude_town,
  placement_density = 2,
  probability_expression =
  "grpi(0.5) + virentis_select(virentis_black_sceptre - clamp(virentis_decorative_knockout, 0, 1), 0.8, 2, 0.3, 0, 1)"
}

local pink_phalanges = table.deepcopy(data.raw["optimized-decorative"]["pink-phalanges"])
pink_phalanges.name = "virentis-pink-phalanges"
pink_phalanges.autoplace = {
  placement_density = 2,
  probability_expression =
  "grpi(0.6) + virentis_select(virentis_pink_phalanges - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
}

local green_cup = table.deepcopy(data.raw["optimized-decorative"]["green-cup"])
green_cup.name = "virentis-green-cup"
green_cup.autoplace = {
  placement_density = 2,
  probability_expression =
  "grpi(0.6) + virentis_select(virentis_green_cup - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.2, 0, 1)"
}

local mycelium = table.deepcopy(data.raw["optimized-decorative"]["mycelium"])
mycelium.name = "virentis-mycelium"
mycelium.autoplace = {
  probability_expression =
  "grpi(0.5) + virentis_select(virentis_mycelium - clamp(virentis_decorative_knockout, 0, 1), 0.1, 2, 0.2, 0, 1)"
}

local veins = table.deepcopy(data.raw["optimized-decorative"]["veins"])
veins.name = "virentis-veins"
veins.autoplace = {
  probability_expression =
  "grpi(0.5) + virentis_select(virentis_veins - clamp(virentis_decorative_knockout, 0, 1), -0.1, 0.3, 0.1, 0, 1)"
}

local veins_small = table.deepcopy(data.raw["optimized-decorative"]["veins-small"])
veins_small.name = "virentis-veins-small"
veins_small.autoplace = {
  probability_expression =
  "grpi(0.5) + virentis_select(virentis_veins - clamp(virentis_decorative_knockout, 0, 1), 0.3, 2, 0.1, 0, 1)"
}

local brambles = table.deepcopy(data.raw["optimized-decorative"]["brambles"])
brambles.name = "virentis-brambles"
brambles.autoplace = {
  probability_expression =
  "grpi(0.8) + virentis_select(virentis_bramble_vines - clamp(virentis_decorative_knockout, 0, 1), 0.0, 0.4, 0.1, 0, 1)"
}

local blood_grape = table.deepcopy(data.raw["optimized-decorative"]["blood-grape"])
blood_grape.name = "virentis-blood-grape"
blood_grape.autoplace = {
  placement_density = 2,
  probability_expression =
  "grpi(0.4) + virentis_select(virentis_bramble_grapes - clamp(virentis_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)"
}

local blood_grape_vibrant = table.deepcopy(data.raw["optimized-decorative"]["blood-grape-vibrant"])
blood_grape_vibrant.name = "virentis-blood-grape-vibrant"
blood_grape_vibrant.autoplace = {
  placement_density = 2,
  probability_expression =
  "grpi(0.4) + virentis_select(virentis_bramble_grapes_vibrant - clamp(virentis_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)"
}

local brown_cup = table.deepcopy(data.raw["optimized-decorative"]["brown-cup"])
brown_cup.name = "virentis-brown-cup"
brown_cup.autoplace = {
  placement_density = 2,
  probability_expression =
  "grpi(0.7) + virentis_select(virentis_brown_cup - clamp(virentis_decorative_knockout, 0, 1), 0.6, 2, 0.1, 0, 1)"
}

local polycephalum_slime = table.deepcopy(data.raw["optimized-decorative"]["polycephalum-slime"])
polycephalum_slime.name = "virentis-polycephalum-slime"
polycephalum_slime.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
  probability_expression =
  "virentis_select(virentis_polycephalum - clamp(-virentis_decorative_knockout, 0, 1), 0.9, 2, 0.2, 0, 1)"
}

local polycephalum_balloon = table.deepcopy(data.raw["optimized-decorative"]["polycephalum-balloon"])
polycephalum_balloon.name = "virentis-polycephalum-balloon"
polycephalum_balloon.autoplace = {
  order = "d[decorative]-c[trivial]-b[bush]-a[inner]",
  probability_expression =
  "grpi(0.6) + virentis_select(virentis_polycephalum - clamp(-virentis_decorative_knockout, 0, 1), 1, 2, 0.2, 0, 1)"
}

local grey_cracked_mud_decal = table.deepcopy(data.raw["optimized-decorative"]["grey-cracked-mud-decal"])
grey_cracked_mud_decal.name = "virentis-grey-cracked-mud-decal"
grey_cracked_mud_decal.autoplace = {
  tile_restriction = land_tiles_exclude_town,
  probability_expression =
  "grpi(0.08) + virentis_select(virentis_grey_cracked_mud - clamp(virentis_decorative_knockout, 0, 1), 0.1, 2, 0.1, 0, 1)"
}

local yellow_coral = table.deepcopy(data.raw["optimized-decorative"]["yellow-coral"])
yellow_coral.name = "virentis-yellow-coral"
yellow_coral.autoplace = {
  probability_expression =
  "grpi(0.2) + virentis_select(virentis_yellow_coral - 0.5 * clamp(virentis_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)"
}

local solo_barnacle = table.deepcopy(data.raw["optimized-decorative"]["solo-barnacle"])
solo_barnacle.name = "virentis-solo-barnacle"
solo_barnacle.autoplace = {
  tile_restriction = land_tiles_exclude_town,
  placement_density = 2,
  probability_expression =
  "grpi(0.6) + virentis_select(virentis_barnacle_solo - 0.5 * clamp(virentis_decorative_knockout, 0, 1), 0.6, 2, 0.1, 0, 1)"
}

local curly_roots_orange = table.deepcopy(data.raw["optimized-decorative"]["curly-roots-orange"])
curly_roots_orange.name = "virentis-curly-roots-orange"
curly_roots_orange.autoplace = {
  tile_restriction = land_tiles_exclude_town,
  probability_expression = "grpi(0.1) + virentis_select(virentis_curly_orange_roots, 0.5, 2, 0.5, 0, 1)"
}

local curly_roots_grey = table.deepcopy(data.raw["optimized-decorative"]["curly-roots-grey"])
curly_roots_grey.name = "virentis-curly-roots-grey"
curly_roots_grey.autoplace = {
  probability_expression = 0
}

local pale_lettuce_lichen_cups_1x1 = table.deepcopy(data.raw["optimized-decorative"]["pale-lettuce-lichen-cups-1x1"])
pale_lettuce_lichen_cups_1x1.name = "virentis-pale-lettuce-lichen-cups-1x1"
pale_lettuce_lichen_cups_1x1.autoplace = {
  order = "d[decorative]-c[trivial]-d[cups]-c[outer]",
  placement_density = 2,
  probability_expression =
  "grpi(0.3) + virentis_water_plant_ramp * virentis_select(virentis_purple_cups - 0.7 * clamp(virentis_decorative_knockout, 0, 1), -0.5, -0.1, 0.1, 0, 1)"
}

local pale_lettuce_lichen_cups_3x3 = table.deepcopy(data.raw["optimized-decorative"]["pale-lettuce-lichen-cups-3x3"])
pale_lettuce_lichen_cups_3x3.name = "virentis-pale-lettuce-lichen-cups-3x3"
pale_lettuce_lichen_cups_3x3.autoplace = {
  order = "d[decorative]-c[trivial]-d[cups]-b[mid-ring]",
  probability_expression =
  "grpi(0.2) + virentis_water_plant_ramp * virentis_select(virentis_purple_cups - 0.8 * clamp(virentis_decorative_knockout, 0, 1), -0.1, 0.2, 0.1, 0, 1)"
}

local pale_lettuce_lichen_cups_6x6 = table.deepcopy(data.raw["optimized-decorative"]["pale-lettuce-lichen-cups-6x6"])
pale_lettuce_lichen_cups_6x6.name = "virentis-pale-lettuce-lichen-cups-6x6"
pale_lettuce_lichen_cups_6x6.autoplace = {
  order = "d[decorative]-c[trivial]-d[cups]-a[inner]",
  probability_expression =
  "grpi(0.1) + virentis_water_plant_ramp * virentis_select(virentis_purple_cups - 0.9 * clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
}

local pale_lettuce_lichen_1x1 = table.deepcopy(data.raw["optimized-decorative"]["pale-lettuce-lichen-1x1"])
pale_lettuce_lichen_1x1.name = "virentis-pale-lettuce-lichen-1x1"
pale_lettuce_lichen_1x1.autoplace = { -- process: survival_chance + subtype_selection_band_of: (region_box - small_scale_knockout)
  order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
  tile_restriction = land_tiles,
  probability_expression =
  "grpi(0.2) + virentis_select(virentis_pale_lettuce - 0.7 * clamp(virentis_decorative_knockout, 0, 1), -0.6, -0.1, 0.1, 0, 1)"
}

local pale_lettuce_lichen_3x3 = table.deepcopy(data.raw["optimized-decorative"]["pale-lettuce-lichen-3x3"])
pale_lettuce_lichen_3x3.name = "virentis-pale-lettuce-lichen-3x3"
pale_lettuce_lichen_3x3.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
  tile_restriction = land_tiles,
  probability_expression =
  "grpi(0.2) + virentis_select(virentis_pale_lettuce - 0.8 * clamp(virentis_decorative_knockout, 0, 1), -0.2, 0.4, 0.1, 0, 1)"
}

local pale_lettuce_lichen_6x6 = table.deepcopy(data.raw["optimized-decorative"]["pale-lettuce-lichen-6x6"])
pale_lettuce_lichen_6x6.name = "virentis-pale-lettuce-lichen-6x6"
pale_lettuce_lichen_6x6.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-a[inner]",
  tile_restriction = land_tiles,
  probability_expression =
  "grpi(0.3) + virentis_select(virentis_pale_lettuce - 0.9 * clamp(virentis_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)"
}

local pale_lettuce_lichen_water_1x1 = table.deepcopy(data.raw["optimized-decorative"]["pale-lettuce-lichen-water-1x1"])
pale_lettuce_lichen_water_1x1.name = "virentis-pale-lettuce-lichen-water-1x1"
pale_lettuce_lichen_water_1x1.autoplace = { -- process: survival_chance + subtype_selection_band_of: (region_box - small_scale_knockout)
  order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
  probability_expression =
  "grpi(0.1) + virentis_water_plant_ramp * virentis_select(virentis_pale_lettuce - 0.7 * clamp(virentis_decorative_knockout, 0, 1), -0.5, 0.1, 0.1, 0, 1)"
}

local pale_lettuce_lichen_water_3x3 = table.deepcopy(data.raw["optimized-decorative"]["pale-lettuce-lichen-water-3x3"])
pale_lettuce_lichen_water_3x3.name = "virentis-pale-lettuce-lichen-water-3x3"
pale_lettuce_lichen_water_3x3.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
  probability_expression =
  "grpi(0.2) + virentis_water_plant_ramp * virentis_select(virentis_pale_lettuce - 0.8 * clamp(virentis_decorative_knockout, 0, 1), 0.1, 0.5, 0.1, 0, 1)"
}

local pale_lettuce_lichen_water_6x6 = table.deepcopy(data.raw["optimized-decorative"]["pale-lettuce-lichen-water-6x6"])
pale_lettuce_lichen_water_6x6.name = "virentis-pale-lettuce-lichen-water-6x6"
pale_lettuce_lichen_water_6x6.autoplace = {
  order = "d[decorative]-c[trivial]-c[cover]-a[inner]",
  probability_expression =
  "grpi(0.3) + virentis_water_plant_ramp * virentis_select(virentis_pale_lettuce - 0.9 * clamp(virentis_decorative_knockout, 0, 1), 0.5, 2, 0.1, 0, 1)"
}

local matches_small = table.deepcopy(data.raw["optimized-decorative"]["matches-small"])
matches_small.name = "virentis-matches-small"
matches_small.autoplace = {
  placement_density = 2,
  probability_expression =
  "grpi(0.6) + virentis_select(region_box + 0.3 * virentis_scrub_noise + 0.7 * virentis_temperature_normalised - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)",
  local_expressions =
  {
    region_box =
    "min(virentis_select(virentis_aux, 0.65, 2, 0.05, -10, 1), virentis_select(virentis_moisture, 0.25, 0.55, 0.01, -10, 1), virentis_select(virentis_temperature_normalised, 0.5, 2, 0.3, -10, 1)) - 1"
  }
}

local nerve_roots_dense = table.deepcopy(data.raw["optimized-decorative"]["nerve-roots-dense"])
nerve_roots_dense.name = "virentis-nerve-roots-dense"
nerve_roots_dense.autoplace = {
  probability_expression = 0
}

local nerve_roots_sparse = table.deepcopy(data.raw["optimized-decorative"]["nerve-roots-sparse"])
nerve_roots_sparse.name = "virentis-nerve-roots-sparse"
nerve_roots_sparse.autoplace = {
  probability_expression = 0
}

local red_nerve_roots_veins_dense = table.deepcopy(data.raw["optimized-decorative"]["red-nerve-roots-veins-dense"])
red_nerve_roots_veins_dense.name = "virentis-red-nerve-roots-veins-dense"
red_nerve_roots_veins_dense.autoplace = {
  tile_restriction = { "lowland-red-vein-2", "lowland-red-vein-3", "lowland-red-vein-4" },
  probability_expression =
  "grpi(0.2) + virentis_select(virentis_nerve_veins + virentis_temperature_normalised  - clamp(virentis_decorative_knockout, 0, 1), 0.6, 2, 0.1, 0, 1)",
}

local red_nerve_roots_veins_sparse = table.deepcopy(data.raw["optimized-decorative"]["red-nerve-roots-veins-sparse"])
red_nerve_roots_veins_sparse.name = "virentis-red-nerve-roots-veins-sparse"
red_nerve_roots_veins_sparse.autoplace = {
  tile_restriction = { "lowland-red-vein-2", "lowland-red-vein-3", "lowland-red-vein-4" },
  probability_expression =
  "grpi(0.2) + virentis_select(virentis_nerve_veins + virentis_temperature_normalised  - clamp(virentis_decorative_knockout, 0, 1), 0.2, 0.6, 0.2, 0, 1)",
}

local purple_nerve_roots_veins_dense = table.deepcopy(data.raw["optimized-decorative"]["purple-nerve-roots-veins-dense"])
purple_nerve_roots_veins_dense.name = "virentis-purple-nerve-roots-veins-dense"
purple_nerve_roots_veins_dense.autoplace = {
  tile_restriction = { "wetland-jellynut" },
  probability_expression =
  "grpi(0.1) + virentis_select(virentis_nerve_veins + virentis_temperature_normalised  - clamp(virentis_decorative_knockout, 0, 1), 0.2, 0.6, 0.2, 0, 0.8)",
}

local purple_nerve_roots_veins_sparse = table.deepcopy(data.raw["optimized-decorative"]
  ["purple-nerve-roots-veins-sparse"])
purple_nerve_roots_veins_sparse.name = "virentis-purple-nerve-roots-veins-sparse"
purple_nerve_roots_veins_sparse.autoplace = {
  tile_restriction = { "wetland-jellynut", "lowland-red-vein-dead", "wetland-red-tentacle" },
  probability_expression =
  "grpi(0.1) + virentis_select(virentis_nerve_veins + virentis_temperature_normalised  - clamp(virentis_decorative_knockout, 0, 1), 0.2, 0.6, 0.2, 0, 1)",
}

local cream_nerve_roots_veins_dense = table.deepcopy(data.raw["optimized-decorative"]["cream-nerve-roots-veins-dense"])
cream_nerve_roots_veins_dense.name = "virentis-cream-nerve-roots-veins-dense"
cream_nerve_roots_veins_dense.autoplace = {
  tile_restriction = { "lowland-cream-red", "lowland-red-vein", "lowland-red-infection" },
  probability_expression =
  "grpi(0.2) + virentis_select(virentis_nerve_veins + virentis_temperature_normalised  - clamp(virentis_decorative_knockout, 0, 1), 0.6, 2, 0.1, 0, 1)",
}

local cream_nerve_roots_veins_sparse = table.deepcopy(data.raw["optimized-decorative"]["cream-nerve-roots-veins-sparse"])
cream_nerve_roots_veins_sparse.name = "virentis-cream-nerve-roots-veins-sparse"
cream_nerve_roots_veins_sparse.autoplace = {
  tile_restriction = { "lowland-cream-cauliflower", "lowland-dead-skin", "lowland-cream-red", "lowland-red-vein", "lowland-red-infection" },
  probability_expression =
  "grpi(0.2) + virentis_select(virentis_nerve_veins + virentis_temperature_normalised  - clamp(virentis_decorative_knockout, 0, 1), 0.2, 0.6, 0.2, 0, 1)",
}

local white_carpet_grass = table.deepcopy(data.raw["optimized-decorative"]["white-carpet-grass"])
white_carpet_grass.name = "virentis-white-carpet-grass"
white_carpet_grass.autoplace = {
  order = "a[doodad]-f[grass]-c",
  probability_expression =
  "grpi(0.2) + virentis_select(virentis_white_grass - clamp(virentis_decorative_knockout, 0, 1), 0.5, 2, 0.5, 0, 1)"
}

local barnacles_decal = table.deepcopy(data.raw["optimized-decorative"]["barnacles-decal"])
barnacles_decal.name = "virentis-barnacles-decal"
barnacles_decal.autoplace = {
  tile_restriction = land_tiles_exclude_town,
  probability_expression =
  "grpi(0.2) + virentis_select(virentis_barnacles - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
}

local coral_stunted_grey = table.deepcopy(data.raw["optimized-decorative"]["coral-stunted-grey"])
coral_stunted_grey.name = "virentis-coral-stunted-grey"
coral_stunted_grey.autoplace = {
  tile_restriction = land_tiles_exclude_town,
  probability_expression = "virentis_coral_stunted_grey"
}

local coral_stunted = table.deepcopy(data.raw["optimized-decorative"]["coral-stunted"])
coral_stunted.name = "virentis-coral-stunted"
coral_stunted.autoplace = {
  tile_restriction = land_tiles_exclude_town,
  probability_expression = "min(0.2, virentis_coral_stunted)"
}

local gleba_spawner_slime = table.deepcopy(data.raw["optimized-decorative"]["gleba-spawner-slime"])
gleba_spawner_slime.name = "virentis-gleba-spawner-slime"
gleba_spawner_slime.autoplace = { -- based on funnel trunk
  probability_expression = "2 * virentis_funnel_trunk_region"
}

local knobbly_roots = table.deepcopy(data.raw["optimized-decorative"]["knobbly-roots"])
knobbly_roots.name = "virentis-knobbly-roots"
knobbly_roots.autoplace = { -- based on funnel trunk
  probability_expression = "2 * virentis_funnel_trunk_region"
}

local knobbly_roots_orange = table.deepcopy(data.raw["optimized-decorative"]["knobbly-roots-orange"])
knobbly_roots_orange.name = "virentis-knobbly-roots-orange"
knobbly_roots_orange.autoplace = { -- based on boom puff
  probability_expression = "2 * virentis_boompuff_region"
}
-- local iron_stromatolite = table.deepcopy(data.raw["optimized-decorative"]["iron-stromatolite"])
-- iron_stromatolite.name = "virentis-iron-stromatolite"
-- iron_stromatolite.autoplace = {
--       probability_expression = "virentis_select(virentis_iron_stromatolite - clamp(virentis_decorative_knockout, 0, 1), 1.3, 2, 0.2, 0, 1)"
--     }
-- local copper_stromatolite = table.deepcopy(data.raw["optimized-decorative"]["copper-stromatolite"])
-- copper_stromatolite.name = "virentis-copper-stromatolite"
-- copper_stromatolite.autoplace = {
--       probability_expression = "virentis_select(virentis_copper_stromatolite - clamp(virentis_decorative_knockout, 0, 1), 1.3, 2, 0.2, 0, 1)"
--     }

data:extend {
  red_lichen_decal,
  pink_lichen_decal,
  yellow_lettuce_lichen_1x1,
  yellow_lettuce_lichen_3x3,
  yellow_lettuce_lichen_6x6,
  yellow_lettuce_lichen_cups_1x1,
  yellow_lettuce_lichen_cups_3x3,
  yellow_lettuce_lichen_cups_6x6,
  honeycomb_fungus,
  honeycomb_fungus_1x1,
  honeycomb_fungus_decayed,
  green_lettuce_lichen_1x1,
  green_lettuce_lichen_3x3,
  green_lettuce_lichen_6x6,
  green_lettuce_lichen_water_1x1,
  green_lettuce_lichen_water_3x3,
  green_lettuce_lichen_water_6x6,
  split_gill_1x1,
  split_gill_2x2,
  split_gill_dying_1x1,
  split_gill_dying_2x2,
  split_gill_red_1x1,
  split_gill_red_2x2,
  fuchsia_pita,
  wispy_lichen,
  coral_land,
  coral_water,
  black_sceptre,
  pink_phalanges,
  green_cup,
  mycelium,
  veins,
  veins_small,
  brambles,
  blood_grape,
  blood_grape_vibrant,
  brown_cup,
  polycephalum_slime,
  polycephalum_balloon,
  grey_cracked_mud_decal,
  yellow_coral,
  solo_barnacle,
  curly_roots_orange,
  curly_roots_grey,
  pale_lettuce_lichen_cups_1x1,
  pale_lettuce_lichen_cups_3x3,
  pale_lettuce_lichen_cups_6x6,
  pale_lettuce_lichen_1x1,
  pale_lettuce_lichen_3x3,
  pale_lettuce_lichen_6x6,
  pale_lettuce_lichen_water_1x1,
  pale_lettuce_lichen_water_3x3,
  pale_lettuce_lichen_water_6x6,
  matches_small,
  nerve_roots_dense,
  nerve_roots_sparse,
  red_nerve_roots_veins_dense,
  red_nerve_roots_veins_sparse,
  purple_nerve_roots_veins_dense,
  purple_nerve_roots_veins_sparse,
  cream_nerve_roots_veins_dense,
  cream_nerve_roots_veins_sparse,
  white_carpet_grass,
  barnacles_decal,
  coral_stunted_grey,
  coral_stunted,
  gleba_spawner_slime,
  knobbly_roots,
  knobbly_roots_orange,
  -- iron_stromatolite,
  -- copper_stromatolite,
}
