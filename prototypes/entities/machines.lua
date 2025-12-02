local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local base_assembling_machine = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])

---@param base_layers data.Sprite[]
---@param horizontal_glow string
---@param vertical_glow string
---@return data.Sprite4Way
local function apply_heatpipe_glow_layer(base_layers, horizontal_glow, vertical_glow)
  local horizontal = table.deepcopy(base_layers)
  ---@diagnostic disable-next-line: undefined-global
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
  ---@diagnostic disable-next-line: undefined-global
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

data:extend(
---@type data.AssemblingMachinePrototype[]
  {
    -- ---@type data.ContainerPrototype
    -- {
    --   type = "container",
    --   name = "composter",
    --   icon = "__base__/graphics/icons/wooden-chest.png",
    --   icon_size = 64,
    --   flags = { "placeable-neutral", "player-creation" },
    --   minable = { mining_time = 1, result = "composter" },
    --   max_health = 100,
    --   corpse = "small-remnants",
    --   collision_box = { { -0.35, -0.35 }, { 0.35, 0.35 } },
    --   selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    --   fast_replaceable_group = "container",
    --   inventory_size = 16,
    --   open_sound = { filename = "__base__/sound/wooden-chest-open.ogg", volume = 0.6 },
    --   close_sound = { filename = "__base__/sound/wooden-chest-close.ogg", volume = 0.6 },
    --   picture = {
    --     layers = {
    --       {
    --         filename = "__base__/graphics/entity/wooden-chest/wooden-chest.png",
    --         priority = "extra-high",
    --         width = 64,
    --         height = 80,
    --         shift = util.by_pixel(0, -10),
    --         tint = { r = 0.5, g = 0.8, b = 0.5, a = 1 },
    --         scale = 0.5
    --       },
    --       {
    --         filename = "__base__/graphics/entity/wooden-chest/wooden-chest-shadow.png",
    --         priority = "extra-high",
    --         width = 64,
    --         height = 80,
    --         shift = util.by_pixel(10, 0),
    --         draw_as_shadow = true,
    --         scale = 0.5
    --       }
    --     }
    --   },
    --   circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    --   circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    --   circuit_wire_max_distance = 9 -- default_circuit_wire_max_distance
    -- },

    -- ---@type data.AssemblingMachinePrototype
    -- {
    --   type = "assembling-machine",
    --   name = "windmill",
    --   icon = "__virentis__/graphics/icons/machines/windmill.png",
    --   subgroup = "virentis-machines",
    --   order = "a",
    --   flags = { "placeable-neutral", "placeable-player", "player-creation" },
    --   circuit_wire_max_distance = base_assembling_machine.circuit_wire_max_distance,
    --   circuit_connector = base_assembling_machine.circuit_connector,
    --   energy_usage = "10kW",
    --   energy_source = { type = "void" },
    --   crafting_categories = { "grinding", "trading-t1" },
    --   crafting_speed = 1,
    --   module_slots = 0,
    --   minable = {
    --     mining_time = 1,
    --     result = "windmill",
    --   },
    --   collision_box = { { -1.8, -1.8 }, { 1.8, 1.8 } },
    --   selection_box = { { -2, -2 }, { 2, 2 } },
    --   damaged_trigger_effect = hit_effects.entity(),
    --   max_health = 500,
    --   dying_explosion = "steel-furnace-explosion",
    --   graphics_set = {
    --     animation = {
    --       layers = {
    --         {
    --           filename = "__virentis__/graphics/entities/machines/windmill/windmill.png",
    --           priority = "very-low",
    --           width = 960,
    --           height = 512,
    --           frame_count = 128,
    --           line_length = 8,
    --           shift = util.by_pixel(100, -50),
    --           scale = 0.5,
    --           animation_speed = 1,
    --         },
    --         {
    --           filename = "__virentis__/graphics/entities/machines/windmill/windmill-shadow.png",
    --           priority = "very-low",
    --           width = 480,
    --           height = 256,
    --           frame_count = 64,
    --           line_length = 8,
    --           repeat_count = 2,
    --           draw_as_shadow = true,
    --           shift = util.by_pixel(100, -50),
    --           scale = 1,
    --           animation_speed = 1,
    --         },

    --       },
    --     },
    --     working_visualisations = {
    --       {
    --         fadeout = true,
    --         apply_recipe_tint = "primary",
    --         animation = {
    --           filename = "__virentis__/graphics/entities/machines/windmill/windmill-glow.png",
    --           priority = "very-low",
    --           width = 480,
    --           height = 256,
    --           frame_count = 128,
    --           line_length = 8,
    --           draw_as_glow = true,
    --           blend_mode = "additive",
    --           shift = util.by_pixel(100, -50),
    --           scale = 1,
    --           animation_speed = 1,
    --         },
    --       },
    --     },
    --   },
    --   open_sound = sounds.machine_open,
    --   close_sound = sounds.machine_close,
    --   effect_receiver = { uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true },
    --   impact_category = "metal",
    --   working_sound =
    --   {
    --     sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.45, audible_distance_modifier = 0.5 },
    --     fade_in_ticks = 4,
    --     fade_out_ticks = 20
    --   }
    -- },
    -- {
    --   type = "assembling-machine",
    --   name = "lumbermill",
    --   icon = "__virentis__/graphics/icons/machines/lumbermill.png",
    --   subgroup = "virentis-machines",
    --   order = "a",
    --   flags = { "placeable-neutral", "placeable-player", "player-creation" },
    --   circuit_wire_max_distance = base_assembling_machine.circuit_wire_max_distance,
    --   circuit_connector = base_assembling_machine.circuit_connector,
    --   energy_usage = "10kW",
    --   energy_source = { type = "void" },
    --   crafting_categories = { "woodworking", "trading-t1" },
    --   crafting_speed = 1,
    --   module_slots = 0,
    --   minable = {
    --     mining_time = 1,
    --     result = "lumbermill",
    --   },
    --   collision_box = { { -1.8, -1.8 }, { 1.8, 1.8 } },
    --   selection_box = { { -2, -2 }, { 2, 2 } },
    --   damaged_trigger_effect = hit_effects.entity(),
    --   max_health = 500,
    --   dying_explosion = "steel-furnace-explosion",
    --   graphics_set = {
    --     animation = {
    --       layers = {
    --         {
    --           filename = "__virentis__/graphics/entities/machines/lumbermill/lumbermill.png",
    --           priority = "very-low",
    --           width = 512,
    --           height = 512,
    --           frame_count = 4,
    --           line_length = 4,
    --           repeat_count = 4,
    --           shift = util.by_pixel(35, -15),
    --           scale = 0.4,
    --           animation_speed = 1,
    --         },
    --         {
    --           filename = "__virentis__/graphics/entities/machines/lumbermill/lumbermill-shadow.png",
    --           priority = "very-low",
    --           width = 512,
    --           height = 512,
    --           frame_count = 1,
    --           line_length = 1,
    --           repeat_count = 16,
    --           draw_as_shadow = true,
    --           shift = util.by_pixel(35, -15),
    --           scale = 0.4,
    --         },

    --       },
    --     },
    --     working_visualisations = {
    --       {
    --         fadeout = true,
    --         apply_recipe_tint = "primary",
    --         animation = {
    --           filename = "__virentis__/graphics/entities/machines/lumbermill/lumbermill-glow.png",
    --           priority = "very-low",
    --           width = 512,
    --           height = 512,
    --           frame_count = 1,
    --           line_length = 1,
    --           repeat_count = 16,
    --           draw_as_glow = true,
    --           blend_mode = "additive",
    --           shift = util.by_pixel(35, -15),
    --           scale = 0.4,
    --         },
    --       },
    --       {
    --         fadeout = true,
    --         apply_recipe_tint = "primary",
    --         animation = {
    --           filename = "__virentis__/graphics/entities/machines/lumbermill/lumbermill-effect.png",
    --           priority = "very-low",
    --           width = 512,
    --           height = 512,
    --           frame_count = 16,
    --           line_length = 4,
    --           draw_as_glow = true,
    --           blend_mode = "additive",
    --           shift = util.by_pixel(35, -15),
    --           animation_speed = 0.75,
    --           scale = 0.4,
    --         },
    --       },
    --     },
    --   },
    --   open_sound = sounds.machine_open,
    --   close_sound = sounds.machine_close,
    --   effect_receiver = { uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true },
    --   impact_category = "metal",
    --   working_sound =
    --   {
    --     sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.45, audible_distance_modifier = 0.5 },
    --     fade_in_ticks = 4,
    --     fade_out_ticks = 20
    --   }
    -- },
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
                                           density_expression = 0.1,\z
                                           spot_radius_expression = 32,\z
                                           spot_quantity_expression = 3,\z
                                           spot_favorability_expression = 1,\z
                                           basement_value = 0,\z
                                           maximum_spot_basement_radius = 16,\z
                                           region_size = 1024}",
        richness_expression = "random_penalty_at(3, 1)"
      }
    },
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
        connections = {
          {
            position = { -1.5, -1.5 },
            ---@diagnostic disable-next-line: assign-type-mismatch
            direction = defines.direction.northeast
          },
          {
            position = { 1.5, -1.5 },
            ---@diagnostic disable-next-line: assign-type-mismatch
            direction = defines.direction.southeast
          },
          {
            position = { -1.5, 1.5 },
            ---@diagnostic disable-next-line: assign-type-mismatch
            direction = defines.direction.southwest
          },
          {
            position = { 1.5, 1.5 },
            ---@diagnostic disable-next-line: assign-type-mismatch
            direction = defines.direction.northwest
          }
        },
        light_flicker = {
          color = { r = 1, g = 0.4, b = 0.1 }, -- fiery orange-red glow
          minimum_intensity = 0.75,
          maximum_intensity = 0.95,
        },
        smoke = {
          {
            name = "smoke", -- lighter, faster dissipating smoke
            frequency = 4,  -- much lower frequency
            position = { 0.7, -1.2 },
            starting_vertical_speed = 0.12,
            starting_frame_deviation = 60,
          }
        },
      },
      crafting_categories = { "baking" },
      crafting_speed = 4,
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
              animation_speed = 0.1,
            },
          },
        },
      },
      open_sound = sounds.machine_open,
      close_sound = sounds.machine_close,
      effect_receiver = { base_effect = { productivity = 0.25 } },
      impact_category = "metal",
      working_sound =
      {
        sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.45, audible_distance_modifier = 0.5 },
        fade_in_ticks = 4,
        fade_out_ticks = 20
      }
    },
    {
      type = "assembling-machine",
      name = "environment-research-center",
      icon = "__virentis__/graphics/icons/machines/environment-research-center.png",
      subgroup = "virentis-machines",
      order = "a",
      flags = { "placeable-neutral", "placeable-player", "player-creation" },
      circuit_wire_max_distance = base_assembling_machine.circuit_wire_max_distance,
      circuit_connector = base_assembling_machine.circuit_connector,
      energy_usage = "15MW",
      energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
      },
      crafting_categories = { "virentis-research" },
      crafting_speed = 5,
      module_slots = 4,
      minable = {
        mining_time = 1,
        result = "environment-research-center",
      },
      collision_box = { { -2.2, -2.2 }, { 2.2, 2.2 } },
      selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
      damaged_trigger_effect = hit_effects.entity(),
      max_health = 2000,
      dying_explosion = "steel-furnace-explosion",
      graphics_set = {
        animation = {
          layers = {
            {
              filename =
              "__virentis__/graphics/entities/machines/environment-research-center/environment-research-center.png",
              priority = "very-low",
              width = 380,
              height = 280,
              shift = util.by_pixel(0, 0),
              scale = 0.5,
            },
            {
              filename =
              "__virentis__/graphics/entities/machines/environment-research-center/environment-research-center-shadow.png",
              priority = "very-low",
              width = 380,
              height = 280,
              draw_as_shadow = true,
              shift = util.by_pixel(0, 0),
              scale = 0.5,
            },
          },
        },
        working_visualisations = {
          {
            fadeout = true,
            apply_recipe_tint = "primary",
            animation = {
              filename =
              "__virentis__/graphics/entities/machines/environment-research-center/environment-research-center-glow.png",
              priority = "very-low",
              width = 380,
              height = 280,
              frame_count = 16,
              line_length = 4,
              draw_as_glow = true,
              blend_mode = "additive",
              shift = util.by_pixel(0, 0),
              scale = 0.5,
              animation_speed = 0.1,
            },
          },
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
      type = "assembling-machine",
      name = "advance-food-processor",
      icon = "__virentis__/graphics/icons/machines/advance-food-processor.png",
      subgroup = "virentis-machines",
      order = "a",
      flags = { "placeable-neutral", "placeable-player", "player-creation" },
      circuit_wire_max_distance = base_assembling_machine.circuit_wire_max_distance,
      circuit_connector = base_assembling_machine.circuit_connector,
      energy_usage = "3MW",
      energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
      },
      crafting_categories = { "advance-food-processing" },
      crafting_speed = 2,
      module_slots = 3,
      minable = {
        mining_time = 1,
        result = "advance-food-processor",
      },
      collision_box = { { -1.3, -1.3 }, { 1.3, 1.3 } },
      selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
      damaged_trigger_effect = hit_effects.entity(),
      max_health = 500,
      dying_explosion = "steel-furnace-explosion",
      graphics_set = {
        animation = {
          layers = {
            {
              filename = "__virentis__/graphics/entities/machines/advance-food-processor/advance-food-processor.png",
              priority = "very-low",
              width = 380,
              height = 280,
              shift = util.by_pixel(0, 0),
              scale = 0.5,
            },
            {
              filename =
              "__virentis__/graphics/entities/machines/advance-food-processor/advance-food-processor-shadow.png",
              priority = "very-low",
              width = 380,
              height = 280,
              draw_as_shadow = true,
              shift = util.by_pixel(0, 0),
              scale = 0.5,
            },
          },
        },
        working_visualisations = {
          {
            fadeout = true,
            apply_recipe_tint = "primary",
            animation = {
              filename = "__virentis__/graphics/entities/machines/advance-food-processor/advance-food-processor-glow.png",
              priority = "very-low",
              width = 380,
              height = 280,
              frame_count = 16,
              line_length = 4,
              draw_as_glow = true,
              blend_mode = "additive",
              shift = util.by_pixel(0, 0),
              scale = 0.5,
              animation_speed = 0.1,
            },
          },
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
        heat_picture = apply_heatpipe_glow_layer({
            {
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-heat-glow.png",
              width = 270,
              height = 210,
              frame_count = 32,
              line_length = 4,
              draw_as_glow = true,
              blend_mode = "additive",
              fadeout = true,
              shift = util.by_pixel(18, -5),
              scale = 0.5,
            },
          },
          "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-heatpipe-glow-horizontal.png",
          "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-heatpipe-glow-vertical.png"
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
        animation = apply_heatpipe_layer({
          {
            filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer.png",
            priority = "very-low",
            width = 270,
            height = 210,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(18, -5),
            scale = 0.5,
          },
          {
            filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-shadow.png",
            priority = "very-low",
            width = 270,
            height = 210,
            draw_as_shadow = true,
            shift = util.by_pixel(18, -5),
            scale = 0.5,
          },
        }),
        working_visualisations = {
          {
            filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-animation.png",
            priority = "very-low",
            width = 270,
            height = 210,
            frame_count = 32,
            line_length = 4,
            shift = util.by_pixel(18, -5),
            scale = 0.5,
            animation_speed = 0.2,
          },
          {
            fadeout = true,
            apply_recipe_tint = "primary",
            animation = {
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-glow.png",
              priority = "very-low",
              width = 270,
              height = 210,
              frame_count = 32,
              line_length = 4,
              draw_as_glow = true,
              apply_recipe_tint = "primary",
              blend_mode = "additive",
              apply_special_effect = true,
              shift = util.by_pixel(18, -5),
              scale = 0.5,
              animation_speed = 0.2,
            },
          },
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
  })
