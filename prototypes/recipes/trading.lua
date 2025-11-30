-- local function trade_icon(from, to)
--   ---@type data.IconData[]
--   return {
--     {
--       icon = from,
--       scale = 0.7,
--       shift = { -16, -16 },
--       draw_background = true,
--     },
--     {
--       icon = to,
--       scale = 0.7,
--       shift = { 16, 16 },
--       draw_background = true,
--     },
--     {
--       icon = "__virentis__/graphics/icons/misc/trade-arrow.png",
--       scale = 0.9,
--     },
--   }
-- end

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
      icon = "__virentis__/graphics/icons/items/foods/low-density-structure.png",
      ingredients = {
        { type = "item", name = "taco-salad", amount = 1 }
      },
      results = {
        { type = "item", name = "low-density-structure", amount = 2 }
      },
      energy_required = 1,
    },
    {
      type = "recipe",
      name = "mudland-environment-data",
      category = "trading-t1",
      subgroup = "virentis-trades",
      order = "a",
      icon = "__virentis__/graphics/icons/items/researches/mudland-environment-data.png",
      ingredients = {
        { type = "item", name = "sweet-doughnut",     amount = 1 },
        { type = "item", name = "fried-dumpling-set", amount = 1 },
        { type = "item", name = "taco-salad",         amount = 1 },
        { type = "item", name = "berry-bliss-cookie", amount = 1 }
      },
      results = {
        { type = "item", name = "mudland-environment-data", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.brown,
      energy_required = 1,
    },
  }
)
