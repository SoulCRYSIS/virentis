data:extend(
---@type data.ItemPrototype[]
  {
    {
      type = "item",
      name = "virentis-resin",
      icon = "__virentis__/graphics/icons/items/materials/resin.png",
      subgroup = "virentis-materials",
      order = "ab",
      stack_size = 200,
      weight = 5 * kg,
      default_import_location = "virentis",
    },
    {
      type = "item",
      name = "heart-of-nature",
      icon = "__virentis__/graphics/icons/items/materials/heart-of-nature.png",
      subgroup = "virentis-materials",
      order = "ad",
      stack_size = 50,
      spoil_ticks = 20 * minute,
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
                entity_name = "big-wriggler-pentapod-premature",
                affects_target = true,
                show_in_tooltip = true,
                as_enemy = true,
                find_non_colliding_position = true,
                abort_if_over_space = true,
                offset_deviation = { { -5, -5 }, { 5, 5 } },
                non_colliding_fail_result =
                {
                  type = "direct",
                  action_delivery =
                  {
                    type = "instant",
                    source_effects =
                    {
                      {
                        type = "create-entity",
                        entity_name = "big-strafer-pentapod",
                        affects_target = true,
                        show_in_tooltip = false,
                        as_enemy = true,
                        offset_deviation = { { -1, -1 }, { 1, 1 } },
                      }
                    }
                  }
                }
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
      icon = "__virentis__/graphics/icons/items/materials/siltcore.png",
      subgroup = "virentis-materials",
      order = "ac",
      stack_size = 50,
      weight = 10 * kg,
      default_import_location = "virentis",
    },
    {
      type = "item",
      name = "firebrick",
      icon = "__virentis__/graphics/icons/items/materials/firebrick.png",
      subgroup = "virentis-materials",
      order = "aa",
      stack_size = 200,
      weight = 5 * kg,
      default_import_location = "virentis",
      auto_recycle = false,
    },
    {
      type = "item",
      name = "phosphorus",
      icon = "__virentis__/graphics/icons/items/materials/phosphorus.png",
      subgroup = "virentis-materials",
      order = "ae",
      stack_size = 200,
      weight = 5 * kg,
      default_import_location = "virentis",
      auto_recycle = false,
    },
    {
      type = "item",
      name = "creosote",
      icon = "__virentis__/graphics/icons/items/materials/creosote.png",
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
      icon = "__virentis__/graphics/icons/items/materials/nutrients-bar.png",
      subgroup = "virentis-materials",
      order = "ah",
      stack_size = 200,
      spoil_result = "spoilage",
      spoil_ticks = 15 * minute,
      weight = 5 * kg,
      fuel_category = "nutrients",
      fuel_value = "10MJ",
      default_import_location = "virentis",
      auto_recycle = false,
    },
    {
      type = "item",
      name = "graphene",
      icon = "__virentis__/graphics/icons/items/materials/graphene.png",
      subgroup = "virentis-materials",
      order = "ag",
      stack_size = 200,
      weight = 5 * kg,
      default_import_location = "virentis",
    },
    {
      type = "item",
      name = "sylva-core",
      icon = "__virentis__/graphics/icons/items/materials/sylva-core.png",
      subgroup = "virentis-materials",
      order = "ah",
      stack_size = 50,
      weight = 10 * kg,
      default_import_location = "virentis",
    },
  }
)
