local virentis = require("prototypes.utils")
local recipe_tints = virentis.recipe_tints

data:extend(
  {
    {
      type = "recipe",
      name = "virentis-fertilizer",
      category = "organic",
      subgroup = "virentis-cultivation",
      order = "aa",
      icon = "__virentis__/graphics/icons/items/cultivations/virentis-fertilizer.png",
      ingredients = {
        { type = "item",  name = "kheast",         amount = 1 },
        { type = "item",  name = "pentapod-egg",   amount = 1 },
        { type = "fluid", name = "nutrients-pulp", amount = 10 },
      },
      results = {
        { type = "item", name = "virentis-fertilizer", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.orange,
      energy_required = 8,
      auto_recycle = false,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "gleba-fertilizer",
      category = "organic",
      subgroup = "virentis-cultivation",
      order = "ab",
      icon = "__virentis__/graphics/icons/items/cultivations/gleba-fertilizer.png",
      ingredients = {
        { type = "item",  name = "bioflux",        amount = 1 },
        { type = "item",  name = "pentapod-egg",   amount = 1 },
        { type = "fluid", name = "nutrients-pulp", amount = 10 },
      },
      results = {
        { type = "item", name = "gleba-fertilizer", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.green,
      energy_required = 8,
      auto_recycle = false,
      enabled = false,
      allow_productivity = true,
    }
  }
)
