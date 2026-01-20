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
      energy_required = 0.5,
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
      energy_required = 0.5,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "trade-firebrick",
      category = "trading-t1",
      subgroup = "virentis-trades",
      order = "ac",
      icon = "__virentis-graphics__/icons/items/materials/firebrick.png",
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
      icon = "__virentis-graphics__/icons/items/materials/siltcore.png",
      ingredients = {
        { type = "item", name = "sweet-doughnut",     amount = 2 },
        { type = "item", name = "fried-dumpling-set", amount = 2 }
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
      icon = "__virentis-graphics__/icons/items/materials/phosphorus.png",
      ingredients = {
        { type = "item", name = "pentapod-souffle-omelette", amount = 1 }
      },
      results = {
        { type = "item", name = "phosphorus", amount = 5 }
      },
      energy_required = 2,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "trade-advanced-circuit",
      category = "trading-t1",
      subgroup = "virentis-trades",
      order = "af",
      icon = "__base__/graphics/icons/advanced-circuit.png",
      ingredients = {
        { type = "item", name = "wild-taco", amount = 1 }
      },
      results = {
        { type = "item", name = "advanced-circuit", amount = 5 }
      },
      energy_required = 2,
      enabled = false,
    },
  }
)
