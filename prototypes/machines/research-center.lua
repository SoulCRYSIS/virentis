local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local virentis = require("prototypes.utils")

local width = 480
local height = 480

data:extend({
  virentis.default_machine_item_prototype("virentis-research-center"),
  {
    type = "recipe",
    name = "virentis-research-center",
    category = "crafting",
    order = "a",
    icon = "__virentis__/graphics/icons/items/machines/research-center.png",
    ingredients = {
      { type = "item", name = "firebrick",             amount = 4 },
      { type = "item", name = "steel-plate",           amount = 8 },
      { type = "item", name = "heart-of-nature",       amount = 1 },
      { type = "item", name = "processing-unit",       amount = 2 },
      { type = "item", name = "low-density-structure", amount = 2 },
      { type = "item", name = "radar",                 amount = 1 }
    },
    results = {
      { type = "item", name = "virentis-research-center", amount = 1 }
    },
    energy_required = 1,
    enabled = false,
    surface_conditions = virentis.surface_condition,
  },
  {
    type = "assembling-machine",
    name = "virentis-research-center",
    icon = "__virentis__/graphics/icons/machines/virentis-research-center.png",
    subgroup = "virentis-machines",
    order = "a",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    circuit_wire_max_distance = 8,
    circuit_connector = virentis.default_circuit_connector,
    energy_usage = "80MW",
    ---@type data.ElectricEnergySource
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    },
    crafting_categories = { "virentis-research" },
    crafting_speed = 1,
    module_slots = 0,
    minable = {
      mining_time = 1,
      result = "virentis-research-center",
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
            filename = "__virentis__/graphics/entities/machines/research-center/research-center.png",
            priority = "very-low",
            width = width,
            height = height,
            scale = 0.5,
          },
          {
            filename = "__virentis__/graphics/entities/machines/research-center/research-center-shadow.png",
            priority = "very-low",
            width = width,
            height = height,
            draw_as_shadow = true,
            scale = 0.5,
          },
        },
      },
      working_visualisations = {
        {
          fadeout = true,
          apply_recipe_tint = "primary",
          effect = "flicker",
          animation = {
            filename = "__virentis__/graphics/entities/machines/research-center/research-center-glow.png",
            priority = "very-low",
            width = width,
            height = height,
            frame_count = 64,
            line_length = 8,
            draw_as_glow = true,
            blend_mode = "additive",
            scale = 0.5,
          },
        },
        {
          animation = {
            filename = "__virentis__/graphics/entities/machines/research-center/research-center.png",
            priority = "very-low",
            width = width,
            height = height,
            frame_count = 64,
            line_length = 8,
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
