local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local base_assembling_machine = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
local item_sounds = require("__base__.prototypes.item_sounds")

---@diagnostic disable-next-line: undefined-global
local default_heat_pipe_covers = make_4way_animation_from_spritesheet(
  apply_heat_pipe_glow {
    filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
    width = 64,
    height = 64,
    direction_count = 4,
    scale = 0.5
  })

---@diagnostic disable-next-line: undefined-global
local default_pipe_covers = make_4way_animation_from_spritesheet({
  filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
  width = 64,
  height = 64,
  direction_count = 4,
  scale = 0.5
})

local default_fluid_boxes = {
  {
    production_type = "input",
    volume = 1000,
    pipe_connections = { { flow_direction = "input-output", direction = defines.direction.west, position = { -1, 0 } } },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    volume = 1000,
    pipe_connections = { { flow_direction = "input-output", direction = defines.direction.east, position = { 1, 0 } } },
    secondary_draw_orders = { north = -1 }
  }
}

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

---@param horizontal data.Sprite
---@param vertical data.Sprite
---@return data.Sprite4Way
local function sprite_2way_to_4way(horizontal, vertical)
  return {
    north = horizontal,
    east = vertical,
    south = horizontal,
    west = vertical,
  }
end

---@param horizontal data.Animation
---@param vertical data.Animation
---@return data.Animation4Way
local function animation_2way_to_4way(horizontal, vertical)
  return {
    north = horizontal,
    east = vertical,
    south = horizontal,
    west = vertical,
  }
end

data:extend({
  {
    type = "assembling-machine",
    name = "deep-fryer",
    icon = "__virentis__/graphics/icons/machines/deep-fryer.png",
    subgroup = "virentis-machines",
    order = "a",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    circuit_wire_max_distance = base_assembling_machine.circuit_wire_max_distance,
    circuit_connector = base_assembling_machine.circuit_connector,
    energy_usage = "2.5MW",
    ---@type data.HeatEnergySource
    energy_source = {
      type = "heat",
      max_temperature = 300,
      max_transfer = "1GW",
      min_working_temperature = 165,
      specific_heat = "1MJ",
      connections = two_line_connections,
      heat_picture = sprite_2way_to_4way(
        {
          layers = {
            {
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-horizontal-heated.png",
              width = 320,
              height = 320,
              draw_as_glow = true,
              blend_mode = "additive",
              fadeout = true,
              scale = 0.5,
            },
            apply_heat_pipe_glow({
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-horizontal-heated-pipe.png",
              width = 192,
              height = 192,
              fadeout = true,
              scale = 0.5,
            })
          },
        },
        {
          layers = {
            {
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-vertical-heated.png",
              width = 320,
              height = 320,
              draw_as_glow = true,
              blend_mode = "additive",
              fadeout = true,
              scale = 0.5,
            },
            apply_heat_pipe_glow({
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-vertical-heated-pipe.png",
              width = 192,
              height = 192,
              fadeout = true,
              scale = 0.5,
            })
          },
        }
      ),
      pipe_covers = default_pipe_covers,
      heat_pipe_covers = default_heat_pipe_covers,
    },
    fluid_boxes = default_fluid_boxes,
    fluid_boxes_off_when_no_fluid_recipe = false,
    crafting_categories = { "crafting" },
    crafting_speed = 1,
    module_slots = 0,
    minable = {
      mining_time = 1,
      result = "deep-fryer",
    },
    collision_box = { { -1.3, -1.3 }, { 1.3, 1.3 } },
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    damaged_trigger_effect = hit_effects.entity(),
    max_health = 500,
    dying_explosion = "steel-furnace-explosion",
    resistances = {
      {
        type = "fire",
        percent = 100,
      },
    },
    graphics_set = {
      animation = animation_2way_to_4way(
        {
          layers = {
            {
              filename = "__virentis__/graphics/entities/machines/heatpipe/heatpipe-3x3-horizontal.png",
              priority = "very-low",
              width = 192,
              height = 192,
              scale = 0.5,
            },
            {
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-horizontal.png",
              priority = "very-low",
              width = 320,
              height = 320,
              scale = 0.5,
            },
            {
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-horizontal-shadow.png",
              priority = "very-low",
              width = 320,
              height = 320,
              draw_as_shadow = true,
              scale = 0.5,
            },
          }
        },
        {
          layers = {
            {
              filename = "__virentis__/graphics/entities/machines/heatpipe/heatpipe-3x3-vertical.png",
              priority = "very-low",
              width = 192,
              height = 192,
              scale = 0.5,
            },
            {
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-vertical.png",
              priority = "very-low",
              width = 320,
              height = 320,
              scale = 0.5,
            },
            {
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-vertical-shadow.png",
              priority = "very-low",
              width = 320,
              height = 320,
              draw_as_shadow = true,
              scale = 0.5,
            },
          }
        }
      ),
      working_visualisations = {
        {
          fadeout = true,
          animation = {
            filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-working-animation.png",
            priority = "very-low",
            width = 128,
            height = 128,
            frame_count = 32,
            line_length = 4,
            scale = 0.5,
            shift = { 0, -0.5 },
            animation_speed = 0.2,
          }
        },
        {
          fadeout = true,
          apply_recipe_tint = "primary",
          animation = {
            filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-working-glow.png",
            priority = "very-low",
            width = 320,
            height = 320,
            frame_count = 32,
            line_length = 4,
            draw_as_glow = true,
            blend_mode = "additive-soft",
            scale = 0.5,
          }
        }
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    effect_receiver = { base_effect = { productivity = 0 } },
    impact_category = "metal",
    working_sound =
    {
      sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.45, audible_distance_modifier = 0.5 },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },
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
  {
    type = "recipe",
    name = "deep-fryer",
    category = "crafting",
    order = "a",
    icon = "__virentis__/graphics/icons/machines/deep-fryer.png",
    ingredients = {
      { type = "item", name = "steel-plate", amount = 1 },
    },
    results = {
      { type = "item", name = "deep-fryer", amount = 1 }
    },
    crafting_machine_tint = recipe_tints.green,
    energy_required = 1,
  }
})
