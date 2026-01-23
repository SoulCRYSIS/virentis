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

data:extend(
---@type data.ItemPrototype[]
  {
    {
      type = "item",
      name = "red-sauce",
      icon = "__virentis-graphics__/icons/items/foods/red-sauce.png",
      subgroup = "virentis-foods-basic",
      order = "aa",
      spoil_ticks = 60 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "dough",
      icon = "__virentis-graphics__/icons/items/foods/dough.png",
      subgroup = "virentis-foods-basic",
      order = "ab",
      spoil_ticks = 60 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      fuel_category = "chemical",
      fuel_value = "5MJ",
    },
    {
      type = "item",
      name = "mangroove-mashed",
      icon = "__virentis-graphics__/icons/items/crops/mangroove-mashed.png",
      subgroup = "virentis-foods-basic",
      order = "ac",
      spoil_ticks = 30 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      fuel_category = "chemical",
      fuel_value = "5MJ",
    },
    {
      type = "item",
      name = "rockmalt-pudding",
      icon = "__virentis-graphics__/icons/items/foods/rockmalt-pudding.png",
      subgroup = "virentis-foods-trade-item",
      order = "ba",
      spoil_ticks = 120 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "redbloom-buns",
      icon = "__virentis-graphics__/icons/items/foods/redbloom-buns.png",
      subgroup = "virentis-foods-trade-item",
      order = "bb",
      spoil_ticks = 120 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "flatbread",
      icon = "__virentis-graphics__/icons/items/foods/flatbread.png",
      subgroup = "virentis-foods-basic",
      order = "bc",
      spoil_ticks = 60 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "sweet-chili-sauce",
      icon = "__virentis-graphics__/icons/items/foods/sweet-chili-sauce.png",
      subgroup = "virentis-foods-basic",
      order = "cc",
      spoil_ticks = 60 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "wild-taco",
      icon = "__virentis-graphics__/icons/items/foods/wild-taco.png",
      subgroup = "virentis-foods-trade-item",
      order = "cd",
      spoil_ticks = 60 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    ---@type data.CapsulePrototype
    {
      type = "capsule",
      name = "berry-bliss-cookie",
      icon = "__virentis-graphics__/icons/items/foods/berry-bliss-cookie.png",
      subgroup = "virentis-foods-trade-item",
      order = "bc",
      spoil_ticks = 120 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      capsule_action = eat_action("berry-bliss-cookie-speed-sticker"),
    },
    {
      type = "item",
      name = "mangroove-syrup",
      icon = "__virentis-graphics__/icons/items/foods/mangroove-syrup.png",
      subgroup = "virentis-foods-basic",
      order = "bd",
      spoil_ticks = 60 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "mudland-medley",
      icon = "__virentis-graphics__/icons/items/foods/mudland-medley.png",
      subgroup = "virentis-foods-trade-item",
      order = "cf",
      spoil_ticks = 20 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "soft-cooked-pentapod-egg",
      icon = "__virentis-graphics__/icons/items/foods/soft-cooked-pentapod-egg.png",
      subgroup = "virentis-foods-basic",
      order = "cg",
      spoil_ticks = 60 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "capsule",
      name = "pentapod-souffle-omelette",
      icon = "__virentis-graphics__/icons/items/foods/pentapod-souffle-omelette.png",
      subgroup = "virentis-foods-trade-item",
      order = "ch",
      spoil_ticks = 30 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
      capsule_action = eat_action("pentapod-souffle-omelette-speed-sticker"),
    },
    {
      type = "item",
      name = "fish-fillet",
      icon = "__virentis-graphics__/icons/items/foods/fish-fillet.png",
      subgroup = "virentis-foods-basic",
      order = "da",
      spoil_ticks = 15 * minute,
      spoil_result = "spoilage",
      stack_size = 200,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "citrus-sashimi",
      icon = "__virentis-graphics__/icons/items/foods/citrus-sashimi.png",
      subgroup = "virentis-foods-trade-item",
      order = "db",
      spoil_ticks = 30 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "taiyaki-royale",
      icon = "__virentis-graphics__/icons/items/foods/taiyaki-royale.png",
      subgroup = "virentis-foods-trade-item",
      order = "dc",
      spoil_ticks = 30 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
    {
      type = "item",
      name = "pentapod-bouillon",
      icon = "__virentis-graphics__/icons/items/foods/pentapod-bouillon.png",
      subgroup = "virentis-foods-basic",
      order = "dd",
      spoil_ticks = 60 * minute,
      spoil_result = "spoilage",
      stack_size = 50,
      weight = 5 * kg,
    },
  })
