local virentis = require("prototypes.utils")

local width = 224
local height = 224

data:extend({
  virentis.default_machine_item_prototype("eternal-lantern", 50),
  {
    type = "recipe",
    name = "eternal-lantern",
    category = "organic",
    subgroup = "virentis-decors",
    order = "aa",
    icon = "__virentis-graphics__/icons/machines/eternal-lantern.png",
    ingredients = {
      { type = "item",  name = "siltcore",            amount = 1 },
      { type = "item",  name = "sylva-core",          amount = 1 },
      { type = "item",  name = "firebrick",           amount = 4 },
      { type = "item",  name = "living-wood",         amount = 8 },
      { type = "item",  name = "efficiency-module-3", amount = 1 },
      { type = "fluid", name = "nutrients-pulp",      amount = 20 },
    },
    results = {
      { type = "item", name = "eternal-lantern", amount = 1 }
    },
    energy_required = 1,
    enabled = false,
    surface_conditions = virentis.surface_condition,
  },
  ---@type data.BeaconPrototype
  {
    type = "beacon",
    name = "eternal-lantern",
    icon = "__virentis-graphics__/icons/machines/eternal-lantern.png",
    subgroup = "virentis-decors",
    order = "aa",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.1, result = "eternal-lantern" },
    factoriopedia_alternative = "eternal-lantern",
    placeable_by = { item = "eternal-lantern", count = 1 },
    max_health = 200,
    healing_per_tick = 1,
    corpse = "lamp-remnants",
    dying_explosion = "beacon-explosion",
    collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box = { { -0.5, -1.0 }, { 0.5, 0.5 } },
    damaged_trigger_effect = virentis.default_damaged_trigger_effect,
    drawing_box_vertical_extension = 0.5,
    allowed_effects = { "consumption", "pollution" },
    distribution_effectivity_bonus_per_quality_level = 0.3,
    stateless_visualisation = {
      {
        light = { shift = { 0, 0 }, color = { 0.8, 0.7, 0.5 }, intensity = 0.9, size = 28, minimum_darkness = 0.3 },
        animation = {
          sheet = {
            filename = "__virentis-graphics__/entities/machines/eternal-lantern/eternal-lantern.png",
            variation_count = 4,
            line_length = 4,
            width = width,
            height = height,
            scale = 0.5,
          },
        }
      },
      {
        animation = {
          sheet = {
            filename = "__virentis-graphics__/entities/machines/eternal-lantern/eternal-lantern-shadow.png",
            variation_count = 4,
            line_length = 4,
            width = width,
            height = height,
            scale = 0.5,
            draw_as_shadow = true,
          }
        }
      },
      {
        animation = {
          sheet = {
            effect = "flicker",
            filename = "__virentis-graphics__/entities/machines/eternal-lantern/eternal-lantern-glow.png",
            variation_count = 4,
            line_length = 4,
            width = width,
            height = height,
            scale = 0.5,
            draw_as_glow = true,
            blend_mode = "additive",
          }
        }
      }
    },
    graphics_set = {
      module_icons_suppressed = true,
    },
    radius_visualisation_picture = virentis.decor_radius_visualisation_picture,
    supply_area_distance = 12,
    energy_source = { type = "void" },
    impact_category = "glass",
    energy_usage = "10kW",
    distribution_effectivity = 1,
    distribution_effectivity_bonus_per_quality_level = 0.2,
    profile = { 1.0, 0.5, 0.33333, 0.25, 0.2, 0.16667, 0.14286, 0.125, 0.11111, 0.1, 0.09091, 0.08333, 0.07692, 0.07143, 0.06667, 0.0625, 0.05882, 0.05556, 0.05263, 0.05, 0.04762, 0.04545, 0.04348, 0.04167, 0.04, 0.03846, 0.03704, 0.03571, 0.03448, 0.03333, 0.03226, 0.03125, 0.0303, 0.02941, 0.02857, 0.02778, 0.02703, 0.02632, 0.02564, 0.025, 0.02439, 0.02381, 0.02326, 0.02273, 0.02222, 0.02174, 0.02128, 0.02083, 0.02041, 0.02 },
    beacon_counter = "same_type",
    module_slots = 1,
    autoplace = {
      order = "ad",
      force = "player",
      probability_expression = "max(virentis_town_edge, 0.4 * virentis_town_rural) * grid_random_shift(12, 10, 992)",
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__virentis-graphics__/entities/machines/eternal-lantern/eternal-lantern-water-reflection.png",
        priority = "extra-high",
        width = width,
        height = height,
        scale = 0.5
      },
      rotate = false,
      orientation_to_variation = false
    },
    map_color = { 240, 240, 240 },
  },
  {
    type = "module",
    name = "eternal-lantern-module",
    icon = "__virentis-graphics__/mocks/empty-icon.png",
    subgroup = "module",
    category = "efficiency",
    tier = 1,
    order = "z",
    stack_size = 50,
    effect = { consumption = -0.5 },
    auto_recycle = false,
    hidden = true,
  },
})
