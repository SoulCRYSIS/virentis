local sounds = require("__base__.prototypes.entity.sounds")

data:extend(
---@type data.ItemPrototype[]
  {
    {
      type = "item",
      name = "redbloom-salad",
      icon = "__virentis__/graphics/icons/items/foods/redbloom-salad.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 5 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "raw-mudland-buns",
      icons = uncooked_icon("__virentis__/graphics/icons/items/foods/mudland-buns.png"),
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 2 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "cooked-mudland-buns",
      icon = "__virentis__/graphics/icons/items/foods/mudland-buns.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 10 * kg,
    },
    {
      type = "item",
      name = "raw-mudland-pie",
      icons = uncooked_icon("__virentis__/graphics/icons/items/foods/mudland-pie.png"),
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 2 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 10 * kg,
    },
    ---@type data.CapsulePrototype
    {
      type = "capsule",
      name = "cooked-mudland-pie",
      icon = "__virentis__/graphics/icons/items/foods/mudland-pie.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 10 * kg,
      capsule_action = {
        type = "use-on-self",
        attack_parameters = {
          type = "projectile",
          activation_type = "consume",
          ammo_category = "capsule",
          cooldown = 10,
          range = 0,
          ammo_type = {
            target_type = "position",
            action = {
              type = "direct",
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "create-sticker",
                    sticker = "mudland-pie-speed-sticker"
                  },
                  {
                    type = "play-sound",
                    sound = sounds.eat_fish
                  }
                }
              }
            }
          }
        }
      }
    },
    {
      type = "item",
      name = "red-sauce",
      icon = "__virentis__/graphics/icons/items/foods/red-sauce.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 2 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "dough",
      icon = "__virentis__/graphics/icons/items/foods/dough.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 5 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
  })
