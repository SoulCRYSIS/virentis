local virentis_plant = require("prototypes.plants.plant-utils")

data:extend({
  {
    type = "plant",
    name = "mangroove-tree",
    icon = "__virentis__/graphics/icons/plants/mangroove-tree.png",
    subgroup = "virentis-plants",
    impact_category = "tree",
    order = "c",
    flags = virentis_plant.default_flags,
    growth_ticks = 5 * minute,
    harvest_emissions = virentis_plant.default_emission,
    healing_per_tick = 1,
    factoriopedia_simulation = virentis_plant.simulation("mangroove", "mangroove-fertile-soil"),
    minable = {
      mining_particle = "teflilly-mining-particle",
      mining_time = 0.5,
      results = {
        {
          type = "item",
          name = "mangroove-fruit",
          amount = 50,
        },
        {
          type = "item",
          name = "living-wood",
          amount = 10,
        },
      },
      mining_trigger = virentis_plant.leaf_sound_trigger,
    },
    mining_sound = virentis_plant.sound_variations("__space-age__/sound/mining/axe-mining-teflilly", 5, 0.5),
    mined_sound = virentis_plant.sound_variations("__space-age__/sound/mining/mined-teflilly", 5, 0.5),
    max_health = 50,
    collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box = { { -1, -3 }, { 1, 0.5 } },
    drawing_box_vertical_extension = 0.8,
    autoplace = {
      control = "virentis_plants",
      probability_expression = "virentis_plants_probability",
      richness_expression = "random_penalty_at(3, 1)",
      tile_restriction = { "mangroove-fertile-soil" }
    },
    variations = virentis_plant.tree_variations("mangroove", 6, 3, 1, 640, 640, false, util.by_pixel(0, 0)),
    colors = virentis_plant.minor_tints(),
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
    map_color = { 230, 255, 230 },
    {
      primary = {r = 0.552, g = 0.218, b = 0.218, a = 1.000}, -- #8c3737ff
      secondary = {r = 0.561, g = 0.613, b = 0.308, a = 1.000}, -- #8f4f4eff
    },
  },
})