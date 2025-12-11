---@diagnostic disable: assign-type-mismatch, undefined-global

base_assembling_machine = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
local item_sounds = require("__base__.prototypes.item_sounds")

local virentis = {}

---@type table<string, data.RecipeTints>
virentis.recipe_tints = {
  red = { primary = { r = 1, g = 0, b = 0, a = 1 } },
  green = { primary = { r = 0, g = 1, b = 0, a = 1 } },
  blue = { primary = { r = 0, g = 0, b = 1, a = 1 } },
  yellow = { primary = { r = 1, g = 1, b = 0, a = 1 } },
  purple = { primary = { r = 1, g = 0, b = 1, a = 1 } },
  orange = { primary = { r = 1, g = 0.5, b = 0, a = 1 } },
  brown = { primary = { r = 0.5, g = 0.25, b = 0, a = 1 } },
  gray = { primary = { r = 0.5, g = 0.5, b = 0.5, a = 1 } },
  black = { primary = { r = 0, g = 0, b = 0, a = 1 } },
  white = { primary = { r = 1, g = 1, b = 1, a = 1 } },
}

---@type data.Sprite4Way
virentis.default_heat_pipe_covers = make_4way_animation_from_spritesheet(
  apply_heat_pipe_glow {
    filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
    width = 64,
    height = 64,
    direction_count = 4,
    scale = 0.5
  })

---@type data.Sprite4Way
virentis.default_pipe_covers = make_4way_animation_from_spritesheet({
  filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
  width = 64,
  height = 64,
  direction_count = 4,
  scale = 0.5
})

---@type data.FluidBox[]
virentis.pass_middle_fluid_box = {
  {
    production_type = "input",
    volume = 100,
    pipe_connections = { { flow_direction = "input-output", direction = defines.direction.west, position = { -1, 0 } } },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "input",
    volume = 100,
    pipe_connections = { { flow_direction = "input-output", direction = defines.direction.east, position = { 1, 0 } } },
    secondary_draw_orders = { north = -1 }
  }
}

---@type data.HeatConnection[]
virentis.two_line_connections = {
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
virentis.sprite_2way_to_4way = function(horizontal, vertical)
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
virentis.animation_2way_to_4way = function(horizontal, vertical)
  return {
    north = horizontal,
    east = vertical,
    south = horizontal,
    west = vertical,
  }
end

---@type data.WorkingSound
virentis.default_working_sound = {
  sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.45, audible_distance_modifier = 0.5 },
  fade_in_ticks = 4,
  fade_out_ticks = 20
}

---@param name string
---@return data.ItemPrototype
virentis.default_machine_item_prototype = function(name)
  return {
    type = "item",
    name = name,
    place_result = name,
    icon = "__virentis__/graphics/icons/machines/" .. name .. ".png",
    subgroup = "virentis-machines",
    order = "a",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    stack_size = 10,
    default_import_location = "virentis",
    weight = 100 * kg,
  }
end

---@type data.CircuitConnectorDefinition[]
virentis.default_machine_circuit_connector = base_assembling_machine.circuit_connector
---@type data.CircuitConnectorDefinition[]
virentis.default_inserter_circuit_connector = circuit_connector_definitions["inserter"]
---@type data.CircuitConnectorDefinition[]
virentis.default_lamp_circuit_connector = circuit_connector_definitions["lamp"]

---@type number
virentis.default_circuit_wire_distance = 9
---@type data.SignalIDConnector
virentis.default_inserter_stack_control_input_signal = inserter_default_stack_control_input_signal

---@type data.SurfaceCondition[]
virentis.surface_condition = {
  {
    property = "pressure",
    min = 2000,
    max = 2000
  }
}

virentis.default_damaged_trigger_effect = hit_effects.entity()

return virentis
