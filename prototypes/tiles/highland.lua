local virentis_tile = require("prototypes.tiles.tile-utils")

local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

data:extend({
  {
    type = "tile",
    name = "virentis-highland-dark-rock",
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer = virentis_tile.tile_offset + 16,
    sprite_usage_surface = "gleba",
    variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
      "__space-age__/graphics/terrain/gleba/highland-dark-rock.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),
    autoplace = { probability_expression = "virentis_highland * max(0, 1.05 + 0.1 * (1 - virentis_aux) + 0.2 * virentis_temperature_normalised)" },
    transitions = virentis_tile.lava_stone_transitions,
    transitions_between_transitions = virentis_tile.lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.dry_rock,
    landing_steps_sound = tile_sounds.landing.rock,
    map_color = { 52, 55, 48 },
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = virentis_tile.pollution_absorption.land,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  {
    type = "tile",
    name = "virentis-highland-dark-rock-2",
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer = virentis_tile.tile_offset + 17,
    sprite_usage_surface = "gleba",
    variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
      "__space-age__/graphics/terrain/gleba/highland-dark-rock-2.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),
    autoplace = { probability_expression = "virentis_highland * max(0, 1.13 + 0.1 * (min(virentis_aux + 0.1, 1-virentis_aux)))" },
    transitions = virentis_tile.lava_stone_transitions,
    transitions_between_transitions = virentis_tile.lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.dry_rock,
    landing_steps_sound = tile_sounds.landing.rock,
    map_color = { 52, 55, 48 },
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = virentis_tile.pollution_absorption.land,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  {
    type = "tile",
    name = "virentis-highland-yellow-rock",
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer = virentis_tile.tile_offset + 18,
    sprite_usage_surface = "gleba",
    variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
      "__space-age__/graphics/terrain/gleba/highland-yellow-rock.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),
    autoplace = { probability_expression = "virentis_highland * max(0, 1 + 0.1 * virentis_aux - 0.2 * virentis_temperature_normalised)" },
    transitions = virentis_tile.lava_stone_transitions,
    transitions_between_transitions = virentis_tile.lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.dry_rock,
    landing_steps_sound = tile_sounds.landing.rock,
    map_color = { 52, 55, 48 },
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = virentis_tile.pollution_absorption.land,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
})
