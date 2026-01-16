local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local sounds = space_age_sounds.stomper_pentapod.big

local scale = 2
local speed = 0.5
local leg_orientations = { 0.90, 0.70, 0.50, 0.30, 0.10 }
local leg_ground_position = { 0, -4.5 * scale } -- foot natural position
local leg_mount_position = { 0, -2 * scale }    -- hip
local hip_flexibility = 0.1
local knee_distance_factor = 0.3
local knee_height = 0  -- tiles, in screen space, above the straight line between the leg's mount point and leg position
local ankle_height = 0 -- tiles, in screen space, above the ground, the point at which the leg connects to the foot
local stomp_damage = 300
local stomp_area_radius = 3 * scale

local head_width = 448
local head_height = 448
local tentacle_width = 512
local tentacle_height = 512

local resistances = {
  {
    type = "physical",
    decrease = 30,
    percent = 70,
  },
  {
    type = "laser",
    percent = 95,
  },
  {
    type = "electric",
    percent = 95,
  },
  {
    type = "poison",
    percent = 100,
  },
  {
    type = "explosion",
    percent = 50,
  },
}

local walking_group = { 1, 3, 5, 2, 4 }
local legs = {}
for i = 1, 5 do
  table.insert(
    legs,
    {
      leg = "kraken-tentacle",
      mount_position = util.rotate_position(leg_mount_position, leg_orientations[i]),
      ground_position = util.rotate_position(leg_ground_position, leg_orientations[i]),
      walking_group = walking_group[i],
      leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
      leg_hit_the_ground_when_attacking_trigger = {
        { type = "invoke-tile-trigger" },
        {
          type = "create-entity",
          entity_name = "lightning",
          offset_deviation = { { -10.0, -10.0 }, { 10.0, 10.0 } },
        },
        {
          type = "create-trivial-smoke",
          smoke_name = "stomper-stomp",
          repeat_count = 1,
          offsets = { { 0, 0.5 } },
          offset_deviation = { { -0.0, -0.0 }, { 0.0, 0.0 } },
          speed = { 0, 0 },
          initial_height = 0.0,
          speed_from_center = 0.000,
          speed_from_center_deviation = 0.000,
        },
        {
          type = "play-sound",
          sound = sounds.stomp,
        },
        {
          type = "nested-result",
          action =
          {
            type = "area",
            radius = stomp_area_radius,
            force = "enemy",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "damage",
                  damage = { amount = stomp_damage, type = "impact" }
                },
              }
            }
          }
        }
      },
    }
  )
end

local fishing_utils = require("__fishing-dock__.prototypes.utils")
fishing_utils.create_fishing_content({
  fish_name = "kraken",
  icon = "__virentis__/graphics/icons/creatures/kraken.png",
  energy = 30,
  order = "ab",
  subgroup = "virentis-fishing",
  ingredients = {
    { type = "item", name = "pentapod-egg", amount = 1 }
  },
})

local kraken_lightning = table.deepcopy(data.raw.lightning["lightning"])
kraken_lightning.name = "kraken-lightning"
kraken_lightning.damage = 100

data:extend({
  kraken_lightning,
  ---@type data.SimpleEntityPrototype
  {
    type = "simple-entity",
    name = "kraken-tentacle-remain",
    icon = "__virentis__/graphics/icons/creatures/kraken.png",
    subgroup = "virentis-creatures",
    order = "c",
    collision_box = { { -0.25, -0.25 }, { 0.25, 0.25 } },
    selection_box = { { -0.25, -0.25 }, { 0.25, 0.5 } },
    collision_mask = { layers = { object = true, ground_tile = true } }, -- object not player so can step in water
    flags = { "not-repairable", "placeable-off-grid", "not-on-map", "placeable-neutral" },
    pictures = {
      {
        filename = "__virentis__/graphics/entities/creatures/kraken/tentacle.png",
        width = tentacle_width,
        height = tentacle_height,
        scale = 0.5 * scale,
      }
    }
  },
  ---@type data.SpiderLegPrototype
  {
    type = "spider-leg",
    name = "kraken-tentacle",
    hidden = true,
    localised_name = { "entity-name.leg" },
    collision_box = { { -0.2 * scale, -0.2 * scale }, { 0.2 * scale, 0.2 * scale } },
    selection_box = { { -0.5 * scale, -0.5 * scale }, { 0.5 * scale, 0.5 * scale } },
    collision_mask = { layers = { object = true, ground_tile = true } }, -- object not player so can step in water
    -- legs breathe air so that poison works. alternatively, change torsos to collide with poison clouds.
    flags = { "not-repairable" },
    icon = "__virentis__/graphics/icons/creatures/kraken.png",
    walking_sound_volume_modifier = sounds.walking_sound_volume_modifier,
    walking_sound_speed_modifier = sounds.walking_sound_speed_modifier,
    target_position_randomisation_distance = 0.05 * scale,
    minimal_step_size = 0.1 * scale,
    stretch_force_scalar = 1,
    initial_movement_speed = 0.06 * speed,
    movement_acceleration = 0.03 * speed,
    max_health = 100,
    base_position_selection_distance = 1.5 * scale,
    movement_based_position_selection_distance = 1 * scale,
    selectable_in_game = false,
    resistances = resistances,
    hip_flexibility = hip_flexibility,
    knee_height = knee_height,                   -- distance from torso, as multiplier of leg length
    knee_distance_factor = knee_distance_factor, -- tiles, in screen space, above the ground that the knee naturally rests at
    ankle_height = ankle_height,                 -- tiles, in screen space, above the ground, the point at which the leg connects to the foot
    graphics_set = {
      foot = {
        layers = {
          {
            filename = "__virentis__/graphics/entities/creatures/kraken/tentacle.png",
            width = tentacle_width,
            height = tentacle_height,
            direction_count = 64,
            line_length = 8,
            lines_per_file = 8,
            scale = 0.5 * scale,
            usage = "enemy",
          },
          {
            filename = "__virentis__/graphics/entities/creatures/kraken/tentacle-shadow.png",
            width = tentacle_width,
            height = tentacle_height,
            direction_count = 64,
            line_length = 8,
            lines_per_file = 8,
            scale = 0.5 * scale,
            draw_as_shadow = true,
            usage = "enemy",
          },
          {
            filename = "__virentis__/graphics/entities/creatures/kraken/tentacle-glow.png",
            width = tentacle_width,
            height = tentacle_height,
            direction_count = 64,
            line_length = 8,
            lines_per_file = 8,
            scale = 0.5 * scale,
            usage = "enemy",
            draw_as_glow = true,
            blend_mode = "additive",
          },
        }
      },
      water_reflection = {
        rotate = true,
        pictures = {
          filename = "__virentis__/graphics/entities/creatures/kraken/tentacle-water-reflection.png",
          width = tentacle_width + 40,
          height = tentacle_height + 40,
          variation_count = 16,
          line_length = 4,
          lines_per_file = 4,
          scale = 0.5 * scale,
          usage = "enemy",
        },
      }
    },
    dying_trigger_effect = {
      {
        type = "create-entity",
        entity_name = "kraken-tentacle-remain",
        find_non_colliding_position = true,
      }
    },
  },
  ---@type data.DelayedActiveTriggerPrototype
  {
    type = "delayed-active-trigger",
    name = "kraken-attack-lightning-area",
    delay = 1,
    repeat_delay = 10,
    repeat_count = 7,
    action = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects = {
          {
            type = "invoke-tile-trigger",
            repeat_count = 1,
          },
          {
            type = "create-entity",
            entity_name = "behemoth-wriggler-pentapod-premature",
            check_buildability = true,
            find_non_colliding_position = true,
            repeat_count = 2,
            offset_deviation = { { -5.0, -5.0 }, { 5.0, 5.0 } },
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 7,
              force = "enemy",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  type = "damage",
                  damage = { amount = 50, type = "electric" }
                },
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "kraken-lightning",
            as_enemy = true,
            offset_deviation = { { -10.0, -10.0 }, { 10.0, 10.0 } },
          },
        }
      },
    },
  },
  ---@type data.SpiderUnitPrototype
  {
    type = "spider-unit",
    name = "kraken",
    icon = "__virentis__/graphics/icons/creatures/kraken.png",
    subgroup = "virentis-enemies",
    order = "c",
    collision_box = { { -2.5 * scale, -2.5 * scale }, { 2.5 * scale, 2.5 * scale } },
    sticker_box = { { -2 * scale, -2 * scale }, { 2 * scale, 2 * scale } },
    selection_box = { { -2 * scale, -2 * scale }, { 2 * scale, 2 * scale } },
    drawing_box_vertical_extension = 0,
    torso_bob_speed = 0,
    collision_mask = { layers = { object = true } },
    flags = { "placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable" },
    max_health = 30000,
    impact_category = "organic",
    resistances = resistances,
    healing_per_tick = 5,
    distraction_cooldown = 300,
    min_pursue_time = 300,
    max_pursue_distance = 100,
    attack_parameters = {
      type = "beam",
      cooldown = 180,
      range = 30,
      warmup = 60,
      source_direction_count = 1,
      source_offset = { 0, 3 },
      range_mode = "bounding-box-to-bounding-box",
      ammo_category = "tesla",
      ammo_type = {
        target_type = "position",
        action = {
          type = "direct",
          action_delivery = {
            type = "delayed",
            delayed_trigger = "kraken-attack-lightning-area",
          }
        }
      }
    },
    vision_distance = 80,
    ai_settings =
    {
      join_attacks = false,
      allow_try_return_to_spawner = false
    },
    -- corpse = "kraken-corpse",
    dying_explosion = "big-stomper-pentapod-die",
    -- dying_trigger_effect =
    -- {
    -- {
    --   type = "create-entity",
    --   check_buildability = true,
    --   entity_name = "kraken-tentacle-cut-down",
    --   offsets =
    --   {
    --     util.rotate_position({ 0, 3 }, 0.1),
    --     util.rotate_position({ 0, 3 }, 0.3),
    --     util.rotate_position({ 0, 3 }, 0.5),
    --     util.rotate_position({ 0, 3 }, 0.7),
    --     util.rotate_position({ 0, 3 }, 0.9),
    --   }
    -- },
    -- },
    dying_sound = sounds.dying_sound,
    damaged_trigger_effect = gleba_hit_effects(),
    is_military_target = true,
    working_sound = sounds.working_sound,
    warcry = sounds.warcry,
    height = 0,
    torso_rotation_speed = 0.02,
    graphics_set = {
      render_layer = "above-tiles",
      animation = {
        layers = {
          {
            filename = "__virentis__/graphics/entities/creatures/kraken/head.png",
            width = head_width,
            height = head_height,
            direction_count = 64,
            line_length = 8,
            lines_per_file = 8,
            scale = 0.5 * scale,
            usage = "enemy",
            counterclockwise = true,
          },
          {
            filename = "__virentis__/graphics/entities/creatures/kraken/head-glow.png",
            width = head_width,
            height = head_height,
            direction_count = 64,
            line_length = 8,
            lines_per_file = 8,
            scale = 0.5 * scale,
            draw_as_glow = true,
            blend_mode = "additive",
            usage = "enemy",
            counterclockwise = true,
          },
          {
            filename = "__virentis__/graphics/entities/creatures/kraken/head-shadow.png",
            width = head_width,
            height = head_height,
            direction_count = 64,
            line_length = 8,
            lines_per_file = 8,
            scale = 0.5 * scale,
            usage = "enemy",
            counterclockwise = true,
            draw_as_shadow = true,
          }
        }
      },
      water_reflection = {
        rotate = true,
        pictures = {
          filename = "__virentis__/graphics/entities/creatures/kraken/head-water-reflection.png",
          width = head_width + 40,
          height = head_height + 40,
          variation_count = 16,
          line_length = 4,
          lines_per_file = 4,
          scale = 0.5 * scale,
          usage = "enemy",
          counterclockwise = true,
        },
      }
    },
    spider_engine =
    {
      walking_group_overlap = 0.3,
      legs = legs,
    }
  },
})
