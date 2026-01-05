local virentis = require("prototypes.utils")
local recipe_tints = virentis.recipe_tints

data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "trade-iron-plate",
      category = "trading-t1",
      subgroup = "virentis-trades",
      order = "aa",
      icon = "__base__/graphics/icons/iron-plate.png",
      ingredients = {
        { type = "item", name = "rockmalt-pudding", amount = 1 }
      },
      results = {
        { type = "item", name = "iron-plate", amount = 5 }
      },
      crafting_machine_tint = recipe_tints.gray,
      energy_required = 2,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "trade-copper-plate",
      category = "trading-t1",
      subgroup = "virentis-trades",
      order = "ab",
      icon = "__base__/graphics/icons/copper-plate.png",
      ingredients = {
        { type = "item", name = "redbloom-buns", amount = 1 }
      },
      results = {
        { type = "item", name = "copper-plate", amount = 5 }
      },
      crafting_machine_tint = recipe_tints.orange,
      energy_required = 2,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "trade-firebrick",
      category = "trading-t1",
      subgroup = "virentis-trades",
      order = "ac",
      icon = "__virentis__/graphics/icons/items/materials/firebrick.png",
      ingredients = {
        { type = "item", name = "berry-bliss-cookie", amount = 1 }
      },
      results = {
        { type = "item", name = "firebrick", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.brown,
      energy_required = 2,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "trade-siltcore",
      category = "trading-t1",
      subgroup = "virentis-trades",
      order = "ad",
      icon = "__virentis__/graphics/icons/items/materials/siltcore.png",
      ingredients = {
        { type = "item", name = "sweet-doughnut",     amount = 1 },
        { type = "item", name = "fried-dumpling-set", amount = 1 }
      },
      results = {
        { type = "item", name = "siltcore", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.brown,
      energy_required = 4,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "trade-phosphorus",
      category = "trading-t1",
      subgroup = "virentis-trades",
      order = "ae",
      icon = "__virentis__/graphics/icons/items/materials/phosphorus.png",
      ingredients = {
        { type = "item", name = "pentapod-souffle-omelette", amount = 1 }
      },
      results = {
        { type = "item", name = "phosphorus", amount = 2 }
      },
      energy_required = 2,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "trade-processing-unit",
      category = "trading-t1",
      subgroup = "virentis-trades",
      order = "af",
      icon = "__base__/graphics/icons/processing-unit.png",
      ingredients = {
        { type = "item", name = "wild-taco", amount = 1 }
      },
      results = {
        { type = "item", name = "processing-unit", amount = 1 }
      },
      energy_required = 2,
      enabled = false,
    },
  }
)
