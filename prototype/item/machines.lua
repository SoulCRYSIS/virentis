local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  ---@type data.ItemPrototype
  {
    type = "item",
    name = "windmill",
    place_result = "windmill",
    icon = "__virentis__/graphic/icon/machine/windmill.png",
    icon_size = 256,
    subgroup = "virentis-machines",
    order = "a",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    stack_size = 10,
    default_import_location = "virentis"
  },
})