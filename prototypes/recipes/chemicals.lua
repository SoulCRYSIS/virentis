local virentis = require("prototypes.utils")
local recipe_tints = virentis.recipe_tints

data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "solid-fuel-from-nyxoleum-seed",
      category = "organic-or-hand-crafting",
      subgroup = "virentis-chemicals",
      order = "aa",
      icon = "__virentis__/graphics/icons/recipes/solid-fuel-from-nyxoleum-seed.png",
      ingredients = {
        { type = "item", name = "nyxoleum-seed", amount = 1 },
      },
      results = {
        { type = "item", name = "solid-fuel", amount = 1 }
      },
      energy_required = 2,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "tar-processing",
      category = "oil-processing",
      subgroup = "virentis-chemicals",
      order = "ba",
      icon = "__virentis__/graphics/icons/recipes/tar-processing.png",
      ingredients = {
        { type = "fluid", name = "tar",           amount = 50 },
        { type = "fluid", name = "vegetable-oil", amount = 20 },
        { type = "item",  name = "phosphorus",    amount = 1 }
      },
      results = {
        { type = "item",  name = "resin",    amount = 2 },
        { type = "item",  name = "creosote", amount = 2 },
        { type = "fluid", name = "methanol", amount = 50 }
      },
      crafting_machine_tint = recipe_tints.black,
      energy_required = 5,
      allow_productivity = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "solid-fuel-from-methanol",
      category = "organic",
      subgroup = "virentis-chemicals",
      order = "bb",
      icon = "__virentis__/graphics/icons/recipes/solid-fuel-from-methanol.png",
      ingredients = {
        { type = "fluid", name = "methanol",      amount = 5 },
        { type = "fluid", name = "vegetable-oil", amount = 5 }
      },
      results = {
        { type = "item", name = "solid-fuel", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.yellow,
      energy_required = 2,
      enabled = false,
    },
    {
      type = "recipe",
      name = "solid-fuel-from-creosote",
      category = "organic",
      subgroup = "virentis-chemicals",
      order = "bc",
      icon = "__virentis__/graphics/icons/recipes/solid-fuel-from-creosote.png",
      ingredients = {
        { type = "item",  name = "creosote",      amount = 1 },
        { type = "fluid", name = "vegetable-oil", amount = 5 }
      },
      results = {
        { type = "item", name = "solid-fuel", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.yellow,
      energy_required = 2,
      enabled = false,
    },
    {
      type = "recipe",
      name = "virentis-rocket-fuel",
      category = "chemistry-or-cryogenics",
      subgroup = "virentis-chemicals",
      order = "bd",
      icon = "__base__/graphics/icons/rocket-fuel.png",
      ingredients = {
        { type = "item",  name = "solid-fuel", amount = 10 },
        { type = "fluid", name = "methanol",   amount = 10 },
      },
      results = {
        { type = "item", name = "rocket-fuel", amount = 1 }
      },
      energy_required = 2,
      allow_productivity = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "vegetable-oil",
      category = "organic-or-hand-crafting",
      subgroup = "virentis-chemicals",
      order = "ab",
      icon = "__virentis__/graphics/icons/items/fluids/vegetable-oil.png",
      ingredients = {
        { type = "item",  name = "nyxoleum-seed", amount = 1 },
        { type = "fluid", name = "water",         amount = 50 }
      },
      results = {
        { type = "fluid", name = "vegetable-oil", amount = 50 }
      },
      crafting_machine_tint = recipe_tints.yellow,
      energy_required = 4,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "nutrients-pulp",
      category = "organic",
      subgroup = "virentis-chemicals",
      order = "ca",
      icon = "__virentis__/graphics/icons/items/fluids/nutrients-pulp.png",
      ingredients = {
        { type = "item",  name = "nutrients",     amount = 10 },
        { type = "item",  name = "phosphorus",    amount = 2 },
        { type = "fluid", name = "vegetable-oil", amount = 10 },
        { type = "fluid", name = "water",         amount = 40 }
      },
      results = {
        { type = "fluid", name = "nutrients-pulp", amount = 50 }
      },
      crafting_machine_tint = recipe_tints.orange,
      energy_required = 2,
      enabled = false,
    },
    {
      type = "recipe",
      name = "pentapod-from-nutrients-pulp",
      category = "organic",
      subgroup = "virentis-chemicals",
      order = "cb",
      icon = "__virentis__/graphics/icons/recipes/pentapod-from-nutrients-pulp.png",
      ingredients = {
        { type = "item",  name = "pentapod-egg",   amount = 1, ignored_by_stats = 1 },
        { type = "fluid", name = "nutrients-pulp", amount = 30 },
      },
      results = {
        { type = "item", name = "pentapod-egg", amount = 2, ignored_by_stats = 1, ignored_by_productivity = 1 }
      },
      crafting_machine_tint = recipe_tints.orange,
      energy_required = 8,
      enabled = false,
    },
    {
      type = "recipe",
      name = "vegetable-oil-gleba",
      category = "organic",
      subgroup = "virentis-chemicals",
      order = "cc",
      icon = "__virentis__/graphics/icons/recipes/vegetable-oil-gleba.png",
      ingredients = {
        { type = "item",  name = "phosphorus", amount = 1 },
        { type = "item", name = "jelly",      amount = 4 },
        { type = "fluid", name = "water",      amount = 50 },
      },
      results = {
        { type = "fluid", name = "vegetable-oil", amount = 50 }
      },
      crafting_machine_tint = recipe_tints.yellow,
      energy_required = 2,
      enabled = false,
    },
  }
)
