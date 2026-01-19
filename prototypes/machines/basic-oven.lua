local hit_effects = require "__base__.prototypes.entity.hit-effects"
local sounds = require "__base__.prototypes.entity.sounds"
local virentis = require("prototypes.utils")

local stone_furnace = table.deepcopy(data.raw["furnace"]["stone-furnace"])

data:extend {
  virentis.default_machine_item_prototype("basic-oven"),
  {
    type = "recipe",
    name = "basic-oven",
    category = "crafting",
    subgroup = "virentis-machines",
    order = "aa",
    icon = "__virentis-graphics__/icons/machines/basic-oven.png",
    ingredients = {
      { type = "item", name = "rockmalt-scale", amount = 2 },
      { type = "item", name = "stone-brick",    amount = 5 },
    },
    results = {
      { type = "item", name = "basic-oven", amount = 1 }
    },
    energy_required = 1,
    enabled = false,
    surface_conditions = virentis.surface_condition,
  },
  {
    type = "assembling-machine",
    name = "basic-oven",
    icon = "__virentis-graphics__/icons/machines/basic-oven.png",
    subgroup = "virentis-machines",
    order = "aa",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.2, result = "basic-oven" },
    max_health = 200,
    corpse = "stone-furnace-remnants",
    dying_explosion = "stone-furnace-explosion",
    repair_sound = sounds.manual_repair,
    mined_sound = sounds.deconstruct_bricks(0.8),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    effect_receiver = { uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true },
    impact_category = "stone",
    icon_draw_specification = { scale = 0.66, shift = { 0, -0.1 } },
    working_sound = stone_furnace.working_sound,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = { { -0.7, -0.7 }, { 0.7, 0.7 } },
    selection_box = { { -0.8, -1 }, { 0.8, 1 } },
    damaged_trigger_effect = hit_effects.rock(),
    crafting_categories = { "basic-cooking" },
    energy_usage = "1MW",
    crafting_speed = 1,
    energy_source =
    {
      type = "burner",
      fuel_categories = { "chemical" },
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = { spores = 3 },
      light_flicker =
      {
        color = { 0, 0, 0 },
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
      },
      smoke =
      {
        {
          name = "smoke",
          deviation = { 0.1, 0.1 },
          frequency = 5,
          position = { 0.0, -0.8 },
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        }
      }
    },
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__virentis-graphics__/entities/machines/basic-oven/basic-oven.png",
            priority = "extra-high",
            width = 151,
            height = 146,
            shift = util.by_pixel(-0.25, 6),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/stone-furnace/stone-furnace-shadow.png",
            priority = "extra-high",
            width = 164,
            height = 74,
            draw_as_shadow = true,
            shift = util.by_pixel(14.5, 13),
            scale = 0.5
          }
        }
      },
      working_visualisations =
      {
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            layers =
            {
              {
                filename = "__base__/graphics/entity/stone-furnace/stone-furnace-fire.png",
                priority = "extra-high",
                line_length = 8,
                width = 41,
                height = 100,
                frame_count = 48,
                draw_as_glow = true,
                shift = util.by_pixel(-0.75, 5.5),
                scale = 0.5
              },
              {
                filename = "__base__/graphics/entity/stone-furnace/stone-furnace-light.png",
                blend_mode = "additive",
                width = 106,
                height = 144,
                repeat_count = 48,
                draw_as_glow = true,
                shift = util.by_pixel(0, 5),
                scale = 0.5,
              },
            }
          }
        },
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__base__/graphics/entity/stone-furnace/stone-furnace-ground-light.png",
            blend_mode = "additive",
            width = 116,
            height = 110,
            repeat_count = 48,
            draw_as_light = true,
            shift = util.by_pixel(-1, 44),
            scale = 0.5,
          },
        },
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__base__/graphics/entity/stone-furnace/stone-furnace-reflection.png",
          priority = "extra-high",
          width = 16,
          height = 16,
          shift = util.by_pixel(0, 35),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  }
}
