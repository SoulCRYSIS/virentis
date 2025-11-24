local item_sounds = require("__base__.prototypes.item_sounds")

data:extend(
---@type data.ItemPrototype[]
  {
    {
      type = "item",
      name = "windmill",
      place_result = "windmill",
      icon = "__virentis__/graphics/icons/machines/windmill.png",
      subgroup = "virentis-machines",
      order = "a",
      inventory_move_sound = item_sounds.mechanical_large_inventory_move,
      pick_sound = item_sounds.mechanical_large_inventory_pickup,
      drop_sound = item_sounds.mechanical_large_inventory_move,
      stack_size = 10,
      default_import_location = "virentis",
      weight = 100 * kg,
    },
    {
      type = "item",
      name = "lumbermill",
      place_result = "lumbermill",
      icon = "__virentis__/graphics/icons/machines/lumbermill.png",
      subgroup = "virentis-machines",
      order = "a",
      inventory_move_sound = item_sounds.mechanical_large_inventory_move,
      pick_sound = item_sounds.mechanical_large_inventory_pickup,
      drop_sound = item_sounds.mechanical_large_inventory_move,
      stack_size = 10,
      default_import_location = "virentis",
      weight = 100 * kg,
    },
    {
      type = "item",
      name = "marketstall",
      place_result = "marketstall",
      icon = "__virentis__/graphics/icons/machines/marketstall.png",
      subgroup = "virentis-machines",
      order = "a",
      inventory_move_sound = item_sounds.mechanical_large_inventory_move,
      pick_sound = item_sounds.mechanical_large_inventory_pickup,
      drop_sound = item_sounds.mechanical_large_inventory_move,
      stack_size = 10,
      default_import_location = "virentis"
    },
    {
      type = "item",
      name = "oven",
      place_result = "oven",
      icon = "__virentis__/graphics/icons/machines/oven.png",
      subgroup = "virentis-machines",
      order = "a",
      inventory_move_sound = item_sounds.mechanical_large_inventory_move,
      pick_sound = item_sounds.mechanical_large_inventory_pickup,
      drop_sound = item_sounds.mechanical_large_inventory_move,
      stack_size = 20,
      default_import_location = "virentis",
      weight = 50 * kg,
    },
  }
)
