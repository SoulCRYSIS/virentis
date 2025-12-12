local virentis_tile = require("prototypes.tiles.tile-utils")

local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")


data:extend({
  {
    type = "tile",
    name = "virentis-deep-water",
    subgroup = "virentis-water-tiles",
    collision_mask = tile_collision_masks.water(),
    autoplace = { probability_expression = "10 * virentis_select(elevation, -500, virentis_deep_water_level, 0.5, 0, 1) + 10 * virentis_rockpools_deepwater" },
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
      empty_transitions = true,
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
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = virentis_tile.pollution_absorption.water,
  }
})
