local virentis = require("prototypes.utils")
local recipe_tints = virentis.recipe_tints

data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "dough",
      category = "organic",
      subgroup = "virentis-foods",
      order = "a",
      icon = "__virentis__/graphics/icons/items/foods/dough.png",
      ingredients = {
        { type = "item", name = "water",         amount = 50 },
        { type = "item", name = "rockmalt-bulb", amount = 1 }
      },
      results = {
        { type = "item", name = "dough", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.white,
      energy_required = 8,
      result_is_always_fresh = false,
    },
    {
      type = "recipe",
      name = "rockmalt-pudding",
      category = "organic",
      subgroup = "virentis-foods",
      order = "a",
      icon = "__virentis__/graphics/icons/items/foods/rockmalt-pudding.png",
      ingredients = {
        { type = "item", name = "red-sauce",     amount = 1 },
        { type = "item", name = "rockmalt-bulb", amount = 2 }
      },
      results = {
        { type = "item", name = "rockmalt-pudding", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 4,
      result_is_always_fresh = true,
    },
    {
      type = "recipe",
      name = "red-sauce",
      category = "baking",
      additional_categories = { "smelting" },
      subgroup = "virentis-foods",
      order = "a",
      icon = "__virentis__/graphics/icons/items/foods/red-sauce.png",
      ingredients = {
        { type = "item", name = "redbloom-fruit", amount = 1 }
      },
      results = {
        { type = "item", name = "red-sauce", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 8,
      result_is_always_fresh = true,
    },
    {
      type = "recipe",
      name = "redbloom-buns",
      category = "baking",
      additional_categories = { "smelting" },
      subgroup = "virentis-foods",
      order = "a",
      icon = "__virentis__/graphics/icons/items/foods/redbloom-buns.png",
      ingredients = {
        { type = "item", name = "redbloom-fruit", amount = 2 },
        { type = "item", name = "dough",          amount = 1 }
      },
      results = {
        { type = "item", name = "redbloom-buns", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 8,
      result_is_always_fresh = true,
    },
    {
      type = "recipe",
      name = "mangroove-syrup",
      category = "baking",
      additional_categories = { "smelting" },
      subgroup = "virentis-foods",
      order = "a",
      icon = "__virentis__/graphics/icons/items/foods/mangroove-syrup.png",
      ingredients = {
        { type = "item", name = "mangroove-mashed", amount = 2 },
      },
      results = {
        { type = "item", name = "mangroove-syrup", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.orange,
      energy_required = 8,
      result_is_always_fresh = true,
    },
    {
      type = "recipe",
      name = "sweet-cookie",
      category = "baking",
      additional_categories = { "smelting" },
      subgroup = "virentis-foods",
      order = "a",
      icon = "__virentis__/graphics/icons/items/foods/sweet-cookie.png",
      ingredients = {
        { type = "item", name = "dough",           amount = 2 },
        { type = "item", name = "red-sauce",       amount = 1 },
        { type = "item", name = "mangroove-syrup", amount = 1 }
      },
      results = {
        { type = "item", name = "berry-bliss-cookie", amount = 2 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 12,
      result_is_always_fresh = true,
    },
    {
      type = "recipe",
      name = "taco-salad",
      category = "organic",
      subgroup = "virentis-foods",
      order = "a",
      icon = "__virentis__/graphics/icons/items/foods/taco-salad.png",
      ingredients = {
        { type = "item", name = "dough",            amount = 1 },
        { type = "item", name = "grass",            amount = 2 },
        { type = "item", name = "mangroove-mashed", amount = 2 },
        { type = "item", name = "redbloom-fruit",   amount = 2 }
      },
      results = {
        { type = "item", name = "wild-taco", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.green,
      energy_required = 2,
      result_is_always_fresh = false,
    },
    {
      type = "recipe",
      name = "sweat-chilli-sauce",
      category = "organic",
      subgroup = "virentis-foods",
      order = "a",
      icon = "__virentis__/graphics/icons/items/foods/sweet-chili-sauce.png",
      ingredients = {
        { type = "item", name = "red-sauce",       amount = 1 },
        { type = "item", name = "mangroove-syrup", amount = 1 }
      },
      results = {
        { type = "item", name = "sweet-chili-sauce", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.orange,
      energy_required = 4,
      result_is_always_fresh = true,
    },
    {
      type = "recipe",
      name = "sweet-doughnut",
      category = "frying",
      subgroup = "virentis-foods",
      order = "a",
      icon = "__virentis__/graphics/icons/items/foods/sweet-doughnut.png",
      ingredients = {
        { type = "item", name = "mangroove-syrup", amount = 1 },
        { type = "item", name = "dough",           amount = 2 },
        { type = "fluid", name = "vegetable-oil",   amount = 10 }
      },
      results = {
        { type = "item", name = "sweet-doughnut", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.purple,
      energy_required = 2,
      result_is_always_fresh = true,

    },
    {
      type = "recipe",
      name = "fried-dumpling-set",
      category = "frying",
      subgroup = "virentis-foods",
      order = "a",
      icon = "__virentis__/graphics/icons/items/foods/fried-dumpling-set.png",
      ingredients = {
        { type = "item", name = "dough",              amount = 2 },
        { type = "item", name = "vegetable-oil",      amount = 10 },
        { type = "item", name = "sweet-chili-sauce", amount = 1 }
      },
      results = {
        { type = "item", name = "fried-dumpling-set", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 2,
      result_is_always_fresh = true,
    },
  }
)
