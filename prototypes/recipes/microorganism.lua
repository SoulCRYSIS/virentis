local virentis = require("prototypes.utils")
local recipe_tints = virentis.recipe_tints

data:extend(
  {
    {
      type = "recipe",
      name = "kheast-cultivation",
      category = "organic",
      subgroup = "virentis-microorganism",
      order = "a",
      icon = "__virentis-graphics__/icons/items/microorganism/kheast.png",
      ingredients = {
        { type = "item", name = "kheast",           amount = 1 },
        { type = "item", name = "mangroove-mashed", amount = 1 },
        { type = "item", name = "rockmalt-bulb",   amount = 1 },
        { type = "item", name = "herb",             amount = 2 },
      },
      results = {
        { type = "item", name = "kheast", amount = 2, ignored_by_stats = 1 }
      },
      crafting_machine_tint = recipe_tints.orange,
      energy_required = 4,
      result_is_always_fresh = true,
      allow_productivity = true,
      enabled = false,
    }
  }
)
