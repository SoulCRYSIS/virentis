local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local sounds = space_age_sounds.stomper_pentapod.big

local vehicle_leg = table.deepcopy(data.raw["spider-leg"]["spidertron-leg-1"])
vehicle_leg.name = "invisible-leg"
vehicle_leg.graphics_set = {}
vehicle_leg.collision_mask = {
  layers = {
    ["rail"] = true,
  },
  colliding_with_tiles_only = true,
}
vehicle_leg.target_position_randomisation_distance = 0
vehicle_leg.working_sound = nil
vehicle_leg.minimal_step_size = 0
vehicle_leg.movement_based_position_selection_distance = 1.5 -- I have no idea what this does.
vehicle_leg.initial_movement_speed = 1
vehicle_leg.movement_acceleration = 0
vehicle_leg.walking_sound_volume_modifier = 0
vehicle_leg.selectable_in_game = false

local scale = 1
local shadow_width = 576
local shadow_height = 576
local width = 448
local height = 448

data:extend({
  vehicle_leg,
  ---@type data.SpiderUnitPrototype
  {
    type = "spider-unit",
    name = "pirate-flying-skirmisher",
    icon = "__virentis-graphics__/icons/creatures/kraken.png",
    subgroup = "virentis-enemies",
    order = "c",
    collision_box = { { -1.5 * scale, -1.5 * scale }, { 1.5 * scale, 1.5 * scale } },
    sticker_box = { { -1.5 * scale, -1.5 * scale }, { 1.5 * scale, 1.5 * scale } },
    selection_box = { { -1.5 * scale, -1.5 * scale }, { 1.5 * scale, 1.5 * scale } },
    drawing_box_vertical_extension = 0.5,
    torso_bob_speed = 0.1,
    flags = { "placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable" },
    max_health = 50000,
    -- resistances = resistances,
    healing_per_tick = 5,
    distraction_cooldown = 300,
    min_pursue_time = 300,
    max_pursue_distance = 80,
    attack_parameters = {
      type = "beam",
      cooldown = 240,
      range = 5,
      range_mode = "center-to-center",
      ammo_category = "tesla",
      ammo_type = {
        target_type = "position",
        action = {
          type = "direct",
          force = "enemy",
          action_delivery = {
            type = "delayed",
            delayed_trigger = "kraken-attack-lightning-area",
          }
        }
      }
    },
    vision_distance = 50,
    ai_settings =
    {
      join_attacks = true,
      allow_try_return_to_spawner = false,
      strafe_settings =
      {
        max_distance = 10,
        ideal_distance = 5,
        ideal_distance_tolerance = 1,
        ideal_distance_variance = 1,
        ideal_distance_importance = 0.5,
        ideal_distance_importance_variance = 0.1,
        face_target = false
      },
    },
    dying_explosion = "big-stomper-pentapod-die",
    dying_sound = sounds.dying_sound,
    damaged_trigger_effect = gleba_hit_effects(),
    is_military_target = true,
    working_sound = sounds.working_sound,
    warcry = sounds.warcry,
    height = 0.5,
    torso_rotation_speed = 0.02,
    graphics_set = {
      render_layer = "elevated-higher-object",
      shadow_animation = {
        filename =
        "__virentis-graphics__/entities/creatures/pirate-flying-skirmisher/pirate-flying-skirmisher-shadow.png",
        width = shadow_width,
        height = shadow_height,
        direction_count = 32,
        line_length = 8,
        lines_per_file = 4,
        scale = 0.5 * scale,
        usage = "enemy",
      },
      animation = {
        layers = {
          {
            filenames = {
              "__virentis-graphics__/entities/creatures/pirate-flying-skirmisher/pirate-flying-skirmisher-1.png",
              "__virentis-graphics__/entities/creatures/pirate-flying-skirmisher/pirate-flying-skirmisher-2.png",
            },
            width = width,
            height = height,
            direction_count = 32,
            line_length = 16,
            lines_per_file = 16,
            frame_count = 16,
            animation_speed = 0.2,
            run_mode = "forward-then-backward",
            scale = 0.5 * scale,
            usage = "enemy",
          },
          {
            filenames = {
              "__virentis-graphics__/entities/creatures/pirate-flying-skirmisher/pirate-flying-skirmisher-glow-1.png",
              "__virentis-graphics__/entities/creatures/pirate-flying-skirmisher/pirate-flying-skirmisher-glow-2.png",
            },
            width = width,
            height = height,
            direction_count = 32,
            line_length = 16,
            lines_per_file = 16,
            frame_count = 16,
            animation_speed = 0.2,
            run_mode = "forward-then-backward",
            scale = 0.5 * scale,
            draw_as_glow = true,
            blend_mode = "additive",
            usage = "enemy",
          },
        }
      },
      water_reflection = {
        rotate = true,
        pictures = {
          filename =
          "__virentis-graphics__/entities/creatures/pirate-flying-skirmisher/pirate-flying-skirmisher-water-reflection.png",
          width = shadow_width + 40,
          height = shadow_height + 40,
          variation_count = 16,
          line_length = 4,
          lines_per_file = 4,
          scale = 0.5 * scale,
          usage = "enemy",
        },
      }
    },
    spider_engine =
    {
      walking_group_overlap = 1,
      legs = { leg = "invisible-leg", mount_position = { 0, 0.5 }, ground_position = { 0, 0 }, blocking_legs = {}, walking_group = 1 },
    }
  },
})
