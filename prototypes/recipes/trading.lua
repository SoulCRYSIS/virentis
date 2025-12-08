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
      order = "a",
      icon = "__base__/graphics/icons/iron-plate.png",
      ingredients = {
        { type = "item", name = "rockmalt-pudding", amount = 1 }
      },
      results = {
        { type = "item", name = "iron-plate", amount = 15 }
      },
      crafting_machine_tint = recipe_tints.gray,
      energy_required = 1,
    },
    {
      type = "recipe",
      name = "trade-copper-plate",
      category = "trading-t1",
      subgroup = "virentis-trades",
      order = "a",
      icon = "__base__/graphics/icons/copper-plate.png",
      ingredients = {
        { type = "item", name = "redbloom-buns", amount = 1 }
      },
      results = {
        { type = "item", name = "copper-plate", amount = 15 }
      },
      crafting_machine_tint = recipe_tints.orange,
      energy_required = 1,
    },
    {
      type = "recipe",
      name = "trade-firebrick",
      category = "trading-t1",
      subgroup = "virentis-trades",
      order = "a",
      icon = "__virentis__/graphics/icons/items/materials/firebrick.png",
      ingredients = {
        { type = "item", name = "berry-bliss-cookie", amount = 1 }
      },
      results = {
        { type = "item", name = "firebrick", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.brown,
      energy_required = 0.5,
    },
    {
      type = "recipe",
      name = "trade-siltcore",
      category = "trading-t1",
      subgroup = "virentis-trades",
      order = "a",
      icon = "__virentis__/graphics/icons/items/materials/siltcore.png",
      ingredients = {
        { type = "item", name = "sweet-doughnut",     amount = 1 },
        { type = "item", name = "fried-dumpling-set", amount = 1 }
      },
      results = {
        { type = "item", name = "siltcore", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.brown,
      energy_required = 2,
    },
    {
      type = "recipe",
      name = "low-density-structure",
      category = "trading-t1",
      subgroup = "virentis-trades",
      order = "a",
      icon = "__base__/graphics/icons/low-density-structure.png",
      ingredients = {
        { type = "item", name = "wild-taco", amount = 1 }
      },
      results = {
        { type = "item", name = "low-density-structure", amount = 2 }
      },
      energy_required = 1,
    },
  }
)
