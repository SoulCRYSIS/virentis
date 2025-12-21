local math3d = require "math3d"

data:extend(
---@type data.StickerPrototype[]
  {
    {
      type = "sticker",
      name = "berry-bliss-cookie-speed-sticker",
      duration_in_ticks = 10 * minute,
      target_movement_modifier = 1.5,
      icon = "__virentis__/graphics/icons/items/foods/berry-bliss-cookie.png",
      flags = { "not-on-map" },
    },
    {
      type = "sticker",
      name = "pentapod-souffle-omelette-speed-sticker",
      duration_in_ticks = 15 * second,
      damage_interval = 1 * second,
      damage_per_tick = {
        amount = 30,
        type = "fire"
      },
      target_movement_modifier = 5,
      icon = "__virentis__/graphics/icons/items/foods/pentapod-souffle-omelette.png",
      flags = { "not-on-map" },
      animation = {
        filename = "__base__/graphics/entity/fire-flame/fire-flame-01.png",
        line_length = 10,
        width = 84,
        height = 130,
        frame_count = 90,
        blend_mode = "normal",
        animation_speed = 1,
        scale = 0.4,
        tint = { r = 0.5, g = 0.5, b = 0.5, a = 0.18 },
        shift = math3d.vector2.mul({ -0.078125, -1.8125 }, 0.1),
        draw_as_glow = true
      },
    }
  }
)
