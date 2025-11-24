local function trade_icon(from, to)
  ---@type data.IconData[]
  return {
    {
      icon = from,
      scale = 0.7,
      shift = { -16, -16 },
      draw_background = true,
    },
    {
      icon = to,
      scale = 0.7,
      shift = { 16, 16 },
      draw_background = true,
    },
    {
      icon = "__virentis__/graphic/icon/trade-arrow.png",
      scale = 0.9,
    },
  }
end

data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "trade-rockmalt-bulb-to-iron-plate",
      subgroup = "virentis-trades",
      category = "trading-t1",
      order = "a",
      icons = trade_icon("__virentis__/graphic/icon/item/rockmalt-bulb.png", "__base__/graphics/icons/iron-plate.png"),
      ingredients = {
        { type = "item", name = "rockmalt-bulb", amount = 1 },
      },
      results = {
        { type = "item", name = "iron-plate", amount = 1 },
      },
    },
    {
      type = "recipe",
      name = "trade-redbloom-mashed-to-copper-plate",
      subgroup = "virentis-trades",
      category = "trading-t1",
      order = "a",
      icons = trade_icon("__virentis__/graphic/icon/item/redbloom-mashed.png", "__base__/graphics/icons/copper-plate.png"),
      ingredients = {
        { type = "item", name = "redbloom-mashed", amount = 1 },
      },
      results = {
        { type = "item", name = "copper-plate", amount = 1 },
      },
    },
    {
      type = "recipe",
      name = "trade-cooked-mudland-buns-to-agricultural-tower", 
      subgroup = "virentis-trades",
      category = "trading-t1",
      order = "a",
      icons = trade_icon("__virentis__/graphic/icon/item/cooked-mudland-buns.png", "__base__/graphics/icons/agricultural-tower.png"),
      ingredients = {
        -- 20 rockmalt + 10 redbloom
        { type = "item", name = "cooked-mudland-buns", amount = 10 },
      },
      results = {
        -- 7.5 copper + 25 iron + 20 spoilage + 50 stone = 25 rockmalt + 7.5 redbloom
        { type = "item", name = "biochamber", amount = 1 }, 
      },
    },
    {
      type = "recipe",
      name = "trade-redbloom-salad-to-electronic-circuit", 
      subgroup = "virentis-trades",
      category = "trading-t1",
      order = "a",
      icons = trade_icon("__virentis__/graphic/icon/item/redbloom-salad.png", "__base__/graphics/icons/electronic-circuit.png"),
      ingredients = {
        -- 1 redbloom + 1 leaves
        { type = "item", name = "redbloom-salad", amount = 1 },
      },
      results = {
        -- 1 rockmalt + 1.5 redbloom
        { type = "item", name = "electronic-circuit", amount = 2 }, 
      },
    },
    {
      type = "recipe",
      name = "trade-cooked-mudland-pie-to-agricultural-tower", 
      subgroup = "virentis-trades",
      category = "trading-t1",
      order = "a",
      icons = trade_icon("__virentis__/graphic/icon/item/cooked-mudland-pie.png", "__base__/graphics/icons/agricultural-tower.png"),
      ingredients = {
        { type = "item", name = "cooked-mudland-pie", amount = 3 },
      },
      results = {
        { type = "item", name = "oven", amount = 1 }, 
      },
    },
  }
)
