local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local base_assembling_machine = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])

data:extend({
  ---@type data.AssemblingMachinePrototype
  {
    type = "assembling-machine",
    name = "windmill",
    icon = "__virentis__/graphics/icons/machines/windmill.png",
    subgroup = "virentis-machines",
    order = "a",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    circuit_wire_max_distance = base_assembling_machine.circuit_wire_max_distance,
    circuit_connector = base_assembling_machine.circuit_connector,
    energy_usage = "10kW",
    energy_source = { type = "void" },
    crafting_categories = { "grinding", "trading-t1" },
    crafting_speed = 1,
    module_slots = 0,
    minable = {
      mining_time = 1,
      result = "windmill",
    },
    collision_box = { { -1.8, -1.8 }, { 1.8, 1.8 } },
    selection_box = { { -2, -2 }, { 2, 2 } },
    damaged_trigger_effect = hit_effects.entity(),
    max_health = 500,
    dying_explosion = "steel-furnace-explosion",
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__virentis__/graphics/entities/machines/windmill/windmill.png",
            priority = "very-low",
            width = 960,
            height = 512,
            frame_count = 128,
            line_length = 8,
            shift = util.by_pixel(100, -50),
            scale = 0.5,
            animation_speed = 1,
          },
          {
            filename = "__virentis__/graphics/entities/machines/windmill/windmill-shadow.png",
            priority = "very-low",
            width = 480,
            height = 256,
            frame_count = 64,
            line_length = 8,
            repeat_count = 2,
            draw_as_shadow = true,
            shift = util.by_pixel(100, -50),
            scale = 1,
            animation_speed = 1,
          },

        },
      },
      working_visualisations = {
        {
          fadeout = true,
          apply_recipe_tint = "primary",
          animation = {
            filename = "__virentis__/graphics/entities/machines/windmill/windmill-glow.png",
            priority = "very-low",
            width = 480,
            height = 256,
            frame_count = 128,
            line_length = 8,
            draw_as_glow = true,
            blend_mode = "additive",
            shift = util.by_pixel(100, -50),
            scale = 1,
            animation_speed = 1,
          },
        },
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    effect_receiver = { uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true },
    impact_category = "metal",
    working_sound =
    {
      sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.45, audible_distance_modifier = 0.5 },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },

  ---@type data.AssemblingMachinePrototype
  {
    type = "assembling-machine",
    name = "lumbermill",
    icon = "__virentis__/graphics/icons/machines/lumbermill.png",
    subgroup = "virentis-machines",
    order = "a",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    circuit_wire_max_distance = base_assembling_machine.circuit_wire_max_distance,
    circuit_connector = base_assembling_machine.circuit_connector,
    energy_usage = "10kW",
    energy_source = { type = "void" },
    crafting_categories = { "woodworking", "trading-t1" },
    crafting_speed = 1,
    module_slots = 0,
    minable = {
      mining_time = 1,
      result = "lumbermill",
    },
    collision_box = { { -1.8, -1.8 }, { 1.8, 1.8 } },
    selection_box = { { -2, -2 }, { 2, 2 } },
    damaged_trigger_effect = hit_effects.entity(),
    max_health = 500,
    dying_explosion = "steel-furnace-explosion",
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__virentis__/graphics/entities/machines/lumbermill/lumbermill.png",
            priority = "very-low",
            width = 512,
            height = 512,
            frame_count = 4,
            line_length = 4,
            repeat_count = 4,
            shift = util.by_pixel(35, -15),
            scale = 0.4,
            animation_speed = 1,
          },
          {
            filename = "__virentis__/graphics/entities/machines/lumbermill/lumbermill-shadow.png",
            priority = "very-low",
            width = 512,
            height = 512,
            frame_count = 1,
            line_length = 1,
            repeat_count = 16,
            draw_as_shadow = true,
            shift = util.by_pixel(35, -15),
            scale = 0.4,
          },

        },
      },
      working_visualisations = {
        {
          fadeout = true,
          apply_recipe_tint = "primary",
          animation = {
            filename = "__virentis__/graphics/entities/machines/lumbermill/lumbermill-glow.png",
            priority = "very-low",
            width = 512,
            height = 512,
            frame_count = 1,
            line_length = 1,
            repeat_count = 16,
            draw_as_glow = true,
            blend_mode = "additive",
            shift = util.by_pixel(35, -15),
            scale = 0.4,
          },
        },
        {
          fadeout = true,
          apply_recipe_tint = "primary",
          animation = {
            filename = "__virentis__/graphics/entities/machines/lumbermill/lumbermill-effect.png",
            priority = "very-low",
            width = 512,
            height = 512,
            frame_count = 16,
            line_length = 4,
            draw_as_glow = true,
            blend_mode = "additive",
            shift = util.by_pixel(35, -15),
            animation_speed = 0.75,
            scale = 0.4,
          },
        },
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    effect_receiver = { uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true },
    impact_category = "metal",
    working_sound =
    {
      sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.45, audible_distance_modifier = 0.5 },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },

  ---@type data.AssemblingMachinePrototype
  {
    type = "assembling-machine",
    name = "marketstall",
    icon = "__virentis__/graphics/icons/machines/marketstall.png",
    subgroup = "virentis-machines",
    order = "a",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    circuit_wire_max_distance = base_assembling_machine.circuit_wire_max_distance,
    circuit_connector = base_assembling_machine.circuit_connector,
    energy_usage = "10kW",
    energy_source = { type = "void" },
    crafting_categories = { "trading-t1" },
    crafting_speed = 1,
    module_slots = 0,
    minable = {
      mining_time = 1,
      result = "marketstall",
    },
    collision_box = { { -1.8, -1.8 }, { 1.8, 1.8 } },
    selection_box = { { -2, -2 }, { 2, 2 } },
    damaged_trigger_effect = hit_effects.entity(),
    max_health = 500,
    dying_explosion = "steel-furnace-explosion",
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__virentis__/graphics/entities/machines/marketstall/marketstall.png",
            priority = "very-low",
            width = 456,
            height = 285,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(40, -3),
            scale = 0.5,
          },
          {
            filename = "__virentis__/graphics/entities/machines/marketstall/marketstall-shadow.png",
            priority = "very-low",
            width = 456,
            height = 285,
            frame_count = 1,
            line_length = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(40, -3),
            scale = 0.5,
          },
        },
      },
      working_visualisations = {
        {
          fadeout = true,
          apply_recipe_tint = "primary",
          animation = {
            filename = "__virentis__/graphics/entities/machines/marketstall/marketstall-glow.png",
            priority = "very-low",
            width = 456,
            height = 285,
            frame_count = 1,
            line_length = 1,
            draw_as_glow = true,
            blend_mode = "additive",
            shift = util.by_pixel(40, -3),
            scale = 0.5,
          },
        },
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    effect_receiver = { uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true },
    impact_category = "metal",
    working_sound =
    {
      sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.45, audible_distance_modifier = 0.5 },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    autoplace = {
      probability_expression = "spot_noise{x = x,\z
                                                 y = y,\z
                                                 seed0 = map_seed,\z
                                                 seed1 = 10,\z
                                                 density_expression = 1,\z
                                                 spot_radius_expression = 32,\z
                                                 spot_quantity_expression = 5,\z
                                                 spot_favorability_expression = 1,\z
                                                 basement_value = 0,\z
                                                 maximum_spot_basement_radius = 16}",
      richness_expression = "random_penalty_at(3, 1)"
    }
  },

  ---@type data.AssemblingMachinePrototype
  {
    type = "assembling-machine",
    name = "oven",
    icon = "__virentis__/graphics/icons/machines/oven.png",
    subgroup = "virentis-machines",
    order = "a",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    circuit_wire_max_distance = base_assembling_machine.circuit_wire_max_distance,
    circuit_connector = base_assembling_machine.circuit_connector,
    energy_usage = "5MW",
    ---@type data.HeatEnergySource
    energy_source = {
      type = "heat",
      max_temperature = 300,
      max_transfer = "1GW",
      min_working_temperature = 165,
      specific_heat = "1MJ",
      connections =
      {
        {
          position = { 0, 0 },
          direction = defines.direction.north
        },
        {
          position = { 0, 0 },
          direction = defines.direction.east
        },
        {
          position = { 0, 0 },
          direction = defines.direction.south
        },
        {
          position = { 0, 0 },
          direction = defines.direction.west
        }
      }
    },
    crafting_categories = { "baking" },
    crafting_speed = 5,
    module_slots = 0,
    minable = {
      mining_time = 1,
      result = "oven",
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
      animation = {
        layers = {
          {
            filename = "__virentis__/graphics/entities/machines/oven/oven.png",
            priority = "very-low",
            width = 380,
            height = 280,
            shift = util.by_pixel(45, -22),
            scale = 0.5,
          },
          {
            filename = "__virentis__/graphics/entities/machines/oven/oven-shadow.png",
            priority = "very-low",
            width = 380,
            height = 280,
            draw_as_shadow = true,
            shift = util.by_pixel(45, -22),
            scale = 0.5,
          },
        },
      },
      working_visualisations = {
        {
          fadeout = true,
          apply_recipe_tint = "primary",
          animation = {
            filename = "__virentis__/graphics/entities/machines/oven/oven-glow.png",
            priority = "very-low",
            width = 380,
            height = 280,
            frame_count = 16,
            line_length = 4,
            draw_as_glow = true,
            blend_mode = "additive",
            shift = util.by_pixel(45, -22),
            scale = 0.5,
          },
        },
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    effect_receiver = { base_effect = { productivity = 0.5 } },
    impact_category = "metal",
    working_sound =
    {
      sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.45, audible_distance_modifier = 0.5 },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },
})
