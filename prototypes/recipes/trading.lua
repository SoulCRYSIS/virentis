local virentis = require("prototypes.utils")
local recipe_tints = virentis.recipe_tints

data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "trade-iron-plate",
      category = "trading-t1",
      localised_name = {"recipe-name.trade", { "item-name.iron-plate" } },
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
      energy_required = 1,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "trade-copper-plate",
      category = "trading-t1",
      localised_name = {"recipe-name.trade", { "item-name.copper-plate" } },
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
      energy_required = 1,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "trade-firebrick",
      category = "trading-t1",
      localised_name = {"recipe-name.trade", { "item-name.firebrick" } },
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
      localised_name = {"recipe-name.trade", { "item-name.siltcore" } },
      subgroup = "virentis-trades",
      order = "ad",
      icon = "__virentis-graphics__/icons/items/materials/siltcore.png",
      ingredients = {
        { type = "item", name = "pentapod-bouillon", amount = 1 },
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
      localised_name = {"recipe-name.trade", { "item-name.phosphorus" } },
      subgroup = "virentis-trades",
      order = "ae",
      icon = "__virentis-graphics__/icons/items/materials/phosphorus.png",
      ingredients = {
        { type = "item", name = "pentapod-souffle-omelette", amount = 1 }
      },
      results = {
        { type = "item", name = "phosphorus", amount = 3 }
      },
      energy_required = 2,
      enabled = false,
      allow_productivity = true,
    },
    {
      type = "recipe",
      name = "trade-advanced-circuit",
      category = "trading-t1",
      localised_name = {"recipe-name.trade", { "item-name.advanced-circuit" } },
      subgroup = "virentis-trades",
      order = "af",
      icon = "__base__/graphics/icons/advanced-circuit.png",
      ingredients = {
        { type = "item", name = "wild-taco", amount = 1 }
      },
      results = {
        { type = "item", name = "advanced-circuit", amount = 5 }
      },
      energy_required = 4,
      enabled = false,
    },
    {
      type = "recipe",
      name = "trade-virta-neuron",
      category = "trading-t1",
      localised_name = {"recipe-name.trade", { "item-name.virta-neuron" } },
      subgroup = "virentis-trades",
      order = "ad",
      icon = "__virentis-graphics__/icons/items/materials/virta-neuron.png",
      ingredients = {
        { type = "item", name = "citrus-sashimi", amount = 1 },
        { type = "item", name = "taiyaki-royale", amount = 1 },
      },
      results = {
        { type = "item", name = "virta-neuron", amount = 5 }
      },
      crafting_machine_tint = recipe_tints.blue,
      energy_required = 4,
      enabled = false,
      allow_productivity = true,
    },
  }
)
