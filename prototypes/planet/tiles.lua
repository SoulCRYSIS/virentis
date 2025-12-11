local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local virentis_tile_offset = 100
local virentis_lowland_tile_offset = 100

---@diagnostic disable-next-line: undefined-global
local lava_to_out_of_map_transition = space_age_tiles_util.lava_to_out_of_map_transition
---@diagnostic disable-next-line: undefined-global
local lava_stone_transitions_between_transitions = space_age_tiles_util.lava_stone_transitions_between_transitions
---@diagnostic disable-next-line: undefined-global
local tile_variations_template_with_transitions_and_effect_map = tile_variations_template_with_transitions_and_effect_map
---@diagnostic disable-next-line: undefined-global
local lava_stone_transitions = lava_stone_transitions

data:extend({
  {
    type = "tile",
    name = "virentis-mudland-shallow-water",
    order = "e",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = { probability_expression = "virentis_shallows_aux_1 + 2 * min(virentis_select(virentis_aux, 0, 0.3, 0.005, 0, 1), virentis_rockpools_shallow)" },
    lowland_fog = true,
    effect = "oil-deep",
    --effect_color = {50,66,66},
    --effect_color_secondary = { 49, 80, 14 },
    effect_color = { 48, 39, 37 },
    effect_color_secondary = {255, 0, 0 },
    map_color = { 25, 53, 25 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 6,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-green-slime.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = { lava_to_out_of_map_transition },
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.slime,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({}),
      tile_sounds.ambient.night_frogs,
    },
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = tile_pollution.gleba_water,
  },
  {
    type = "tile",
    name = "virentis-mudland-shallow-water-edge",
    order = "e",
    subgroup = "virentis-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = { probability_expression = "virentis_shallows_edge_aux_1 + 2 * min(virentis_select(virentis_aux, 0, 0.3, 0.005, 0, 1), virentis_rockpools_shallow)" },
    lowland_fog = true,
    effect = "wetland-grey",
    effect_color = { 0, 0, 0 },
    effect_color_secondary = { 0, 255, 0 },
    map_color = { 35, 63, 35 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 6,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-green-slime.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = { lava_to_out_of_map_transition },
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.slime,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({}),
      tile_sounds.ambient.night_frogs,
    },
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = tile_pollution.gleba_water,
  },
  {
    type = "tile",
    name = "virentis-fertile-soil",
    order = "e",
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer_group = "ground-natural",
    layer = virentis_tile_offset + 8,
    autoplace = {probability_expression = "virentis_midland * virentis_select(virentis_aux, 0.55, 0.65, 0.15, 0, 1) - 0.2 * virentis_temperature_normalised"},
    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions_and_effect_map(
      "__space-age__/graphics/terrain/gleba/cracked-lichen.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_bark,
    landing_steps_sound = tile_sounds.landing.bark,
    map_color={81, 77, 44},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.gleba,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  {
    type = "tile",
    name = "virentis-fertile-soil-2",
    order = "e",
    subgroup = "gleba-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer_group = "ground-natural",
    layer = virentis_tile_offset + 9,
    autoplace = {probability_expression = "virentis_midland * virentis_select(virentis_aux, 0.45, 0.55, 0.15, 0, 1) + 0.2 * virentis_temperature_normalised"},
    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions_and_effect_map(
      "__space-age__/graphics/terrain/gleba/cracked-lichen-dull.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_bark,
    landing_steps_sound = tile_sounds.landing.bark,
    map_color={71, 67, 40},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.gleba,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  -- {
  --   type = "tile",
  --   name = "virentis-fertile-soil-3",
  --   order = "e",
  --   subgroup = "virentis-tiles",
  --   collision_mask = tile_collision_masks.ground(),
  --   layer_group = "ground-natural",
  --   layer = virentis_tile_offset + 9,
  --   autoplace = {probability_expression = "max(1.08 * virentis_midland * virentis_select(virentis_aux, 0, 0.55, 0.1, 0, 1), 1.15 * virentis_highland) + 0.3 * (virentis_plants_noise_b - 0.7)"},
  --   sprite_usage_surface = "gleba",
  --   variants = tile_variations_template_with_transitions_and_effect_map(
  --     "__space-age__/graphics/terrain/gleba/cracked-lichen-dark.png",
  --     "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
  --     {
  --       max_size = 4,
  --       [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
  --       [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
  --       [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
  --       --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
  --     }
  --   ),
  --   transitions = lava_stone_transitions,
  --   transitions_between_transitions = lava_stone_transitions_between_transitions,
  --   walking_sound = tile_sounds.walking.soft_bark,
  --   landing_steps_sound = tile_sounds.landing.bark,
  --   map_color={61, 57, 30},
  --   walking_speed_modifier = 1,
  --   vehicle_friction_modifier = 1,
  --   absorptions_per_second = tile_pollution.gleba,
  --   trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  -- },
})
