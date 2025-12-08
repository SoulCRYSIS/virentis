local virentis = require("prototypes.utils")
local recipe_tints = virentis.recipe_tints

data:extend(
  ---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "tar-processing",
      category = "chemistry-or-cryogenics",
      subgroup = "virentis-chemicals",
      order = "a",
      icon = "__virentis__/graphics/icons/items/materials/tar-processing.png",
      ingredients = {
        { type = "item", name = "tar", amount = 1 }
      },
      results = {
        { type = "item", name = "resin",    amount = 1 },
        { type = "fluid", name = "methanol", amount = 20 }
      },
      crafting_machine_tint = recipe_tints.black,
      energy_required = 1,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "rocket-fuel",
      category = "chemistry-or-cryogenics",
      subgroup = "virentis-chemicals",
      order = "a",
      icon = "__base__/graphics/icons/rocket-fuel.png",
      ingredients = {
        { type = "item", name = "vegetable-oil", amount = 10 },
        { type = "item", name = "methanol",      amount = 20 },
        { type = "item", name = "wood", amount = 2 }
      },
      results = {
        { type = "item", name = "rocket-fuel", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.yellow,
      energy_required = 2,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "vegetable-oil",
      category = "chemistry-or-cryogenics",
      subgroup = "virentis-chemicals",
      order = "a",
      icon = "__virentis__/graphics/icons/items/fluids/vegetable-oil.png",
      ingredients = {
        { type = "item", name = "nyxoleum-seed", amount = 1 },
        { type = "item", name = "water",         amount = 50 }
      },
      results = {
        { type = "item", name = "vegetable-oil", amount = 50 }
      },
      crafting_machine_tint = recipe_tints.yellow,
      energy_required = 4,
      result_is_always_fresh = true,
      allow_productivity = true,
    },
  }
)