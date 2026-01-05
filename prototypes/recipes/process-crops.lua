local virentis = require("prototypes.utils")
local recipe_tints = virentis.recipe_tints

data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "nutrient-from-herb",
      category = "organic-or-hand-crafting",
      subgroup = "virentis-crops",
      order = "a",
      icon = "__virentis__/graphics/icons/recipes/nutrients-from-herb.png",
      ingredients = {
        { type = "item", name = "herb", amount = 1 },
      },
      results = {
        { type = "item", name = "nutrients", amount = 2 },
      },
      crafting_machine_tint = recipe_tints.green,
      energy_required = 2,
      result_is_always_fresh = true,
      allow_productivity = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "rockmalt-processing",
      category = "organic-or-hand-crafting",
      subgroup = "virentis-crops",
      order = "b",
      icon = "__virentis__/graphics/icons/items/crops/rockmalt-bulb.png",
      ingredients = {
        { type = "item", name = "rockmalt-fruit", amount = 1 }
      },
      results = {
        { type = "item", name = "rockmalt-bulb",  amount = 10 },
        { type = "item", name = "rockmalt-scale", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.yellow,
      energy_required = 32,
      result_is_always_fresh = false,
      allow_productivity = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "mangroove-mashed",
      category = "organic-or-hand-crafting",
      subgroup = "virentis-crops",
      order = "c",
      icon = "__virentis__/graphics/icons/items/crops/mangroove-mashed.png",
      ingredients = {
        { type = "item", name = "mangroove-fruit", amount = 2 }
      },
      results = {
        { type = "item", name = "mangroove-seed",   amount = 1, probability = 0.1 },
        { type = "item", name = "mangroove-mashed", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.purple,
      energy_required = 8,
      result_is_always_fresh = false,
      allow_productivity = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "nyxoleum-sapling",
      category = "organic",
      subgroup = "virentis-crops",
      order = "d",
      icon = "__virentis__/graphics/icons/items/crops/nyxoleum-sapling.png",
      ingredients = {
        { type = "item",  name = "nyxoleum-seed", amount = 1 },
        { type = "fluid", name = "vegetable-oil", amount = 10 }
      },
      results = {
        { type = "item", name = "nyxoleum-sapling", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.black,
      energy_required = 16,
      result_is_always_fresh = true,
      enabled = false,
    },
  }
)
