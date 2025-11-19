local function trade_icon(from, to, size)
  ---@type data.IconData[]
  return {
    {
      icon = "__virentis__/graphic/icon/" .. from .. ".png",
      icon_size = size or 256,
      scale = 0.7,
      shift = { -48, -48 },
    },
    {
      icon = "__virentis__/graphic/icon/" .. to .. ".png",
      icon_size = size or 256,
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
    icon = trade_icon("gnarpod-fruit", "iron-plate"),
    ingredients = {
      { type = "item", name = "gnarpod-fruit", amount = 1 },
    },
    results = {
      { type = "item", name = "iron-plate", amount = 1 },
    },
  },
})
