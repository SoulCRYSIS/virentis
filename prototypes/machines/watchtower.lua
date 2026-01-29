local watchtower = table.deepcopy(data.raw["assembling-machine"]["fishing-dock"])
watchtower.name = "watchtower"
watchtower.minable = nil

--resist electric

local dock_width = 576
local dock_height = 576
watchtower.graphics_set.animation = {
  south = {
    layers = {
      {
        filename = "__fishing-dock__/graphics/entities/fishing-dock.png",
        width = dock_width,
        height = dock_height,
        scale = 0.4,
      },
      {
        filename = "__fishing-dock__/graphics/entities/fishing-dock-shadow.png",
        width = dock_width,
        height = dock_height,
        scale = 0.4,
        draw_as_shadow = true,
      },
      {
        filename = "__fishing-dock__/graphics/entities/fishing-dock-glow.png",
        effect = "flicker",
        width = dock_width,
        height = dock_height,
        scale = 0.4,
        draw_as_glow = true,
        blend_mode = "additive",
      },
      {
        filename = "__virentis-graphics__/graphics/entities/machines/watchtower/radius-visualization.png",
        width = 2048,
        height = 2048,
        scale = 2,
      }
    }
  },
  east = {
    layers = {
      {
        filename = "__fishing-dock__/graphics/entities/fishing-dock.png",
        width = dock_width,
        height = dock_height,
        x = dock_width,
        scale = 0.4,
      },
      {
        filename = "__fishing-dock__/graphics/entities/fishing-dock-shadow.png",
        width = dock_width,
        height = dock_height,
        x = dock_width,
        scale = 0.4,
        draw_as_shadow = true,
      },
      {
        filename = "__fishing-dock__/graphics/entities/fishing-dock-glow.png",
        width = dock_width,
        height = dock_height,
        x = dock_width,
        scale = 0.4,
        draw_as_glow = true,
        blend_mode = "additive",
      },
      {
        filename = "__virentis-graphics__/graphics/entities/machines/watchtower/radius-visualization.png",
        width = 2048,
        height = 2048,
        x = 2048,
        scale = 2,
      }
    }
  },
  north = {
    layers = {
      {
        filename = "__fishing-dock__/graphics/entities/fishing-dock.png",
        width = dock_width,
        height = dock_height,
        x = dock_width * 2,
        scale = 0.4,
      },
      {
        filename = "__fishing-dock__/graphics/entities/fishing-dock-shadow.png",
        width = dock_width,
        height = dock_height,
        x = dock_width * 2,
        scale = 0.4,
        draw_as_shadow = true,
      },
      {
        filename = "__fishing-dock__/graphics/entities/fishing-dock-glow.png",
        width = dock_width,
        height = dock_height,
        x = dock_width * 2,
        scale = 0.4,
        draw_as_glow = true,
        blend_mode = "additive",
      },
      {
        filename = "__virentis-graphics__/graphics/entities/machines/watchtower/radius-visualization.png",
        width = 2048,
        height = 2048,
        x = 2048 * 2,
        scale = 2,
      }
    }
  },
  west = {
    layers = {
      {
        filename = "__fishing-dock__/graphics/entities/fishing-dock.png",
        width = dock_width,
        height = dock_height,
        x = dock_width * 3,
        scale = 0.4,
      },
      {
        filename = "__fishing-dock__/graphics/entities/fishing-dock-shadow.png",
        width = dock_width,
        height = dock_height,
        x = dock_width * 3,
        scale = 0.4,
        draw_as_shadow = true,
      },
      {
        filename = "__fishing-dock__/graphics/entities/fishing-dock-glow.png",
        width = dock_width,
        height = dock_height,
        x = dock_width * 3,
        scale = 0.4,
        draw_as_glow = true,
        blend_mode = "additive",
      },
      {
        filename = "__virentis-graphics__/graphics/entities/machines/watchtower/radius-visualization.png",
        width = 2048,
        height = 2048,
        x = 2048 * 3,
        scale = 2,
      }
    }
  },
}

data:extend({ watchtower })
