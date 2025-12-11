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
    order = "a",
    icon = "__virentis__/graphics/icons/machines/environment-research-center.png",
    ingredients = {
      { type = "item", name = "firebrick",       amount = 4 },
      { type = "item", name = "steel-plate",     amount = 8 },
      { type = "item", name = "heart-of-nature", amount = 1 },
      { type = "item", name = "processing-unit", amount = 2 },
      { type = "item", name = "graphene",        amount = 2 },
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
    order = "a",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    circuit_wire_max_distance = 8,
    circuit_connector = virentis.default_machine_circuit_connector,
    energy_usage = "20MW",
    ---@type data.BurnerEnergySource
    energy_source =
    {
      type = "burner",
      fuel_categories = { "nutrients" },
      effectivity = 1,
      burner_usage = "nutrients",
      fuel_inventory_size = 1,
      light_flicker = require("__space-age__.prototypes.entity.biochamber-pictures").light_flicker
    },
    crafting_categories = { "environment-research-data" },
    crafting_speed = 1,
    module_slots = 4,
    allowed_effects = { "consumption", "pollution", "speed", "productivity" },
    minable = {
      mining_time = 1,
      result = "environment-research-center",
    },
    collision_box = { { -2.3, -2.3 }, { 2.3, 2.3 } },
    selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
    damaged_trigger_effect = virentis.default_damaged_trigger_effect,
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
            width = 480,
            height = 480,
            draw_as_shadow = true,
            scale = 0.5,
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
            scale = 0.5,
            animation_speed = 0.2,
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
            animation_speed = 0.2,
            scale = 0.5,
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
