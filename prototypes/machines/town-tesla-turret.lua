local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

local virentis = require("prototypes.utils")

local width = 448
local height = 384

local shift = { 1.5, -1 }

local base_animation = {
  filename = "__virentis__/graphics/entities/machines/town-tesla-turret/town-tesla-turret.png",
  priority = "extra-high",
  width = width,
  height = height,
  shift = shift,
  scale = 0.5,
  frame_count = 1,
  line_length = 1,
  lines_per_file = 1,
  direction_count = 1,
  repeat_count = 8,
  animation_speed = 0.2,
}
local base_glow_animation = {
  filename = "__virentis__/graphics/entities/machines/town-tesla-turret/town-tesla-turret-glow.png",
  priority = "extra-high",
  width = width,
  height = height,
  shift = shift,
  scale = 0.5,
  draw_as_glow = true,
  blend_mode = "additive",
  frame_count = 1,
  line_length = 1,
  lines_per_file = 1,
  direction_count = 1,
  repeat_count = 8,
  animation_speed = 0.2,
}
local charging_animation = {
  filename = "__virentis__/graphics/entities/machines/town-tesla-turret/town-tesla-turret-charging-glow.png",
  priority = "extra-high",
  width = width,
  height = height,
  shift = shift,
  scale = 0.5,
  draw_as_glow = true,
  blend_mode = "additive",
  frame_count = 8,
  line_length = 1,
  animation_speed = 0.2,
}
local attacking_animation = {
  filenames = { "__virentis__/graphics/entities/machines/town-tesla-turret/town-tesla-turret-attacking-glow.png" },
  width = width,
  height = height,
  shift = shift,
  scale = 0.5,
  draw_as_glow = true,
  blend_mode = "additive",
  frame_count = 1,
  line_length = 1,
  lines_per_file = 1,
  direction_count = 1,
  repeat_count = 8,
  animation_speed = 0.2,
}

data:extend({
  ---@type data.ElectricTurretPrototype
  {
    type = "electric-turret",
    name = "town-tesla-turret",
    subgroup = "virentis-machines",
    order = "zc",
    icon = "__space-age__/graphics/icons/fulgoran-ruin-attractor.png",
    flags = { "placeable-player", "player-creation" },
    max_health = 4000,
    healing_per_tick = 1,
    collision_box = { { -1, -1 }, { 1, 1 } },
    selection_box = { { -0.75, -0.75 }, { 0.75, 0.75 } },
    collision_mask = { layers = { item = true, object = true, player = true, water_tile = true, is_object = true, is_lower_object = true } },
    damaged_trigger_effect = hit_effects.entity(),
    start_attacking_only_when_can_shoot = true,
    rotation_speed = 0.05,
    preparing_speed = 0.1,
    folding_speed = 0.1,
    ending_attack_speed = 1 / (30 + 1), -- Must be clocked to the beam duration so the face light turns off at the right time
    open_sound = sounds.turret_open,
    close_sound = sounds.turret_close,
    working_sound =
    {
      sound = { filename = "__space-age__/sound/entity/tesla-turret/tesla-turret-base.ogg", volume = 0.3 },
      use_doppler_shift = false,
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },
    preparing_sound = space_age_sounds.tesla_turret_activate,
    folding_sound = space_age_sounds.tesla_turret_deactivate,
    rotating_sound = space_age_sounds.tesla_turret_rotate,
    corpse = "lightning-collector-remnants",
    dying_explosion = "laser-turret-explosion",
    energy_source = {
      type = "void"
    },
    autoplace = {
      order = "aca",
      force = "player",
      probability_expression = "2 * max(virentis_town_edge, 0.1 * virentis_town_rural) * grid_random_shift(18, 12, 996)",
    },
    turret_base_has_direction = true,
    folded_animation = {
      filename = "__virentis__/graphics/mocks/empty-icon.png",
      priority = "low",
      width = 16,
      height = 16,
      frame_count = 1,
      direction_count = 1,
      line_length = 1,
      lines_per_file = 1,
    },
    ending_attack_animation = virentis.load_sprite_4way({
      attacking_animation,
    }),
    energy_glow_animation = laser_turret_shooting_glow(),
    glow_light_intensity = 0.5, -- defaults to 0
    graphics_set =
    {
      base_visualisation = {
        {
          render_layer = "higher-object-under",
          animation = virentis.load_sprite_4way({
            base_animation,
            base_glow_animation,
          }),
        },
        {
          render_layer = "higher-object-above",
          enabled_states = { "prepared", "preparing", "starting-attack", "attacking", "ending-attack" },
          animation = virentis.load_sprite_4way({
            charging_animation,
          }),
        },
      },
    },

    attack_parameters =
    {
      type = "beam",
      cooldown = 120,
      range = 90,
      range_mode = "center-to-bounding-box",
      fire_penalty = 0.9,
      source_direction_count = 1,
      source_offset = { 0, -1 },
      ammo_category = "tesla",
      ammo_type =
      {
        energy_consumption = "1MJ",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              -- Chain effect must go first in case the beam kills the target
              {
                type = "nested-result",
                action =
                {
                  type = "direct",
                  action_delivery =
                  {
                    type = "chain",
                    chain = "town-tesla-turret-chain",
                  }
                }
              },
              {
                type = "nested-result",
                action =
                {
                  type = "direct",
                  action_delivery =
                  {
                    type = "beam",
                    beam = "town-tesla-turret-beam-start",
                    max_length = 40,
                    duration = 30,
                    add_to_shooter = false,
                    destroy_with_source_or_target = false,
                    source_offset = { 0, -2.6 }
                  }
                }
              }
            }
          }
        }
      }
    },

    call_for_help_radius = 40,
    water_reflection =
    {
      pictures =
      {
        filename = "__space-age__/graphics/entity/lightning-rod/lightning-rod.png",
        priority = "extra-high",
        width = 12,
        height = 28,
        shift = util.by_pixel(0, 55),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  make_tesla_beam("town-tesla-turret-beam-start", true, 180),
  {
    type = "chain-active-trigger",
    name = "town-tesla-turret-chain",
    max_jumps = 12,
    max_range_per_jump = 18,
    jump_delay_ticks = 6,
    fork_chance = 0.08,
    fork_chance_increase_per_quality_level = 0.08,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "beam",
        beam = "chain-tesla-turret-beam-bounce",
        max_length = 20 + 0.5,
        duration = 30,
        add_to_shooter = false,
        destroy_with_source_or_target = false,
        source_offset = { 0, 0 }, -- should match beam's target_offset
      },
    },
  }
})
