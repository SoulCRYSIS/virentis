local virentis_tile = require("prototypes.tiles.tile-utils")

local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

data:extend({
  {
    type = "tile",
    name = "virentis-wetland-dead-skin",
    subgroup = "virentis-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = { probability_expression = "virentis_shallows_aux_2 + 2 * min(virentis_select(virentis_aux, 0.3, 0.7, 0.005, 0, 1), virentis_rockpools_shallow)" },
    lowland_fog = true,
    effect = "oil-water-dark",
    effect_color = { 57, 58, 73 },
    effect_color_secondary = { 76, 70, 79 },
    map_color = { r = 46, g = 45, b = 51 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 7,
    layer_group = "water-overlay",
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
    walking_sound = tile_sounds.walking.wetland,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({}),
      tile_sounds.ambient.night_insects,
    },
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = virentis_tile.pollution_absorption.water,
  },
  {
    type = "tile",
    name = "virentis-wetland-light-dead-skin",
    subgroup = "virentis-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = { probability_expression = "virentis_shallows_edge_aux_2 + 2 * min(virentis_select(virentis_aux, 0.3, 0.7, 0.005, 0, 1), virentis_rockpools_shallow)" },
    lowland_fog = true,
    effect = "oil-water-dark",
    effect_color = { 78, 75, 86 },
    effect_color_secondary = { 76, 70, 79 },
    tint = {255, 20, 20, 255},
    map_color = { r = 51, g = 50, b = 56 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 7,
    layer_group = "water-overlay",
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
    walking_sound = tile_sounds.walking.wetland,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({}),
      tile_sounds.ambient.night_insects,
    },
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = virentis_tile.pollution_absorption.water,
  },
  {
    type = "tile",
    name = "virentis-wetland-mud",
    subgroup = "virentis-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = { probability_expression = "virentis_fertile_spots_coastal * 5000 * (1 - virentis_biome_mask_green) * virentis_above_deep_water_mask" },
    default_cover_tile = "landfill",
    lowland_fog = true,
    effect = "wetland-green",
    fluid = "water",
    effect_color = { 68, 54, 47 },
    effect_color_secondary = { 68, 54, 47 },
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
  {
    type = "tile",
    name = "virentis-wetland-mud-slime",
    subgroup = "virentis-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = { probability_expression = "virentis_shallows_aux_1 + 2 * min(virentis_select(virentis_aux, 0, 0.3, 0.005, 0, 1), virentis_rockpools_shallow)" },
    lowland_fog = true,
    effect = "wetland-green",
    effect_color = { 80, 60, 45 },
    effect_color_secondary = { 39, 70, 24 },
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
    transitions = { virentis_tile.lava_to_out_of_map_transition },
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
    absorptions_per_second = virentis_tile.pollution_absorption.water,
  },
  {
    type = "tile",
    name = "virentis-wetland-light-mud-slime",
    subgroup = "virentis-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = { probability_expression = "virentis_shallows_edge_aux_1 + 2 * min(virentis_select(virentis_aux, 0, 0.3, 0.005, 0, 1), virentis_rockpools_shallow)" },
    lowland_fog = true,
    effect = "wetland-green",
    effect_color = { 100, 75, 55 },
    effect_color_secondary = { 49, 80, 14 },
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
    transitions = { virentis_tile.lava_to_out_of_map_transition },
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
    absorptions_per_second = virentis_tile.pollution_absorption.water,
  },
  {
    type = "tile",
    name = "virentis-wetland-red-tentacle",
    subgroup = "virentis-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = { probability_expression = "virentis_shallows_aux_3 + 2 * min(virentis_select(virentis_aux, 0.7, 2, 0.005, 0, 1), virentis_rockpools_shallow)" },
    lowland_fog = true,
    effect = "oil-water-dark",
    effect_color = { 69, 53, 78 },
    effect_color_secondary = { 49, 80, 14 },
    map_color = { 54, 15, 24 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 5,
    layer_group = "water-overlay",
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
    walking_sound = tile_sounds.walking.wetland,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds = tile_sounds.ambient.insects_deep_mud({}),
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = virentis_tile.pollution_absorption.water,
  },
  {
    type = "tile",
    name = "virentis-wetland-pink-tentacle",
    subgroup = "virentis-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = { probability_expression = "virentis_shallows_edge_aux_3" },
    lowland_fog = true,
    effect = "oil-water-dark",
    effect_color = { 85, 64, 88 },
    effect_color_secondary = { 60, 60, 40 },
    map_color = { 64, 19, 34 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 5,
    layer_group = "water-overlay",
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
    -- variants = table.deepcopy(data.raw.tile["oil-ocean-deep"].variants),
    transitions = { virentis_tile.lava_to_out_of_map_transition },
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.wetland,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds = tile_sounds.ambient.insects_deep_mud({}),
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = virentis_tile.pollution_absorption.water,
  },
  {
    type = "tile",
    name = "virentis-wetland-blue-slime",
    subgroup = "virentis-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = { probability_expression = "6 * virentis_select(virentis_elevation, virentis_deep_water_level, -4, 0.5, 0, 1)" },
    lowland_fog = true,
    effect = "wetland-blue-slime",
    effect_color = { 45, 63, 70 },
    effect_color_secondary = { 49, 80, 14 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 1,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water/water1.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      -- empty_transitions = true,
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = { virentis_tile.lava_to_out_of_map_transition },
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = virentis_tile.sound_variations("__base__/sound/walking/shallow-water", 7, 1),
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.waterlap,
      tile_sounds.ambient.rain_on_water,
    },
    map_color = { 40, 60, 70 },
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = virentis_tile.pollution_absorption.water,
  },
  {
    type = "tile",
    name = "virentis-deep-water",
    subgroup = "virentis-water-tiles",
    collision_mask = tile_collision_masks.water(),
    autoplace = { probability_expression = "10 * virentis_select(elevation, -500, virentis_deep_water_level, 0.5, 0, 1)" },
    lowland_fog = false,
    effect = "wetland-blue-slime",
    effect_color = { 31, 51, 60 },
    effect_color_secondary = { 49, 80, 14 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 1,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater1.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = { virentis_tile.lava_to_out_of_map_transition },
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = virentis_tile.sound_variations("__base__/sound/walking/shallow-water", 7, 1),
    landing_steps_sound = tile_sounds.landing.wet,
    ambient_sounds =
    {
      tile_sounds.ambient.waterlap,
      tile_sounds.ambient.rain_on_water,
    },
    map_color = { 18, 37, 51 },
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "foundation",
    fluid = "water",
    absorptions_per_second = virentis_tile.pollution_absorption.water,
  }
})
