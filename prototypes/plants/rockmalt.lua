local virentis_plant = require("prototypes.plants.plant-utils")

data:extend({
  {
    type = "plant",
    name = "rockmalt-tree",
    icon = "__virentis__/graphics/icons/plants/rockmalt-tree.png",
    subgroup = "virentis-plants",
    impact_category = "tree",

    order = "c",
    flags = virentis_plant.default_flags,
    growth_ticks = 5 * minute,
    harvest_emissions = virentis_plant.default_emission,
    healing_per_tick = 1,
    factoriopedia_simulation = virentis_plant.simulation("rockmalt", "rockmalt-fertile-soil"),
    minable = {
      mining_particle = "teflilly-mining-particle",
      mining_time = 0.5,
      results = {
        {
          type = "item",
          name = "rockmalt-fruit",
          amount = 5,
        },
        {
          type = "item",
          name = "herb",
          amount = 10,
        },
      },
      mining_trigger = virentis_plant.leaf_sound_trigger,
    },
    mining_sound = virentis_plant.sound_variations("__space-age__/sound/mining/axe-mining-teflilly", 5, 0.5),
    mined_sound = virentis_plant.sound_variations("__space-age__/sound/mining/mined-teflilly", 5, 0.5),
    max_health = 50,
    collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box = { { -0.75, -1.5 }, { 0.75, 0.5 } },
    drawing_box_vertical_extension = 0.8,
    autoplace = {
      control = "virentis_plants",
      probability_expression = "virentis_plants_probability",
      richness_expression = "random_penalty_at(3, 1)",
      tile_restriction = { "rockmalt-fertile-soil" }
    },
    variations = virentis_plant.tree_variations("rockmalt", 6, 3, 0.8, 360, 256, false, util.by_pixel(32, -25)),
    colors = virentis_plant.grey_tints(),
    ambient_sounds =
    {
      sound =
      {
        variations = virentis_plant.sound_variations("__space-age__/sound/world/plants/teflilly", 6, 0.5),
        advanced_volume_control =
        {
          fades = { fade_in = { curve_type = "cosine", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } }
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.2,
      average_pause_seconds = 8
    },
    map_color = { 240, 240, 255 },
  },
})
