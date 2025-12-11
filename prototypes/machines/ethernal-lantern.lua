local virentis = require("prototypes.utils")

local width = 224
local height = 224

data:extend({
  virentis.default_machine_item_prototype("living-inserter"),
  {
    type = "recipe",
    name = "ethernal-lantern",
    category = "crafting",
    order = "a",
    icon = "__virentis__/graphics/icons/machines/living-inserter.png",
    ingredients = {
      { type = "item",  name = "firebrick",       amount = 1 },
      { type = "item",  name = "heart-of-nature", amount = 1 },
      { type = "item",  name = "living-wood",     amount = 2 },
      { type = "fluid", name = "nutrients-pulp",  amount = 10 },
    },
    results = {
      { type = "item", name = "ethernal-lantern", amount = 1 }
    },
    energy_required = 1,
    enabled = false,
    surface_conditions = virentis.surface_condition,
  },
  {
    type = "beacon",
    name = "ethernal-lantern",
    icon = "__virentis__/graphics/icons/machines/ethernal-lantern.png",
    flags = { "placeable-player", "player-creation" },
    minable = { mining_time = 0.1, result = "ethernal-lantern" },
    fast_replaceable_group = "beacon",
    max_health = 200,
    corpse = "beacon-remnants",
    dying_explosion = "beacon-explosion",
    collision_box = { { -0.2, -0.2 }, { 0.2, 0.2 } },
    selection_box = { { -0.25, -0.5 }, { 0.25, 0.25 } },
    damaged_trigger_effect = virentis.default_damaged_trigger_effect,
    drawing_box_vertical_extension = 0.5,
    allowed_effects = { "consumption", "pollution" },
    graphics_set = {
      module_icons_suppressed = true,
      light = { shift = { 0, 0 }, color = { 1, 1, 1 }, intensity = 1, size = 3 },
      animation_list = {
        {
          render_layer = "object",
          always_draw = true,
          animation =
          {
            layers =
            {
              {
                filename = "__virentis__/graphics/entities/machines/eternal-lantern/eternal-lantern.png",
                width = width,
                height = height,
                scale = 0.5,
                variation_count = 2,
              },
              {
                filename = "__virentis__/graphics/entities/machines/eternal-lantern/eternal-lantern-shadow.png",
                width = width,
                height = height,
                scale = 0.5,
                draw_as_shadow = true,
                variation_count = 2,
              },
              {
                filename = "__virentis__/graphics/entities/machines/eternal-lantern/eternal-lantern-glow.png",
                width = width,
                height = height,
                scale = 0.5,
                draw_as_glow = true,
                variation_count = 2,
                blend_mode = "additive",
              }
            }
          }
        },
      },
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    supply_area_distance = 8,
    energy_source = { type = "void" },
    impact_category = "glass",
    energy_usage = "10kW",
    distribution_effectivity = 1,
    distribution_effectivity_bonus_per_quality_level = 0.2,
    profile = { 1, 0 },
    beacon_counter = "same_type",
    module_slots = 1,
    water_reflection =
    {
      pictures =
      {
        filename = "__virentis__/graphics/entities/machines/eternal-lantern/eternal-lantern-water-reflection.png",
        priority = "extra-high",
        width = width,
        height = height,
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
})
