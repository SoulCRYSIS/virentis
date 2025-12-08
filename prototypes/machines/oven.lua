local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local virentis = require("prototypes.utils")

local width = 448
local height = 448

data:extend({
  virentis.default_machine_item_prototype("oven"),
  {
    type = "recipe",
    name = "oven",
    category = "crafting",
    order = "a",
    icon = "__virentis__/graphics/icons/items/machines/oven.png",
    ingredients = {
      { type = "item", name = "steel-plate", amount = 8 },
      { type = "item", name = "firebrick",   amount = 8 },
      { type = "item", name = "heat-pipe",   amount = 2 }
    },
    results = {
      { type = "item", name = "oven", amount = 1 }
    },
    energy_required = 4,
    enabled = false,
    surface_conditions = virentis.surface_condition,
  },
  {
    type = "assembling-machine",
    name = "oven",
    icon = "__virentis__/graphics/icons/machines/oven.png",
    subgroup = "virentis-machines",
    order = "a",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    circuit_wire_max_distance = 8,
    circuit_connector = virentis.default_circuit_connector,
    energy_usage = "5MW",
    ---@type data.HeatEnergySource
    energy_source = {
      type = "heat",
      max_temperature = 400,
      max_transfer = "1GW",
      min_working_temperature = 240,
      specific_heat = "1MJ",
      connections = virentis.two_line_connections,
      heat_picture = virentis.sprite_2way_to_4way(
        apply_heat_pipe_glow({
          filename = "__virentis__/graphics/entities/machines/oven/oven-heated-pipe-horizontal.png",
          width = 192,
          height = 192,
          fadeout = true,
          scale = 0.5,
        }),
        apply_heat_pipe_glow({
          filename = "__virentis__/graphics/entities/machines/oven/oven-heated-pipe-vertical.png",
          width = 192,
          height = 192,
          fadeout = true,
          scale = 0.5,
        })
      ),
      pipe_covers = virentis.default_pipe_covers,
      heat_pipe_covers = virentis.default_heat_pipe_covers,
    },
    crafting_categories = { "baking" },
    crafting_speed = 1,
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
              filename = "__virentis__/graphics/entities/machines/oven/oven.png",
              priority = "very-low",
              width = width,
              height = height,
              scale = 0.5,
            },
            {
              filename = "__virentis__/graphics/entities/machines/oven/oven-shadow.png",
              priority = "very-low",
              width = width,
              height = height,
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
              filename = "__virentis__/graphics/entities/machines/oven/oven.png",
              priority = "very-low",
              width = width,
              height = height,
              scale = 0.5,
            },
            {
              filename = "__virentis__/graphics/entities/machines/oven/oven-shadow.png",
              priority = "very-low",
              width = width,
              height = height,
              draw_as_shadow = true,
              scale = 0.5,
            },
          }
        }
      ),
      working_visualisations = {
        {
          fadeout = true,
          apply_recipe_tint = "primary",
          effect = "flicker",
          animation = {
            filename = "__virentis__/graphics/entities/machines/oven/oven-working-glow.png",
            priority = "very-low",
            width = width,
            height = height,
            draw_as_glow = true,
            blend_mode = "additive",
            scale = 0.5,
          },
        },
        {
          fadeout = true,
          animation = {
            filename = "__virentis__/graphics/entities/machines/oven/oven-working-glow-2.png",
            priority = "very-low",
            width = width,
            height = height,
            draw_as_glow = true,
            blend_mode = "additive",
            scale = 0.5,
          },
        }
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound = virentis.default_working_sound,
  },
})
