local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local base_assembling_machine = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])

data:extend({
  ---@type data.AssemblingMachinePrototype
  {
    type = "assembling-machine",
    name = "windmill",
    icon = "__virentis__/graphic/icon/machine/windmill.png",
    icon_size = 256,
    subgroup = "virentis-machines",
    order = "a",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    circuit_wire_max_distance = base_assembling_machine.circuit_wire_max_distance,
    circuit_connector = base_assembling_machine.circuit_connector,
    energy_usage = "10kW",
    energy_source = { type = "void" },
    crafting_categories = { "grinding" },
    crafting_speed = 1,
    module_slots = 0,
    minable = {
      mining_time = 0.5,
      result = "windmill",
    },
    collision_box = { { -1.8, -1.8 }, { 1.8, 1.8 } },
    selection_box = { { -2, -2 }, { 2, 2 } },
    damaged_trigger_effect = hit_effects.entity(),
    max_health = 300,
    dying_explosion = "steel-furnace-explosion",
    graphics_set = {
      animation = {
        priority = "very-low",
        layers = {
          {
            filename = "__virentis__/graphic/machine/windmill/windmill.png",
            priority = "very-low",
            width = 512,
            height = 512,
            frame_count = 64,
            line_length = 8,
            shift = util.by_pixel(0, -44),
            scale = 0.48,
            animation_speed = 0.6,
          },
          {
            filename = "__virentis__/graphic/machine/windmill/windmill-shadow.png",
            priority = "very-low",
            width = 640,
            height = 256,
            frame_count = 16,
            line_length = 8,
            repeat_count = 4,
            draw_as_shadow = true,
            shift = util.by_pixel(97, 15),
            scale = 0.52,
            animation_speed = 0.6,
          }
        }
      }
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    effect_receiver = { uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true },
    impact_category = "metal",
    working_sound =
    {
      sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.45, audible_distance_modifier = 0.5 },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },
})
