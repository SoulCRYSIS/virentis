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
