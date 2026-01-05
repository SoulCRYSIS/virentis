local sounds = require("__base__/prototypes/entity/sounds")
local virentis = require("prototypes.utils")

local width = 352
local height = 352

data:extend({
  virentis.default_machine_item_prototype("environment-research-center"),
  {
    type = "recipe",
    name = "environment-research-center",
    category = "crafting",
    subgroup = "virentis-machines",
    order = "ca",
    icon = "__virentis__/graphics/icons/machines/environment-research-center.png",
    ingredients = {
      { type = "item", name = "firebrick",       amount = 20 },
      { type = "item", name = "steel-plate",     amount = 20 },
      { type = "item", name = "heart-of-nature", amount = 5 },
      { type = "item", name = "processing-unit", amount = 10 },
      { type = "item", name = "graphene",        amount = 20 },
      { type = "item", name = "radar",           amount = 1 }
    },
    results = {
      { type = "item", name = "environment-research-center", amount = 1 }
    },
    energy_required = 1,
    enabled = false,
    surface_conditions = virentis.surface_condition,
  },
  {
    type = "assembling-machine",
    name = "environment-research-center",
    icon = "__virentis__/graphics/icons/machines/environment-research-center.png",
    subgroup = "virentis-machines",
    order = "ca",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    circuit_wire_max_distance = 8,
    circuit_connector = virentis.default_machine_circuit_connector,
    energy_usage = "10MW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
    },
    crafting_categories = { "environment-research-data" },
    crafting_speed = 4,
    module_slots = 4,
    allowed_effects = { "consumption", "pollution", "speed", "productivity" },
    allowed_module_categories = { "efficiency", "productivity", "speed", "quality" },
    minable = {
      mining_time = 2,
      result = "environment-research-center",
    },
    collision_box = { { -3.2, -3.2 }, { 3.2, 3.2 } },
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    damaged_trigger_effect = virentis.default_damaged_trigger_effect,
    max_health = 1000,
    dying_explosion = "steel-furnace-explosion",
    corpse = "big-remnants",
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__virentis__/graphics/entities/machines/research-center/research-center.png",
            priority = "very-low",
            width = width,
            height = height,
            scale = 0.7,
          },
          {
            filename = "__virentis__/graphics/entities/machines/research-center/research-center-shadow.png",
            priority = "very-low",
            width = 480,
            height = 480,
            draw_as_shadow = true,
            scale = 0.7,
          },
        },
      },
      working_visualisations = {
        {
          animation = {
            filename = "__virentis__/graphics/entities/machines/research-center/research-center.png",
            priority = "very-low",
            width = width,
            height = height,
            frame_count = 64,
            line_length = 8,
            scale = 0.7,
            animation_speed = 0.1,
          },
        },
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
            animation_speed = 0.1,
            scale = 0.7,
          },
        },
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound = virentis.default_working_sound,
  },
})
