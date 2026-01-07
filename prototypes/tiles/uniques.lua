local virentis_tile = require("prototypes.tiles.tile-utils")

local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local fulgora_rock_sand_transitions = table.deepcopy(data.raw["tile"]["fulgoran-rock"].transitions)
fulgora_rock_sand_transitions[1].to_tiles = virentis_tile.land_tiles
fulgora_rock_sand_transitions[1].background_layer_group = "ground-natural"

local oil_sand_transitions = table.deepcopy(data.raw["tile"]["oil-ocean-shallow"].transitions)
oil_sand_transitions[1].to_tiles = virentis_tile.water_tiles

data:extend(
---@type data.TilePrototype[]
  {
    -- natural-yumako-soil
    {
      type = "tile",
      name = "mangroove-fertile-soil",
      subgroup = "virentis-tiles",
      searchable = true,
      collision_mask = tile_collision_masks.ground(),
      autoplace = { probability_expression = "virentis_fertile_solid * 50000 - 40000 - virentis_biome_mask_green * 1000000" },
      layer_group = "ground-natural",
      layer = virentis_tile.tile_offset + 20,
      tint = { 0.8, 0.7, 0.7, 1.0 },

      transitions = virentis_tile.lava_stone_transitions,
      transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
      trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

      sprite_usage_surface = "gleba",
      variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
        "__space-age__/graphics/terrain/natural-yumako-soil.png",
        "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
        {
          max_size = 4,
          [1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
          [2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
          [4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        }
      ),

      walking_sound = tile_sounds.walking.semi_wet,
      landing_steps_sound = tile_sounds.landing.semi_wet,
      build_sound = base_tile_sounds.building.landfill,
      map_color = { 185, 166, 5 },
      scorch_mark_color = { r = 0.329, g = 0.242 * 2, b = 0.177, a = 1.000 }
    },
    -- highland-yellow-rock
    {
      type = "tile",
      name = "rockmalt-fertile-soil",
      subgroup = "virentis-tiles",
      searchable = true,
      collision_mask = tile_collision_masks.ground(),
      layer = virentis_tile.tile_offset + 21,
      sprite_usage_surface = "gleba",
      variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
        "__space-age__/graphics/terrain/gleba/pit-rock.png",
        "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
        {
          max_size = 4,
          [1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
          [2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
          [4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
          --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
        }
      ),
      autoplace = { probability_expression = "max(virentis_starting_rockmalt * 10, (virentis_highland - virentis_town_raw) * virentis_fertile_spots_coastal_raw(2, 32) * 50000 - 30000)" },
      transitions = virentis_tile.lava_stone_transitions,
      transitions_between_transitions = virentis_tile.lava_stone_transitions_between_transitions,
      walking_sound = tile_sounds.walking.dry_rock,
      landing_steps_sound = tile_sounds.landing.rock,
      map_color = { 30, 33, 26 },
      walking_speed_modifier = 1,
      vehicle_friction_modifier = 1,
      absorptions_per_second = virentis_tile.pollution_absorption.land,
      trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
    },
    {
      type = "tile",
      name = "redbloom-fertile-soil",
      subgroup = "virentis-tiles",
      searchable = true,
      collision_mask = tile_collision_masks.ground(),
      layer_group = "ground-natural",
      layer = virentis_tile.tile_offset + 12,
      autoplace = { probability_expression = "virentis_starting_redbloom * 10 + ( virentis_fertile_spots_coastal_raw(3, 32) + 0.4 ) * virentis_midland * virentis_select(virentis_aux, 0.8, 1, 0.15, 0, 1) * (0.93 + 0.1 * virentis_select(virentis_moisture, 0.5, 0.5, 0.25, 0, 1) - 0.1 * virentis_temperature_normalised)" },
      sprite_usage_surface = "gleba",
      variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
        "__virentis__/graphics/tiles/redbloom-fertile-soil.png",
        "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
        {
          max_size = 4,
          [1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
          [2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
          [4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
          --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
        }
      ),
      transitions = virentis_tile.lava_stone_transitions,
      transitions_between_transitions = virentis_tile.lava_stone_transitions_between_transitions,
      walking_sound = tile_sounds.walking.dry_rock,
      landing_steps_sound = tile_sounds.landing.rock,
      map_color = { 191, 34, 23 },
      walking_speed_modifier = 1,
      vehicle_friction_modifier = 1,
      absorptions_per_second = virentis_tile.pollution_absorption.land,
      trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
    },
    {
      type = "tile",
      name = "nyxoleum-fertile-soil",
      subgroup = "virentis-tiles",
      collision_mask = tile_collision_masks.ground(),
      autoplace = {
        probability_expression = "virentis_fertile_solid * 50000 - 40000 - virentis_biome_mask_red * 1000000"
      },
      layer_group = "ground-natural",
      layer = 9,
      searchable = true,
      lowland_fog = false,
      transitions = oil_sand_transitions,
      transitions_between_transitions = table.deepcopy(data.raw.tile["oil-ocean-shallow"]
        .transitions_between_transitions),
      trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

      sprite_usage_surface = "gleba",
      variants = table.deepcopy(data.raw.tile["oil-ocean-shallow"].variants),

      walking_sound = base_tile_sounds.walking.oil({ volume = 1.0 }),
      landing_steps_sound = tile_sounds.landing.oil,
      driving_sound = base_tile_sounds.driving.oil,
      map_color = { 185, 5, 166 },
      scorch_mark_color = { r = 0.329, g = 0.242 * 2, b = 0.177, a = 1.000 }
    },
    {
      type = "tile",
      name = "tar-puddle",
      subgroup = "virentis-water-tiles",
      searchable = true,
      collision_mask = tile_collision_masks.oil_ocean_deep(),
      layer_group = "water",
      autoplace = {
        probability_expression =
        "virentis_fertile_spots_coastal * 5000 * (1 - virentis_biome_mask_red) * virentis_above_deep_water_mask"
      },
      lowland_fog = false,
      effect = "tar-puddle",
      fluid = "tar",
      effect_color = { 85, 64, 88 },
      effect_color_secondary = { 60, 60, 40 },
      particle_tints = tile_graphics.fulgora_oil_ocean_particle_tints,
      layer = 8,
      sprite_usage_surface = "gleba",
      variants = table.deepcopy(data.raw.tile["oil-ocean-deep"].variants),
      transitions = oil_sand_transitions,
      transitions_between_transitions = table.deepcopy(data.raw.tile["oil-ocean-shallow"]
        .transitions_between_transitions),

      walking_sound = base_tile_sounds.walking.oil({ volume = 1.0 }),
      landing_steps_sound = tile_sounds.landing.oil,
      driving_sound = base_tile_sounds.driving.oil,
      scorch_mark_color = { r = 0.3, g = 0.3, b = 0.3, a = 1.000 },
      trigger_effect = tile_trigger_effects.sand_trigger_effect(),
      map_color = { 31, 7, 13 },
    },
    {
      type = "tile",
      name = "town-floor-edge",
      subgroup = "virentis-tiles",
      collision_mask = tile_collision_masks.ground(),
      walking_speed_modifier = 1.4,
      layer = virentis_tile.tile_offset + 19,
      layer_group = "ground-natural",
      variants = table.deepcopy(data.raw.tile["fulgoran-rock"].variants),
      transitions = fulgora_rock_sand_transitions,
      transitions_between_transitions = table.deepcopy(data.raw.tile["fulgoran-rock"].transitions_between_transitions),

      autoplace = {
        probability_expression = "virentis_town_raw * 10"
      },

      walking_sound = tile_sounds.walking.concrete,
      landing_steps_sound = tile_sounds.landing.concrete,
      map_color = { 100, 45, 45 },
      scorch_mark_color = { r = 0.373, g = 0.307, b = 0.243, a = 1.000 },
      trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
    },
    {
      type = "tile",
      name = "town-floor-center",
      subgroup = "virentis-tiles",
      searchable = true,
      collision_mask = tile_collision_masks.ground(),
      walking_speed_modifier = 1.4,
      layer = virentis_tile.tile_offset + 20,
      layer_group = "ground-natural",
      variants = table.deepcopy(data.raw.tile["fulgoran-paving"].variants),
      transitions = fulgora_rock_sand_transitions,
      transitions_between_transitions = table.deepcopy(data.raw.tile["fulgoran-paving"].transitions_between_transitions),

      autoplace = {
        probability_expression = "(virentis_town_rural + virentis_town_center) * 15"
      },

      walking_sound = tile_sounds.walking.concrete,
      landing_steps_sound = tile_sounds.landing.concrete,
      map_color = { 100, 45, 45 },
      scorch_mark_color = { r = 0.373, g = 0.307, b = 0.243, a = 1.000 },
      trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
    },
  })
