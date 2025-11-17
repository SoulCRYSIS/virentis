local tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local space_age_tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")
local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")

local grass_transitions = data.raw.tile["grass-1"].transitions
local grass_transitions_between_transitions = data.raw.tile["grass-1"].transitions_between_transitions
local marsh_transitions = data.raw.tile["wetland-green-slime"].transitions
local water_transition = data.raw.tile["water"].transitions_between_transitions

data:extend({
  {
    name = "virentis-plain-grass",
    type = "tile",
    subgroup = "virentis-tiles",
    order = "c",
    collision_mask = { layers = { ground_tile = true } },
    autoplace = { probability_expression = 'expression_in_range_base(-10, 0.7, 11, 11) + noise_layer_noise(19)' },
    layer = 26,
    variants = tile_variations_template(
      "__virentis__/graphic/tile/virentis-plain-grass.png", "__base__/graphics/terrain/masks/transition-3.png",
      {
        max_size = 4,
        [1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 0.91, weights = { 0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
        [4] = { probability = 0.91, weights = { 0.100, 0.80, 0.80, 0.100, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01 }, }
      }
    ),
    transitions = grass_transitions,
    transitions_between_transitions = grass_transitions_between_transitions,
    walking_sound = tile_sounds.walking.grass,
    driving_sound = tile_sounds.driving.grass,
    landing_steps_sound = space_age_tile_sounds.landing.grass,
    map_color = { 0.380, 0.427, 0.078 },
    scorch_mark_color = { 0.318, 0.222, 0.152 },
    walking_speed_modifier = 1.2,
    vehicle_friction_modifier = 1.5,
    absorptions_per_second = { pollution = 0.000015 },
    trigger_effect = tile_trigger_effects.grass_1_trigger_effect(),
  },
})
