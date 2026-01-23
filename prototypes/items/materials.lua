local sounds = require("__base__.prototypes.entity.sounds")

local function throw_grenade_action(projectile_name)
  return {
    type = "throw",
    attack_parameters = {
      type = "projectile",
      activation_type = "throw",
      ammo_category = "grenade",
      cooldown = 60,
      projectile_creation_distance = 0.6,
      range = 30,
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
      name = "virentis-resin",
      icon = "__virentis-graphics__/icons/items/materials/resin.png",
      subgroup = "virentis-materials",
      order = "ab",
      stack_size = 200,
      weight = 5 * kg,
      default_import_location = "virentis",
    },
    {
      type = "item",
      name = "heart-of-nature",
      icon = "__virentis-graphics__/icons/items/materials/heart-of-nature.png",
      subgroup = "virentis-materials-advanced",
      order = "ad",
      stack_size = 50,
      spoil_ticks = 60 * minute,
      spoil_to_trigger_result =
      {
        items_per_trigger = 2,
        trigger =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              {
                type = "create-entity",
                entity_name = "small-strafer-pentapod",
                affects_target = true,
                show_in_tooltip = true,
                as_enemy = true,
                find_non_colliding_position = true,
                abort_if_over_space = false,
                offset_deviation = { { -5, -5 }, { 5, 5 } },
              }
            }
          }
        }
      },
      weight = 10 * kg,
      default_import_location = "virentis",
    },
    {
      type = "item",
      name = "siltcore",
      icon = "__virentis-graphics__/icons/items/materials/siltcore.png",
      subgroup = "virentis-materials-advanced",
      order = "ac",
      stack_size = 50,
      weight = 10 * kg,
      default_import_location = "virentis",
      capsule_action = throw_grenade_action("siltcore-grenade"),
    },
    {
      type = "item",
      name = "firebrick",
      icon = "__virentis-graphics__/icons/items/materials/firebrick.png",
      subgroup = "virentis-materials",
      order = "aa",
      stack_size = 200,
      weight = 5 * kg,
      default_import_location = "virentis",
    },
    {
      type = "item",
      name = "phosphorus",
      icon = "__virentis-graphics__/icons/items/materials/phosphorus.png",
      subgroup = "virentis-materials",
      order = "ae",
      stack_size = 200,
      weight = 5 * kg,
      default_import_location = "virentis",
    },
    {
      type = "item",
      name = "creosote",
      icon = "__virentis-graphics__/icons/items/materials/creosote.png",
      subgroup = "virentis-materials",
      order = "af",
      stack_size = 200,
      weight = 5 * kg,
      default_import_location = "virentis",
      fuel_category = "chemical",
      fuel_value = "12MJ",
    },
    {
      type = "item",
      name = "nutrients-bar",
      icon = "__virentis-graphics__/icons/items/materials/nutrients-bar.png",
      subgroup = "virentis-materials-organic",
      order = "ab",
      stack_size = 50,
      spoil_result = "spoilage",
      spoil_ticks = 15 * minute,
      weight = 5 * kg,
      fuel_category = "nutrients",
      fuel_value = "10MJ",
      default_import_location = "virentis",
    },
    {
      type = "item",
      name = "graphene",
      icon = "__virentis-graphics__/icons/items/materials/graphene.png",
      subgroup = "virentis-materials",
      order = "ag",
      stack_size = 200,
      weight = 5 * kg,
      default_import_location = "virentis",
    },
    {
      type = "item",
      name = "virta-neuron",
      icon = "__virentis-graphics__/icons/items/materials/virta-neuron.png",
      subgroup = "virentis-materials-organic",
      order = "ac",
      stack_size = 50,
      weight = 5 * kg,
      default_import_location = "virentis",
      spoil_result = nil,
      spoil_ticks = 30 * minute,
    },
    {
      type = "item",
      name = "sylva-core",
      icon = "__virentis-graphics__/icons/items/materials/sylva-core.png",
      subgroup = "virentis-materials-advanced",
      order = "ai",
      stack_size = 50,
      weight = 10 * kg,
      default_import_location = "virentis",
    },
    {
      type = "item",
      name = "fish-bones",
      icon = "__virentis-graphics__/icons/items/materials/fish-bones.png",
      subgroup = "virentis-materials-organic",
      order = "aa",
      stack_size = 50,
      weight = 5 * kg,
      default_import_location = "virentis",
    }
  }
)
