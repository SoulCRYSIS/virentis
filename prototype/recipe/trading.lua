local function trade_icon(from, to, size_from, size_to)
  ---@type data.IconData[]
  return {
    {
      icon = from,
      icon_size = size_from,
      scale = 0.7,
      shift = { -48, -48 },
    },
    {
      icon = to,
      icon_size = size_to,
      scale = 0.7,
      shift = { 48, 48 },
    },
    {
      icon = "__virentis__/graphic/icon/trade-arrow.png",
      icon_size = 256,
      scale = 0.7,
    },
  }
end

data:extend({
  ---@type data.RecipePrototype
  {
    type = "recipe",
    name = "trade-gnarpod-fruit-to-iron-plate",
    subgroup = "virentis-trades",
    category = "trading-t1",
    order = "a",
    icons = trade_icon("__virentis__/graphic/icon/item/gnarpod-fruit.png", "__base__/graphics/icons/iron-plate.png", 256),
    ingredients = {
      { type = "item", name = "gnarpod-fruit", amount = 1 },
    },
    results = {
      { type = "item", name = "iron-plate", amount = 1 },
    },
  },
})
