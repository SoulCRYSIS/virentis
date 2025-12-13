local virentis_tile = require("prototypes.tiles.tile-utils")

local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

data:extend({
  -- natural-jellynut-soil
  {
    type = "tile",
    name = "mudland-fertile-soil",
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = { probability_expression = "virentis_fertile_solid * 50000 - 40000 - virentis_biome_mask_green * 1000000" },
    layer_group = "ground-natural",
    layer = virentis_tile.tile_offset + 21,
    searchable = true,
    tint = { 0.9, 0.55, 0.45, 1.0 },
    effect = "wetland-green-puddle",
    effect_is_opaque = false,
    effect_color = { 50, 66, 66 },
    effect_color_secondary = { 49, 80, 14 },

    transitions = virentis_tile.lava_stone_transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    sprite_usage_surface = "gleba",
    variants = virentis_tile.lowland_tile_variations_template_with_transitions_and_puddle_transitions(
      "__space-age__/graphics/terrain/gleba/lowland-olive-blubber.png",
      {
        max_size = 4,
        [1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),

    walking_sound = tile_sounds.walking.semi_wet,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    build_sound = base_tile_sounds.building.landfill,
    map_color = { 81, 77, 44 },
    scorch_mark_color = { r = 0.200, g = 0.196, b = 0.110, a = 1.000 }
  },
  -- wetland-yumako
  {
    type = "tile",
    name = "mudland-fertile-water",
    subgroup = "virentis-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = { probability_expression = "virentis_fertile_spots_coastal * 5000 * (1 - virentis_biome_mask_green) * virentis_above_deep_water_mask" },
    default_cover_tile = "landfill",
    lowland_fog = true,
    effect = "mudland-slime",
    fluid = "water",
    effect_color = { 68, 54, 47 },
    effect_color_secondary = { 0, 0, 0 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer_group = "water-overlay",
    layer = 3,
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-dead-skin.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = { virentis_tile.lava_to_out_of_map_transition },
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    map_color = { 69, 55, 52 },
    absorptions_per_second = virentis_tile.pollution_absorption.water,

    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,

    walking_sound = base_tile_sounds.walking.shallow_water,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds = tile_sounds.ambient.insects_deep_mud({ max_entity_count = 30, average_pause_seconds = 8 }),

    trigger_effect = tile_trigger_effects.water_mud_trigger_effect(),
  },
  -- natural-jellynut-soil
  {
    type = "tile",
    name = "oil-fertile-soil",
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = { probability_expression = "virentis_fertile_solid * 50000 - 40000 - virentis_biome_mask_red * 1000000" },
    layer_group = "ground-natural",
    layer = virentis_tile.tile_offset + 21,
    searchable = true,

    transitions = virentis_tile.lava_stone_transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

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

    walking_sound = tile_sounds.walking.semi_wet,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    build_sound = base_tile_sounds.building.landfill,
    map_color = { 185, 5, 166 },
    scorch_mark_color = { r = 0.329, g = 0.242 * 2, b = 0.177, a = 1.000 }
  },
  -- wetland-yumako
  {
    type = "tile",
    name = "tar-puddle",
    subgroup = "virentis-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    -- autoplace = { probability_expression = "virentis_fertile_spots_coastal * 5000 * (1 - virentis_biome_mask_red) * virentis_above_deep_water_mask" },
    autoplace = { probability_expression = "virentis_shallows_aux_3 + 2 * min(virentis_select(virentis_aux, 0.7, 2, 0.005, 0, 1), virentis_rockpools_shallow)" },
    default_cover_tile = "landfill",
    lowland_fog = true,
    effect = "tar-puddle",
    fluid = "tar",
    effect_color = { 30, 25, 28 },
    effect_color_secondary = { 117, 110, 38 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer_group = "water-overlay",
    layer = 3,
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-purple-tentacle.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = { virentis_tile.lava_to_out_of_map_transition },
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    map_color = { 132, 119, 7 },
    absorptions_per_second = virentis_tile.pollution_absorption.water,

    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,

    walking_sound = base_tile_sounds.walking.shallow_water,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds = tile_sounds.ambient.insects_deep_mud({ max_entity_count = 30, average_pause_seconds = 8 }),

    trigger_effect = tile_trigger_effects.water_mud_trigger_effect(),
  },
})
