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
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 10 * minute,
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
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "rockmalt-pudding",
      icon = "__virentis__/graphics/icons/items/foods/rockmalt-pudding.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "redbloom-buns",
      icon = "__virentis__/graphics/icons/items/foods/redbloom-buns.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    -- ---@type data.CapsulePrototype
    -- {
    --   type = "capsule",
    --   name = "cooked-mudland-pie",
    --   icon = "__virentis__/graphics/icons/items/foods/mudland-pie.png",
    --   subgroup = "virentis-foods",
    --   order = "a",
    --   spoil_ticks = 10 * minute,
    --   spoil_result = "spoilage",
    --   stack_size = 50,
    --   weight = 10 * kg,
    --   capsule_action = {
    --     type = "use-on-self",
    --     attack_parameters = {
    --       type = "projectile",
    --       activation_type = "consume",
    --       ammo_category = "capsule",
    --       cooldown = 10,
    --       range = 0,
    --       ammo_type = {
    --         target_type = "position",
    --         action = {
    --           type = "direct",
    --           action_delivery = {
    --             type = "instant",
    --             target_effects = {
    --               {
    --                 type = "create-sticker",
    --                 sticker = "mudland-pie-speed-sticker"
    --               },
    --               {
    --                 type = "play-sound",
    --                 sound = sounds.eat_fish
    --               }
    --             }
    --           }
    --         }
    --       }
    --     }
    --   }
    -- },
    {
      type = "item",
      name = "fried-dumpling-set",
      icon = "__virentis__/graphics/icons/items/foods/fried-dumpling-set.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 5 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "sweet-doughnut",
      icon = "__virentis__/graphics/icons/items/foods/sweet-doughnut.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 5 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },

    {
      type = "item",
      name = "sweet-chili-sauce",
      icon = "__virentis__/graphics/icons/items/foods/sweet-chili-sauce.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "wild-taco",
      icon = "__virentis__/graphics/icons/items/foods/wild-taco.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 5 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    ---@type data.CapsulePrototype
    {
      type = "capsule",
      name = "berry-bliss-cookie",
      icon = "__virentis__/graphics/icons/items/foods/berry-bliss-cookie.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      capsule_action = eat_action("berry-bliss-cookie-speed-sticker")
    },
    {
      type = "item",
      name = "mangroove-syrup",
      icon = "__virentis__/graphics/icons/items/foods/mangroove-syrup.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 10 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "mangroove-mashed",
      icon = "__virentis__/graphics/icons/items/foods/mangroove-mashed.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 3 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "mudland-medley",
      icon = "__virentis__/graphics/icons/items/foods/mudland-medley.png",
      subgroup = "virentis-foods",
      order = "a",
      spoil_ticks = 3 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      capsule_action = throw_grenade_action("mudland-medley-grenade")
    },
  })
