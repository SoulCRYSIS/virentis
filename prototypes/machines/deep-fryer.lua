local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local virentis = require("prototypes.utils")

data:extend({
  virentis.default_machine_item_prototype("deep-fryer"),
  {
    type = "recipe",
    name = "deep-fryer",
    category = "crafting",
    order = "a",
    icon = "__virentis__/graphics/icons/machines/deep-fryer.png",
    ingredients = {
      { type = "item", name = "steel-plate", amount = 8 },
      { type = "item", name = "pipe",        amount = 4 },
      { type = "item", name = "heat-pipe",   amount = 2 },
      { type = "item", name = "resin",       amount = 2 },
      { type = "item", name = "firebrick",   amount = 4 }
    },
    results = {
      { type = "item", name = "deep-fryer", amount = 1 }
    },
    energy_required = 4,
    enabled = false,
    surface_conditions = virentis.surface_condition,
  },
  {
    type = "assembling-machine",
    name = "deep-fryer",
    icon = "__virentis__/graphics/icons/machines/deep-fryer.png",
    subgroup = "virentis-machines",
    order = "a",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    circuit_wire_max_distance = 8,
    circuit_connector = virentis.default_machine_circuit_connector,
    energy_usage = "2.5MW",
    ---@type data.HeatEnergySource
    energy_source = {
      type = "heat",
      max_temperature = 400,
      max_transfer = "1GW",
      min_working_temperature = 240,
      specific_heat = "1MJ",
      connections = virentis.two_line_connections,
      heat_picture = virentis.sprite_2way_to_4way(
        {
          layers = {
            {
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-heated-horizontal.png",
              width = 320,
              height = 320,
              draw_as_glow = true,
              blend_mode = "additive",
              fadeout = true,
              scale = 0.5,
            },
            apply_heat_pipe_glow({
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-heated-pipe-horizontal.png",
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
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-heated-vertical.png",
              width = 320,
              height = 320,
              draw_as_glow = true,
              blend_mode = "additive",
              fadeout = true,
              scale = 0.5,
            },
            apply_heat_pipe_glow({
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-heated-pipe-vertical.png",
              width = 192,
              height = 192,
              fadeout = true,
              scale = 0.5,
            })
          },
        }
      ),
      pipe_covers = virentis.default_pipe_covers,
      heat_pipe_covers = virentis.default_heat_pipe_covers,
    },
    fluid_boxes = virentis.pass_middle_fluid_box,
    fluid_boxes_off_when_no_fluid_recipe = false,
    crafting_categories = { "frying" },
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
      animation = virentis.animation_2way_to_4way(
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
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-shadow-horizontal.png",
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
              filename = "__virentis__/graphics/entities/machines/deep-fryer/deep-fryer-shadow-vertical.png",
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
            draw_as_glow = true,
            blend_mode = "additive",
            scale = 0.5,
          }
        }
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound = virentis.default_working_sound,
  },

})
