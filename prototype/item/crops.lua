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
  ---@type data.ItemPrototype
  {
    type = "item",
    name = "gnarpod-fruit",
    icon = "__virentis__/graphic/icon/item/gnarpod-fruit.png",
    icon_size = 256,
    subgroup = "virentis-crops",
    order = "a",
    spoil_ticks = 5 * minute,
    spoil_result = "spoilage",
    stack_size = 100,
    weight = 2 * kg,
  },
  ---@type data.ItemPrototype
  {
    type = "item",
    name = "coneflora-pollen",
    icon = "__virentis__/graphic/icon/item/coneflora-pollen.png",
    icon_size = 256,
    subgroup = "virentis-crops",
    order = "a",
    spoil_ticks = 5 * minute,
    spoil_result = "spoilage",
    stack_size = 100,
    weight = 2 * kg,
  },
  ---@type data.ItemPrototype
  {
    type = "item",
    name = "puffberry-fruit",
    icon = "__virentis__/graphic/icon/item/puffberry-fruit.png",
    icon_size = 256,
    subgroup = "virentis-crops",
    order = "a",
    spoil_ticks = 5 * minute,
    spoil_result = "spoilage",
    stack_size = 100,
    weight = 2 * kg,
  },
})