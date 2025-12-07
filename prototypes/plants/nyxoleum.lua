local virentis_plant = require("prototypes.plants.utils")

data:extend({
  {
    type = "plant",
    name = "nyxoleum-tree",
    icon = "__virentis__/graphics/icons/plants/nyxoleum-tree.png",
    subgroup = "trees",
    impact_category = "tree",
    order = "c",
    flags = virentis_plant.default_flags,
    growth_ticks = 5 * minute,
    harvest_emissions = virentis_plant.default_emission,
    healing_per_tick = 1,
    factoriopedia_simulation = virentis_plant.simulation("nyxoleum", "virentis-plain-grass"),
    minable = {
      mining_particle = "teflilly-mining-particle",
      mining_time = 0.5,
      results = {
        {
          type = "item",
          name = "nyxoleum-seed",
          amount = 5,
        },
        {
          type = "item",
          name = "tar",
          amount = 5,
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
      probability_expression = "0.1 * voronoi_facet_noise{x = x , y = y , seed0 = map_seed, seed1 = 'rockmalt_tree', grid_size = 128, distance_type = 'euclidean', jitter = 0.1 }",
      richness_expression = "random_penalty_at(3, 1)"
    },
    variations = virentis_plant.tree_variations("nyxoleum", 6, 3, 1, 480, 320, false, util.by_pixel(60, -40)),
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
    map_color = { 200, 255, 255 },
    {
      primary = {r = 0.552, g = 0.218, b = 0.218, a = 1.000}, -- #8c3737ff
      secondary = {r = 0.561, g = 0.613, b = 0.308, a = 1.000}, -- #8f4f4eff
    },
  },
})