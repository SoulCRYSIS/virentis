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
      icon = "__virentis__/graphics/icons/items/microorganism/kheast.png",
      ingredients = {
        { type = "item", name = "kheast",           amount = 1 },
        { type = "item", name = "mangroove-mashed", amount = 1 },
        { type = "item", name = "redbloom-fruit",   amount = 1 },
        { type = "item", name = "herb",             amount = 1 },
      },
      results = {
        { type = "item", name = "kheast", amount = 2 }
      },
      crafting_machine_tint = recipe_tints.orange,
      energy_required = 8,
      result_is_always_fresh = true,
      allow_productivity = true,
      enabled = false,
    }
  }
)
