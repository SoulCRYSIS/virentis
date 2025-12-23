local virentis = require("prototypes.utils")

local width = 960
local height = 960

data:extend({
  {
    type = "beacon",
    name = "windmill",
    icon = "__virentis__/graphics/icons/machines/windmill.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    max_health = 10000,
    corpse = "big-remnants",
    dying_explosion = "beacon-explosion",
    collision_box = { { -3.2, -3.2 }, { 3.2, 3.2 } },
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    damaged_trigger_effect = virentis.default_damaged_trigger_effect,
    drawing_box_vertical_extension = 0.5,
    allowed_effects = { "productivity" },
    graphics_set = {
      module_icons_suppressed = true,
      light = { shift = { 0, 0 }, color = { 1, 0.7, 0.5 }, intensity = 0.7, size = 36 },
      animation_list = {
        {
          render_layer = "object",
          always_draw = true,
          animation =
          {
            layers =
            {
              {
                filename = "__virentis__/graphics/entities/machines/windmill/windmill.png",
                width = width,
                height = height,
                scale = 0.7,
                frame_count = 64,
                line_length = 8,
                animation_speed = 0.1,
              },
              {
                filename = "__virentis__/graphics/entities/machines/windmill/windmill-shadow.png",
                width = width,
                height = height,
                scale = 0.7,
                draw_as_shadow = true,
                frame_count = 64,
                line_length = 8,
                animation_speed = 0.1,
              },
              {
                effect = "flicker",
                filename = "__virentis__/graphics/entities/machines/windmill/windmill-glow.png",
                width = width,
                height = height,
                scale = 0.7,
                draw_as_glow = true,
                blend_mode = "additive",
                frame_count = 64,
                line_length = 8,
                animation_speed = 0.1,
              }
            }
          }
        },
      },
    },
    radius_visualisation_picture = virentis.decor_radius_visualisation_picture,
    supply_area_distance = 64,
    energy_source = { type = "void" },
    impact_category = "metal",
    energy_usage = "10kW",
    distribution_effectivity = 1,
    distribution_effectivity_bonus_per_quality_level = 0.2,
    profile = { 1.0, 0.5, 0.33333, 0.25, 0.2, 0.16667, 0.14286, 0.125, 0.11111, 0.1, 0.09091, 0.08333, 0.07692, 0.07143, 0.06667, 0.0625, 0.05882, 0.05556, 0.05263, 0.05, 0.04762, 0.04545, 0.04348, 0.04167, 0.04, 0.03846, 0.03704, 0.03571, 0.03448, 0.03333, 0.03226, 0.03125, 0.0303, 0.02941, 0.02857, 0.02778, 0.02703, 0.02632, 0.02564, 0.025, 0.02439, 0.02381, 0.02326, 0.02273, 0.02222, 0.02174, 0.02128, 0.02083, 0.02041, 0.02 },
    beacon_counter = "same_type",
    module_slots = 20,
    autoplace = {
      order = "aa",
      force = "player",
      probability_expression = "virentis_windmill_spot * 10",
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__virentis__/graphics/entities/machines/windmill/windmill-water-reflection.png",
        priority = "extra-high",
        width = width,
        height = height,
        scale = 0.7
      },
      rotate = false,
      orientation_to_variation = false
    },
    map_color = { 255, 255, 255},
  },
  {
    type = "module",
    name = "windmill-module",
    icon = "__virentis__/graphics/mocks/empty-icon.png",
    subgroup = "module",
    category = "productivity",
    tier = 1,
    order = "z",
    stack_size = 50,
    effect = { productivity = 0.05 },
    auto_recycle = false,
    hidden = true,
  },
})
