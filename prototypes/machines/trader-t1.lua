local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local virentis = require("prototypes.utils")

local width = 512
local height = 512

data:extend({
  ---@type data.AssemblingMachinePrototype
  {
    type = "assembling-machine",
    name = "trader-t1",
    icon = "__virentis__/graphics/icons/machines/trader-t1.png",
    subgroup = "virentis-machines",
    order = "a",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    circuit_wire_max_distance = 8,
    circuit_connector = virentis.default_machine_circuit_connector,
    energy_usage = "10kW",
    energy_source = {
      type = "void"
    },
    crafting_categories = { "trading-t1" },
    crafting_speed = 1,
    module_slots = 0,
    -- minable = {
    --   mining_time = 1,
    --   result = "trader-t1",
    -- },
    collision_box = { { -1.8, -1.8 }, { 1.8, 1.8 } },
    selection_box = { { -2, -2 }, { 2, 2 } },
    damaged_trigger_effect = hit_effects.entity(),
    max_health = 5000,
    corpse = "medium-remnants",
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__virentis__/graphics/entities/machines/trader-t1/trader-t1.png",
            priority = "very-low",
            width = width,
            height = height,
            scale = 0.5,
          },
          {
            filename = "__virentis__/graphics/entities/machines/trader-t1/trader-t1-shadow.png",
            priority = "very-low",
            width = width,
            height = height,
            draw_as_shadow = true,
            scale = 0.5,
          },
        }
      },
      working_visualisations = {
        {
          fadeout = true,
          apply_recipe_tint = "primary",
          effect = "flicker",
          animation = {
            filename = "__virentis__/graphics/entities/machines/trader-t1/trader-t1-working-glow.png",
            priority = "very-low",
            width = width,
            height = height,
            draw_as_glow = true,
            blend_mode = "additive",
            scale = 0.5,
          },
        },
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound = virentis.default_working_sound,
    autoplace = {
      order = "ab",
      force = "player",
      probability_expression = "2 * max(virentis_town_rural, 0.1 * virentis_town_edge) * grid_random_shift(12, 8, 993)",
    },
    map_color = { 230, 230, 255},
  },
})
