local virentis_tile = require("prototypes.tiles.tile-utils")

local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

data:extend({
  {
    type = "tile",
    name = "virentis-midland-cracked-lichen",
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer_group = "ground-natural",
    layer = virentis_tile.tile_offset + 8,
    autoplace = {probability_expression = "virentis_midland * virentis_select(virentis_aux, 0.55, 0.65, 0.15, 0, 1) - 0.2 * virentis_temperature_normalised"},
    sprite_usage_surface = "gleba",
    variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
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
    transitions = virentis_tile.lava_stone_transitions,
    transitions_between_transitions = virentis_tile.lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_bark,
    landing_steps_sound = tile_sounds.landing.bark,
    map_color={81, 77, 44},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = virentis_tile.pollution_absorption.land,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  {
    type = "tile",
    name = "virentis-midland-cracked-lichen-dull",
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer_group = "ground-natural",
    layer = virentis_tile.tile_offset + 9,
    autoplace = {probability_expression = "virentis_midland * virentis_select(virentis_aux, 0.45, 0.55, 0.15, 0, 1) + 0.2 * virentis_temperature_normalised"},
    sprite_usage_surface = "gleba",
    variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
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
    transitions = virentis_tile.lava_stone_transitions,
    transitions_between_transitions = virentis_tile.lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_bark,
    landing_steps_sound = tile_sounds.landing.bark,
    map_color={71, 67, 40},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = virentis_tile.pollution_absorption.land,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  {
    type = "tile",
    name = "virentis-midland-cracked-lichen-dark",
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer_group = "ground-natural",
    layer = virentis_tile.tile_offset,
    autoplace = {probability_expression = "max(1.08 * virentis_midland * virentis_select(virentis_aux, 0, 0.55, 0.1, 0, 1), 1.15 * virentis_highland) + 0.3 * (virentis_plants_noise_b - 0.7)"},
    sprite_usage_surface = "gleba",
    variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
      "__space-age__/graphics/terrain/gleba/cracked-lichen-dark.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),
    transitions = virentis_tile.lava_stone_transitions,
    transitions_between_transitions = virentis_tile.lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_bark,
    landing_steps_sound = tile_sounds.landing.bark,
    map_color={61, 57, 30},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = virentis_tile.pollution_absorption.land,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  ----------- Turqoise Bark
  {
    type = "tile",
    name = "virentis-midland-turquoise-bark-2",
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer = virentis_tile.tile_offset + 10,
    sprite_usage_surface = "gleba",
    variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
      "__space-age__/graphics/terrain/gleba/midland-turquoise-bark-2.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),
    autoplace = {probability_expression = "virentis_midland * virentis_select(virentis_aux, 0.05, 0.4, 0.2, 0, 1) - 0.2 * virentis_temperature_normalised"},
    transitions = virentis_tile.lava_stone_transitions,
    transitions_between_transitions = virentis_tile.lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_bark,
    landing_steps_sound = tile_sounds.landing.bark,
    map_color={46, 68, 48},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = virentis_tile.pollution_absorption.land,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  {
    type = "tile",
    name = "virentis-midland-turquoise-bark",
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer = virentis_tile.tile_offset + 11,
    sprite_usage_surface = "gleba",
    variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
      "__space-age__/graphics/terrain/gleba/midland-turquoise-bark.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),
    autoplace = {probability_expression = "virentis_midland * virentis_select(virentis_aux, 0, 0.35, 0.2, 0, 1) + 0.2 * virentis_temperature_normalised"},
    transitions = virentis_tile.lava_stone_transitions,
    transitions_between_transitions = virentis_tile.lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_bark,
    landing_steps_sound = tile_sounds.landing.bark,
    map_color={46, 68, 48},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = virentis_tile.pollution_absorption.land,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  ----------- Starburst
  {
    type = "tile",
    name = "virentis-midland-yellow-crust-3", -- beige
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer_group = "ground-natural",
    layer = virentis_tile.tile_offset + 12,
    autoplace = {probability_expression = "virentis_midland * virentis_select(virentis_aux, 0.65, 1, 0.1, 0, 1)"},
    sprite_usage_surface = "gleba",
    variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
      "__space-age__/graphics/terrain/gleba/starburst-lichen-3.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),
    transitions = virentis_tile.lava_stone_transitions,
    transitions_between_transitions = virentis_tile.lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.dry_rock,
    landing_steps_sound = tile_sounds.landing.rock,
    map_color={114, 86, 40},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = virentis_tile.pollution_absorption.land,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  {
    type = "tile",
    name = "virentis-midland-yellow-crust-2", -- red
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer_group = "ground-natural",
    layer = virentis_tile.tile_offset + 13,
    autoplace = {probability_expression = "virentis_midland * virentis_select(virentis_aux, 0.8, 1, 0.15, 0, 1) * (0.93 + 0.1 * virentis_select(virentis_moisture, 0.5, 0.5, 0.25, 0, 1) - 0.1 * virentis_temperature_normalised)"},
    sprite_usage_surface = "gleba",
    variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
      "__space-age__/graphics/terrain/gleba/starburst-lichen-2.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),
    transitions = virentis_tile.lava_stone_transitions,
    transitions_between_transitions = virentis_tile.lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.dry_rock,
    landing_steps_sound = tile_sounds.landing.rock,
    map_color={114, 86, 40},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = virentis_tile.pollution_absorption.land,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  {
    type = "tile",
    name = "virentis-midland-yellow-crust", -- main
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer_group = "ground-natural",
    layer = virentis_tile.tile_offset + 14,
    autoplace = {probability_expression = "virentis_midland * virentis_select(virentis_aux, 0.7, 1, 0.1, 0, 1) * (1 + 0.1 * (virentis_aux - 0.75) + 0.05 * virentis_plants_noise_b)"},
    sprite_usage_surface = "gleba",
    variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
      "__space-age__/graphics/terrain/gleba/starburst-lichen.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),
    transitions = virentis_tile.lava_stone_transitions,
    transitions_between_transitions = virentis_tile.lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.dry_rock,
    landing_steps_sound = tile_sounds.landing.rock,
    map_color={114, 86, 40},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = virentis_tile.pollution_absorption.land,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  {
    type = "tile",
    name = "virentis-midland-yellow-crust-4", -- yellow
    subgroup = "virentis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer_group = "ground-natural",
    layer = virentis_tile.tile_offset + 15,
    autoplace = {probability_expression = "virentis_midland * virentis_select(virentis_aux, 0.8, 1, 0.15, 0, 1) * (0.9 + 0.1 * virentis_select(virentis_moisture, 0.25, 0.25, 0.25, 0, 1) + 0.1 * virentis_temperature_normalised)"},
    sprite_usage_surface = "gleba",
    variants = virentis_tile.tile_variations_template_with_transitions_and_effect_map(
      "__space-age__/graphics/terrain/gleba/starburst-lichen-4.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),
    transitions = virentis_tile.lava_stone_transitions,
    transitions_between_transitions = virentis_tile.lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.dry_rock,
    landing_steps_sound = tile_sounds.landing.rock,
    map_color={114, 86, 40},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = virentis_tile.pollution_absorption.land,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
})