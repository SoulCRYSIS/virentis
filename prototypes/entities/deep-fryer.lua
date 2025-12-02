local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local base_assembling_machine = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
local item_sounds = require("__base__.prototypes.item_sounds")

local biochamber_pictures = require("__space-age__.prototypes.entity.biochamber-pictures")

local function make_identical_4way(sprite)
  return {
    north = sprite,
    east = sprite,
    south = sprite,
    west = sprite,
  }
end

---@param base_layers data.Sprite[]
---@param horizontal_glow string
---@param vertical_glow string
---@return data.Sprite4Way
local function apply_heatpipe_glow_layer(base_layers, horizontal_glow, vertical_glow)
  local horizontal = table.deepcopy(base_layers)
  table.insert(horizontal, 1, apply_heat_pipe_glow({
    filename = horizontal_glow,
    priority = "very-low",
    width = 192,
    height = 192,
    shift = util.by_pixel(0, 0),
    scale = 0.5,
  }))
  ---@type data.Animation
  local horizontal_animation = { layers = horizontal }

  local vertical = table.deepcopy(base_layers)
  table.insert(vertical, 1, apply_heat_pipe_glow({
    filename = vertical_glow,
    priority = "very-low",
    width = 192,
    height = 192,
    shift = util.by_pixel(0, 0),
    scale = 0.5,
  }))
  ---@type data.Animation
  local vertical_animation = { layers = vertical }

  return {
    north = horizontal_animation,
    east = vertical_animation,
    south = horizontal_animation,
    west = vertical_animation,
  }
end

---@param base_layers data.Animation[]
---@return data.Animation4Way
local function apply_heatpipe_layer(base_layers)
  local horizontal = table.deepcopy(base_layers)
  table.insert(horizontal, 1, {
    filename = "__virentis__/graphics/entities/machines/heatpipe/heatpipe-3x3-horizontal.png",
    priority = "very-low",
    width = 192,
    height = 192,
    shift = util.by_pixel(0, 0),
    scale = 0.5,
  })
  ---@type data.Animation
  local horizontal_animation = { layers = horizontal }

  local vertical = table.deepcopy(base_layers)
  table.insert(vertical, 1, {
    filename = "__virentis__/graphics/entities/machines/heatpipe/heatpipe-3x3-vertical.png",
    priority = "very-low",
    width = 192,
    height = 192,
    shift = util.by_pixel(0, 0),
    scale = 0.5,
  })
  ---@type data.Animation
  local vertical_animation = { layers = vertical }

  return {
    north = horizontal_animation,
    east = vertical_animation,
    south = horizontal_animation,
    west = vertical_animation,
  }
end

---@diagnostic disable-next-line: undefined-global
local default_pipe_covers = make_4way_animation_from_spritesheet({
  filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
  width = 64,
  height = 64,
  direction_count = 4,
  scale = 0.5
})

---@diagnostic disable-next-line: undefined-global
local default_heat_pipe_covers = make_4way_animation_from_spritesheet(
---@diagnostic disable-next-line: undefined-global
  apply_heat_pipe_glow {
    filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
    width = 64,
    height = 64,
    direction_count = 4,
    scale = 0.5
  })

---@diagnostic disable-next-line: undefined-global
local default_pipe_pictures = assembler2pipepictures()

local short_pipe_pictures = {
  north = {
    layers = {
      util.sprite_load("__space-age__/graphics/entity/biochamber/biochamber-pipes-north-1", {
        scale = 0.5,
        shift = { 1, 2 },
      }),
      util.sprite_load("__space-age__/graphics/entity/biochamber/biochamber-pipes-north-shadow", {
        draw_as_shadow = true,
        scale = 0.5,
        shift = { 1, 2 }
      })
    }
  },
  east = {
    layers = {
      util.sprite_load("__space-age__/graphics/entity/biochamber/biochamber-pipes-east-2", {
        scale = 0.5,
        shift = { -2, 1 },
      }),
      util.sprite_load("__space-age__/graphics/entity/biochamber/biochamber-pipes-east-shadow", {
        draw_as_shadow = true,
        scale = 0.5,
        shift = { -2, 1 }
      })
    }
  },
  south = {
    layers = {
      util.sprite_load("__space-age__/graphics/entity/biochamber/biochamber-pipes-south-1", {
        scale = 0.5,
        shift = { -1, -2 },
      }),
      util.sprite_load("__space-age__/graphics/entity/biochamber/biochamber-pipes-south-shadow", {
        draw_as_shadow = true,
        scale = 0.5,
        shift = { -1, -2 }
      })
    }
  },
  west = {
    layers = {
      util.sprite_load("__space-age__/graphics/entity/biochamber/biochamber-pipes-west-2", {
        scale = 0.5,
        shift = { 2, -1 },
      }),
    }
  }
}

local default_fluid_boxes = {
  {
    production_type = "input",
    pipe_picture = default_pipe_pictures,
    ---@diagnostic disable-next-line: undefined-global
    pipe_covers = pipecoverspictures(),
    volume = 1000,
    pipe_connections = { { flow_direction = "input-output", direction = defines.direction.west, position = { -1, 0 } } },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_picture = default_pipe_pictures,
    ---@diagnostic disable-next-line: undefined-global
    pipe_covers = pipecoverspictures(),
    volume = 1000,
    pipe_connections = { { flow_direction = "input-output", direction = defines.direction.east, position = { 1, 0 } } },
    secondary_draw_orders = { north = -1 }
  }
}

-- local corner_connections = {
--   {
--     position = { 1, 1 },
--     direction = defines.direction.east,
--   },
--   {
--     position = { -1, 1 },
--     direction = defines.direction.west,
--   },
--   {
--     position = { 1, -1 },
--     direction = defines.direction.east,
--   },
--   {
--     position = { -1, -1 },
--     direction = defines.direction.west,
--   },
--   {
--     position = { 1, 1 },
--     direction = defines.direction.south,
--   },
--   {
--     position = { -1, 1 },
--     direction = defines.direction.south,
--   },
--   {
--     position = { 1, -1 },
--     direction = defines.direction.north,
--   },
--   {
--     position = { -1, -1 },
--     direction = defines.direction.north,
--   },
-- }

local two_line_connections = {
  {
    position = { 1, 1 },
    direction = defines.direction.east,
  },
  {
    position = { -1, 1 },
    direction = defines.direction.west,
  },
  {
    position = { 1, -1 },
    direction = defines.direction.east,
  },
  {
    position = { -1, -1 },
    direction = defines.direction.west,
  },
}

data:extend({
  
  {
    type = "item",
    name = "deep-fryer",
    place_result = "deep-fryer",
    icon = "__virentis__/graphics/icons/machines/deep-fryer.png",
    subgroup = "virentis-machines",
    order = "a",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    stack_size = 10,
    -- default_import_location = "virentis",
    weight = 100 * kg,
  },
})
