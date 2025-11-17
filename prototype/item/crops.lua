data:extend({
  {
    type = "item-subgroup",
    name = "virentis-crops",
    group = "intermediate-products",
    order = "fa"
  },
})

data:extend({
  ---@type data.ItemPrototype
  {
    type = "item",
    name = "vangrove-fruit",
    icon = "__virentis__/graphic/icon/item/vangrove-fruit.png",
    icon_size = 128,
    subgroup = "virentis-crops",
    order = "a",
    spoil_ticks = 5 * minute,
    spoil_result = "spoilage",
    stack_size = 100,
    weight = 2 * kg,
  },
})