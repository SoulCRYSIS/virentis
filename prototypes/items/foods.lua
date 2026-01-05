local sounds = require("__base__.prototypes.entity.sounds")

---@param buff_name string
---@return data.UseOnSelfCapsuleAction
local function eat_action(buff_name)
  return {
    type = "use-on-self",
    attack_parameters = {
      type = "projectile",
      activation_type = "consume",
      ammo_category = "capsule",
      cooldown = 30,
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
                sticker = buff_name
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
end

local function throw_grenade_action(projectile_name)
  return {
    type = "throw",
    attack_parameters = {
      type = "projectile",
      activation_type = "throw",
      ammo_category = "grenade",
      cooldown = 30,
      projectile_creation_distance = 0.6,
      range = 15,
      ammo_type = {
        target_type = "position",
        action = {
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = projectile_name,
              starting_speed = 0.3
            }
          },
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "play-sound",
                  sound = sounds.throw_projectile
                },
                {
                  type = "play-sound",
                  sound = sounds.throw_grenade
                },
              }
            }
          }
        }
      }
    }
  }
end

data:extend(
---@type data.ItemPrototype[]
  {
    {
      type = "item",
      name = "red-sauce",
      icon = "__virentis__/graphics/icons/items/foods/red-sauce.png",
      subgroup = "virentis-foods-basic",
      order = "aa",
      spoil_ticks = 20 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      auto_recycle = false,
    },
    {
      type = "item",
      name = "dough",
      icon = "__virentis__/graphics/icons/items/foods/dough.png",
      subgroup = "virentis-foods-basic",
      order = "ab",
      spoil_ticks = 20 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      auto_recycle = false,
      fuel_category = "chemical",
      fuel_value = "5MJ",
    },
    {
      type = "item",
      name = "mangroove-mashed",
      icon = "__virentis__/graphics/icons/items/crops/mangroove-mashed.png",
      subgroup = "virentis-foods-basic",
      order = "ac",
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      auto_recycle = false,
      fuel_category = "chemical",
      fuel_value = "5MJ",
    },
    {
      type = "item",
      name = "rockmalt-pudding",
      icon = "__virentis__/graphics/icons/items/foods/rockmalt-pudding.png",
      subgroup = "virentis-foods-trade-item",
      order = "ba",
      spoil_ticks = 5 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      auto_recycle = false,
    },
    {
      type = "item",
      name = "redbloom-buns",
      icon = "__virentis__/graphics/icons/items/foods/redbloom-buns.png",
      subgroup = "virentis-foods-trade-item",
      order = "bb",
      spoil_ticks = 5 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      auto_recycle = false,
    },
    {
      type = "item",
      name = "flatbread",
      icon = "__virentis__/graphics/icons/items/foods/flatbread.png",
      subgroup = "virentis-foods-basic",
      order = "bc",
      spoil_ticks = 20 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      auto_recycle = false,
    },
    {
      type = "item",
      name = "fried-dumpling-set",
      icon = "__virentis__/graphics/icons/items/foods/fried-dumpling-set.png",
      subgroup = "virentis-foods-trade-item",
      order = "ca",
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      auto_recycle = false,
    },
    {
      type = "item",
      name = "sweet-doughnut",
      icon = "__virentis__/graphics/icons/items/foods/sweet-doughnut.png",
      subgroup = "virentis-foods-trade-item",
      order = "cb",
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      auto_recycle = false,
    },
    {
      type = "item",
      name = "sweet-chili-sauce",
      icon = "__virentis__/graphics/icons/items/foods/sweet-chili-sauce.png",
      subgroup = "virentis-foods-basic",
      order = "cc",
      spoil_ticks = 20 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      auto_recycle = false,
    },
    {
      type = "item",
      name = "wild-taco",
      icon = "__virentis__/graphics/icons/items/foods/wild-taco.png",
      subgroup = "virentis-foods-trade-item",
      order = "cd",
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      auto_recycle = false,
    },
    ---@type data.CapsulePrototype
    {
      type = "capsule",
      name = "berry-bliss-cookie",
      icon = "__virentis__/graphics/icons/items/foods/berry-bliss-cookie.png",
      subgroup = "virentis-foods-trade-item",
      order = "bc",
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      capsule_action = eat_action("berry-bliss-cookie-speed-sticker"),
      auto_recycle = false,
    },
    {
      type = "item",
      name = "mangroove-syrup",
      icon = "__virentis__/graphics/icons/items/foods/mangroove-syrup.png",
      subgroup = "virentis-foods-basic",
      order = "bd",
      spoil_ticks = 20 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      auto_recycle = false,
    },
    {
      type = "capsule",
      name = "mudland-medley",
      icon = "__virentis__/graphics/icons/items/foods/mudland-medley.png",
      subgroup = "virentis-foods-trade-item",
      order = "cf",
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      capsule_action = throw_grenade_action("mudland-medley-grenade"),
      auto_recycle = false,
    },
    {
      type = "item",
      name = "soft-cooked-pentapod-egg",
      icon = "__virentis__/graphics/icons/items/foods/soft-cooked-pentapod-egg.png",
      subgroup = "virentis-foods-basic",
      order = "cg",
      spoil_ticks = 20 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      auto_recycle = false,
    },
    {
      type = "capsule",
      name = "pentapod-souffle-omelette",
      icon = "__virentis__/graphics/icons/items/foods/pentapod-souffle-omelette.png",
      subgroup = "virentis-foods-trade-item",
      order = "ch",
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      capsule_action = eat_action("pentapod-souffle-omelette-speed-sticker"),
      auto_recycle = false,
    },
  })
