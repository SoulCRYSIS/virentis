local virentis = require("prototypes.utils")
local recipe_tints = virentis.recipe_tints

data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "dough",
      category = "organic",
      subgroup = "virentis-foods-basic",
      order = "aa",
      icon = "__virentis-graphics__/icons/items/foods/dough.png",
      ingredients = {
        { type = "fluid", name = "water",         amount = 50 },
        { type = "item",  name = "rockmalt-bulb", amount = 3 }
      },
      results = {
        { type = "item", name = "dough", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.white,
      energy_required = 4,
      result_is_always_fresh = false,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "rockmalt-pudding",
      category = "organic",
      subgroup = "virentis-foods-trade-item",
      order = "ba",
      icon = "__virentis-graphics__/icons/items/foods/rockmalt-pudding.png",
      ingredients = {
        { type = "item", name = "red-sauce",     amount = 2 },
        { type = "item", name = "rockmalt-bulb", amount = 4 }
      },
      results = {
        { type = "item", name = "rockmalt-pudding", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 6,
      result_is_always_fresh = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "red-sauce",
      category = "basic-cooking",
      subgroup = "virentis-foods-basic",
      order = "ab",
      icon = "__virentis-graphics__/icons/items/foods/red-sauce.png",
      ingredients = {
        { type = "item", name = "redbloom-fruit", amount = 2 }
      },
      results = {
        { type = "item", name = "red-sauce", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 4,
      result_is_always_fresh = true,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "redbloom-buns",
      category = "basic-cooking",
      additional_categories = { "smelting" },
      subgroup = "virentis-foods-trade-item",
      order = "bb",
      icon = "__virentis-graphics__/icons/items/foods/redbloom-buns.png",
      ingredients = {
        { type = "item", name = "redbloom-fruit", amount = 4 },
        { type = "item", name = "dough",          amount = 2 }
      },
      results = {
        { type = "item", name = "redbloom-buns", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 6,
      result_is_always_fresh = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "mangroove-syrup",
      category = "basic-cooking",
      subgroup = "virentis-foods-basic",
      order = "ac",
      icon = "__virentis-graphics__/icons/items/foods/mangroove-syrup.png",
      ingredients = {
        { type = "item", name = "mangroove-mashed", amount = 4 },
      },
      results = {
        { type = "item", name = "mangroove-syrup", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.purple,
      energy_required = 8,
      result_is_always_fresh = true,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "berry-bliss-cookie",
      category = "basic-cooking",
      subgroup = "virentis-foods-trade-item",
      order = "bc",
      icon = "__virentis-graphics__/icons/items/foods/berry-bliss-cookie.png",
      ingredients = {
        { type = "item", name = "dough",           amount = 2 },
        { type = "item", name = "red-sauce",       amount = 2 },
        { type = "item", name = "mangroove-syrup", amount = 2 },
      },
      results = {
        { type = "item", name = "berry-bliss-cookie", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.purple,
      energy_required = 8,
      result_is_always_fresh = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "flatbread",
      category = "baking",
      subgroup = "virentis-foods-basic",
      order = "ad",
      icon = "__virentis-graphics__/icons/items/foods/flatbread.png",
      ingredients = {
        { type = "item", name = "dough",  amount = 2 },
        { type = "item", name = "kheast", amount = 1 }
      },
      results = {
        { type = "item", name = "flatbread", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.white,
      energy_required = 4,
      result_is_always_fresh = true,
      allow_productivity = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "wild-taco",
      category = "organic",
      subgroup = "virentis-foods-trade-item",
      order = "bd",
      icon = "__virentis-graphics__/icons/items/foods/wild-taco.png",
      ingredients = {
        { type = "item",  name = "flatbread",        amount = 1 },
        { type = "item",  name = "herb",             amount = 2 },
        { type = "item",  name = "mangroove-mashed", amount = 2 },
        { type = "item",  name = "redbloom-fruit",   amount = 2 },
        { type = "fluid", name = "vegetable-oil",    amount = 50 }
      },
      results = {
        { type = "item", name = "wild-taco", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.green,
      energy_required = 8,
      result_is_always_fresh = false,
      enabled = false,
    },
    {
      type = "recipe",
      name = "sweat-chilli-sauce",
      category = "organic",
      subgroup = "virentis-foods-basic",
      order = "ae",
      icon = "__virentis-graphics__/icons/items/foods/sweet-chili-sauce.png",
      ingredients = {
        { type = "item", name = "red-sauce",       amount = 2 },
        { type = "item", name = "mangroove-syrup", amount = 2 }
      },
      results = {
        { type = "item", name = "sweet-chili-sauce", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.purple,
      energy_required = 6,
      result_is_always_fresh = true,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "soft-cooked-pentapod-egg",
      category = "baking",
      subgroup = "virentis-foods-basic",
      order = "af",
      icon = "__virentis-graphics__/icons/items/foods/soft-cooked-pentapod-egg.png",
      ingredients = {
        { type = "item", name = "kheast",       amount = 1 },
        { type = "item", name = "pentapod-egg", amount = 1 },
        { type = "item", name = "herb",         amount = 2 },
      },
      results = {
        { type = "item", name = "soft-cooked-pentapod-egg", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.green,
      energy_required = 8,
      result_is_always_fresh = true,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "pentapod-souffle-omelette",
      category = "frying",
      subgroup = "virentis-foods-trade-item",
      order = "bg",
      icon = "__virentis-graphics__/icons/items/foods/pentapod-souffle-omelette.png",
      ingredients = {
        { type = "item",  name = "soft-cooked-pentapod-egg", amount = 2 },
        { type = "item",  name = "sweet-chili-sauce",        amount = 2 },
        { type = "item",  name = "flatbread",                amount = 2 },
        { type = "fluid", name = "vegetable-oil",            amount = 100 },
      },
      results = {
        { type = "item", name = "pentapod-souffle-omelette", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.green,
      energy_required = 16,
      result_is_always_fresh = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "mudland-medley",
      category = "organic",
      subgroup = "virentis-foods-trade-item",
      order = "bh",
      icon = "__virentis-graphics__/icons/items/foods/mudland-medley.png",
      ingredients = {
        { type = "item",  name = "soft-cooked-pentapod-egg", amount = 2 },
        { type = "item",  name = "rockmalt-bulb",            amount = 2 },
        { type = "item",  name = "redbloom-fruit",           amount = 2 },
        { type = "item",  name = "mangroove-mashed",         amount = 2 },
        { type = "fluid", name = "vegetable-oil",            amount = 100 },
      },
      results = {
        { type = "item", name = "mudland-medley", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.green,
      energy_required = 16,
      result_is_always_fresh = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "taiyaki-royale",
      category = "frying",
      subgroup = "virentis-foods-trade-item",
      order = "bi",
      icon = "__virentis-graphics__/icons/items/foods/taiyaki-royale.png",
      ingredients = {
        { type = "item",  name = "flatbread",         amount = 2 },
        { type = "item",  name = "fish-fillet",       amount = 2 },
        { type = "item",  name = "sweet-chili-sauce", amount = 2 },
        { type = "fluid", name = "fish-oil",          amount = 100 },
      },
      results = {
        { type = "item", name = "taiyaki-royale", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.yellow,
      energy_required = 16,
      result_is_always_fresh = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "citrus-sashimi",
      category = "organic",
      subgroup = "virentis-foods-trade-item",
      order = "bi",
      icon = "__virentis-graphics__/icons/items/foods/citrus-sashimi.png",
      ingredients = {
        { type = "item",  name = "fish-fillet",      amount = 5 },
        { type = "item",  name = "redbloom-fruit", amount = 2 },
        { type = "item",  name = "herb",           amount = 5 },
        { type = "fluid", name = "fish-oil",       amount = 20 },
      },
      results = {
        { type = "item", name = "citrus-sashimi", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 16,
      result_is_always_fresh = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "pentapod-bouillon",
      category = "frying",
      subgroup = "virentis-foods-trade-item",
      order = "bi",
      icon = "__virentis-graphics__/icons/items/foods/pentapod-bouillon.png",
      ingredients = {
        { type = "item",  name = "soft-cooked-pentapod-egg", amount = 2 },
        { type = "item",  name = "fish-fillet",              amount = 2 },
        { type = "item",  name = "fish-bones",               amount = 1 },
        { type = "item",  name = "herb",                     amount = 2 },
        { type = "fluid", name = "water",                    amount = 100 },
      },
      results = {
        { type = "item", name = "pentapod-bouillon", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.orange,
      energy_required = 16,
      result_is_always_fresh = true,
      enabled = false,
    },
  }
)
