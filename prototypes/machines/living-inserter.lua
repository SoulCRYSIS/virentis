local sounds = require("__base__/prototypes/entity/sounds")
local virentis = require("prototypes.utils")

data:extend({
  virentis.default_machine_item_prototype("living-inserter", 50),
  {
    type = "recipe",
    name = "living-inserter",
    category = "organic",
    subgroup = "virentis-machines",
    order = "ba",
    icon = "__virentis__/graphics/icons/machines/living-inserter.png",
    ingredients = {
      { type = "item",  name = "heart-of-nature", amount = 1 },
      { type = "item",  name = "sylva-core",      amount = 1 },
      { type = "item",  name = "virentis-resin",  amount = 4 },
      { type = "item",  name = "stack-inserter",  amount = 1 },
      { type = "fluid", name = "nutrients-pulp",  amount = 10 },
    },
    results = {
      { type = "item", name = "living-inserter", amount = 1 }
    },
    energy_required = 2,
    enabled = false,
    surface_conditions = virentis.surface_condition,
  },
  {
    type = "inserter",
    name = "living-inserter",
    subgroup = "virentis-machines",
    order = "ba",
    icon = "__virentis__/graphics/icons/machines/living-inserter.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    stack_size_bonus = 6,
    bulk = true,
    grab_less_to_match_belt_stack = true,
    wait_for_full_hand = true,
    enter_drop_mode_if_held_stack_spoiled = true,
    max_belt_stack_size = 4,
    minable = { mining_time = 0.1, result = "living-inserter" },
    max_health = 200,
    corpse = "stack-inserter-remnants",
    dying_explosion = "stack-inserter-explosion",
    collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } },
    selection_box = { { -0.4, -0.35 }, { 0.4, 0.45 } },
    damaged_trigger_effect = virentis.default_damaged_trigger_effect,
    starting_distance = 0.85,
    pickup_position = { 0, -1 },
    insert_position = { 0, 1.2 },
    energy_per_movement = "40kJ",
    energy_per_rotation = "40kJ",
    energy_source = { type = "void" },
    heating_energy = "20kW",
    extension_speed = 0.1,
    rotation_speed = 0.04,
    filter_count = 5,
    icon_draw_specification = { scale = 0.5 },
    fast_replaceable_group = "inserter",
    open_sound = sounds.inserter_open,
    close_sound = sounds.inserter_close,
    working_sound = sounds.inserter_fast,
    hand_base_picture = {
      filename = "__virentis__/graphics/entities/machines/living-inserter/living-inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 136,
      scale = 0.25
    },
    hand_closed_picture = {
      filename = "__virentis__/graphics/entities/machines/living-inserter/living-inserter-hand-closed.png",
      priority = "extra-high",
      width = 112,
      height = 164,
      scale = 0.25
    },
    hand_open_picture = {
      filename = "__virentis__/graphics/entities/machines/living-inserter/living-inserter-hand-open.png",
      priority = "extra-high",
      width = 134,
      height = 164,
      scale = 0.25
    },
    hand_base_shadow = {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 132,
      scale = 0.25
    },
    hand_closed_shadow = {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 112,
      height = 164,
      scale = 0.25
    },
    hand_open_shadow = {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 134,
      height = 164,
      scale = 0.25
    },
    platform_picture = {
      sheet =
      {
        filename = "__virentis__/graphics/entities/machines/living-inserter/living-inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5 - 1),
        scale = 0.5
      }
    },
    platform_frozen = {
      sheet =
      {
        filename = "__space-age__/graphics/entity/frozen/inserter/inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5 - 1),
        scale = 0.5
      }
    },
    hand_base_frozen = {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-arm-frozen.png",
      priority = "extra-high",
      x = 134 * 2,
      width = 134,
      height = 136,
      scale = 0.25
    },
    hand_closed_frozen = {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-arm-frozen.png",
      priority = "extra-high",
      x = 134,
      width = 134,
      height = 164,
      scale = 0.25
    },
    hand_open_frozen = {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-arm-frozen.png",
      priority = "extra-high",
      width = 134,
      height = 164,
      scale = 0.25
    },
    circuit_connector = virentis.default_inserter_circuit_connector,
    circuit_wire_max_distance = virentis.default_circuit_wire_distance,
    default_stack_control_input_signal = virentis.default_inserter_stack_control_input_signal
  },
})
