local fishing_utils = require("__fishing-dock__.prototypes.utils")

data:extend(
  {
    {
      type = "fish",
      name = "pentapus",
      icon = "__virentis__/graphics/icons/items/meats/pentapus.png",
      flags = { "placeable-neutral", "not-on-map" },
      subgroup = "virentis-creatures",
      order = "a",
      collision_box = { { -1, -1 }, { 1, 1 } },
      selection_box = { { -0.75, -0.75 }, { 0.75, 0.75 } },
      minable = {
        mining_time = 2,
        results = {
          { type = "item", name = "pentapus", amount = 1 },
        },
      },
      max_health = 100,
      healing_per_tick = 1,
      protected_from_tile_building = false,
      autoplace = {
        order = "a",
        probability_expression = 0.0001,
        tile_restriction = { "virentis-deep-water" }
      },
      pictures = {
        filename = "__virentis__/graphics/entities/creatures/pentapus.png",
        priority = "extra-high",
        width = 96,
        height = 128,
        shift = { 0, -0.5 },
      }
    },
  }
)

fishing_utils.create_fishing_content({
  fish_name = "pentapus",
  icon = "__virentis__/graphics/icons/items/meats/pentapus.png",
  energy = 10,
  order = "aa",
  subgroup = "virentis-fishing",
  ingredients = {
    { type = "item", name = "pentapod-egg", amount = 1 }
  },
  surface_conditions = {
    {
      property = "pressure",
      min = 1200,
      max = 1200,
    }
  },
})
