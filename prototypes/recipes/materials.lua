local virentis = require("prototypes.utils")
local recipe_tints = virentis.recipe_tints

data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "stone-from-rockmalt-scale",
      category = "organic-or-hand-crafting",
      subgroup = "virentis-materials",
      order = "aa",
      icon = "__base__/graphics/icons/stone.png",
      ingredients = {
        { type = "item", name = "rockmalt-scale", amount = 1 }
      },
      results = {
        { type = "item", name = "stone", amount = 10 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 16,
      allow_productivity = true,
      auto_recycle = false,
      enabled = false,
    },
    {
      type = "recipe",
      name = "heart-of-nature",
      category = "organic",
      subgroup = "virentis-materials-advanced",
      order = "aa",
      icon = "__virentis-graphics__/icons/items/materials/heart-of-nature.png",
      ingredients = {
        { type = "item", name = "virentis-resin", amount = 4 },
        { type = "item", name = "siltcore",       amount = 2 },
        { type = "item", name = "living-wood",    amount = 4 },
        { type = "item", name = "pentapod-egg",   amount = 2 }
      },
      results = {
        { type = "item", name = "heart-of-nature", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.green,
      result_is_always_fresh = true,
      energy_required = 24,
      allow_productivity = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "virentis-concrete",
      category = "organic",
      subgroup = "virentis-materials",
      order = "ab",
      icon = "__base__/graphics/icons/concrete.png",
      ingredients = {
        { type = "item",  name = "iron-plate",     amount = 2 },
        { type = "item",  name = "rockmalt-scale", amount = 1 },
        { type = "fluid", name = "water",          amount = 50 }
      },
      results = {
        { type = "item", name = "concrete", amount = 5 }
      },
      crafting_machine_tint = recipe_tints.gray,
      energy_required = 8,
      allow_productivity = true,
      auto_recycle = false,
      enabled = false,
    },
    {
      type = "recipe",
      name = "low-density-structure-from-graphene",
      category = "advanced-crafting",
      subgroup = "virentis-materials-advanced",
      order = "ab",
      icon = "__virentis-graphics__/icons/recipes/low-density-structure-from-graphene.png",
      ingredients = {
        { type = "item", name = "copper-plate", amount = 5 },
        { type = "item", name = "iron-plate",   amount = 5 },
        { type = "item", name = "graphene",     amount = 1 },
      },
      results = {
        { type = "item", name = "low-density-structure", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.gray,
      energy_required = 4,
      allow_productivity = true,
      auto_recycle = false,
      enabled = false,
    },
    {
      type = "recipe",
      name = "nutrients-bar",
      category = "chemistry-or-cryogenics",
      subgroup = "virentis-materials",
      order = "ba",
      icon = "__virentis-graphics__/icons/items/materials/nutrients-bar.png",
      ingredients = {
        { type = "fluid", name = "nutrients-pulp", amount = 10 },
      },
      results = {
        { type = "item", name = "nutrients-bar", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.yellow,
      energy_required = 0.5,
      enabled = false,
    },
    {
      type = "recipe",
      name = "graphene",
      category = "electronics",
      subgroup = "virentis-materials",
      order = "cb",
      icon = "__virentis-graphics__/icons/items/materials/graphene.png",
      ingredients = {
        { type = "item", name = "carbon",     amount = 2 },
        { type = "item", name = "phosphorus", amount = 1 },
        { type = "item", name = "creosote",   amount = 1 }
      },
      results = {
        { type = "item", name = "graphene", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.gray,
      energy_required = 8,
      allow_productivity = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "sylva-core",
      category = "electronics",
      subgroup = "virentis-materials",
      order = "cb",
      icon = "__virentis-graphics__/icons/items/materials/sylva-core.png",
      ingredients = {
        { type = "item",  name = "graphene",        amount = 4 },
        { type = "item",  name = "processing-unit", amount = 2 },
        { type = "item",  name = "virentis-resin",  amount = 4 },
        { type = "item",  name = "virta-neuron",    amount = 8 },
        { type = "item",  name = "heart-of-nature", amount = 1 },
        { type = "fluid", name = "nutrients-pulp",  amount = 20 }
      },
      results = {
        { type = "item", name = "sylva-core", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.green,
      energy_required = 24,
      allow_productivity = true,
      enabled = false,
    },
    {
      type = "recipe",
      name = "carbon-from-creosote",
      category = "organic",
      subgroup = "virentis-materials",
      order = "ca",
      icon = "__virentis-graphics__/icons/recipes/carbon-from-creosote.png",
      ingredients = {
        { type = "item",  name = "creosote", amount = 1 },
        { type = "item",  name = "wood",     amount = 2 },
        { type = "fluid", name = "methanol", amount = 10 },
      },
      results = {
        { type = "item", name = "carbon", amount = 6 }
      },
      crafting_machine_tint = recipe_tints.yellow,
      energy_required = 12,
      result_is_always_fresh = true,
      allow_productivity = true,
      auto_recycle = false,
      enabled = false,
    },
  }
)
