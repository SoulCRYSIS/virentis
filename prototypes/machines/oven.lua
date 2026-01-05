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
    subgroup = "virentis-machines",
    order = "ab",
    icon = "__virentis__/graphics/icons/machines/oven.png",
    ingredients = {
      { type = "item", name = "steel-plate", amount = 8 },
      { type = "item", name = "firebrick",   amount = 16 },
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
    order = "ab",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    circuit_wire_max_distance = 8,
    circuit_connector = virentis.default_machine_circuit_connector,
    energy_usage = "10MW",
    ---@type data.HeatEnergySource
    energy_source = {
      type = "heat",
      max_temperature = 400,
      max_transfer = "1GW",
      min_working_temperature = 240,
      specific_heat = "10MJ",
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
    crafting_categories = { "baking", "basic-cooking" },
    crafting_speed = 2,
    module_slots = 2,
    allowed_effects = { "consumption", "speed", "productivity", "pollution" },
    minable = {
      mining_time = 1,
      result = "oven",
    },
    collision_box = { { -1.3, -1.3 }, { 1.3, 1.3 } },
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    damaged_trigger_effect = virentis.default_damaged_trigger_effect,
    max_health = 500,
    dying_explosion = "steel-furnace-explosion",
    resistances = {
      {
        type = "fire",
        percent = 100,
      },
      {
        type = "explosion",
        percent = 50
      },
      {
        type = "impact",
        percent = 50
      }
    },
    corpse = "steel-furnace-remnants",
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
          effect = "flicker",
          light =  { shift = { 0, 0 }, color = { 1, 0.7, 0.5 }, intensity = 0.7, size = 7 },
        },
        {
          fadeout = true,
          apply_recipe_tint = "primary",
          effect = "flicker",
          animation = {
            filename = "__virentis__/graphics/entities/machines/oven/oven-working-glow.png",
            width = width,
            height = height,
            draw_as_glow = true,
            blend_mode = "additive",
            scale = 0.5,
            repeat_count = 48,
          },
        },
        {
          fadeout = true,
          constant_speed = true,
          render_layer = "wires",
          apply_recipe_tint = "primary",
          animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
            frame_count = 47,
            line_length = 16,
            width = 90,
            height = 188,
            animation_speed = 0.5,
            shift = { -0.05, -3.45 },
            tint = { 0.7, 0.7, 0.7, 0.5 },
            scale = 0.5
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
