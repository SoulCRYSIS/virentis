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
      name = "trade-gnarpod-fruit-to-iron-plate",
      subgroup = "virentis-trades",
      category = "trading-t1",
      order = "a",
      icons = trade_icon("__virentis__/graphic/icon/item/gnarpod-fruit.png", "__base__/graphics/icons/iron-plate.png"),
      ingredients = {
        { type = "item", name = "gnarpod-fruit", amount = 1 },
      },
      results = {
        { type = "item", name = "iron-plate", amount = 1 },
      },
    },

  })
