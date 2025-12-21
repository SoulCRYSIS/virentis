local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

local width = 448
local height = 384

local shift = { 1.5, -1 }

local function convert_to_4way(animation)
  local north = {}
  for _, layer in ipairs(animation) do
    local modified_layer = table.deepcopy(layer)
    modified_layer.x = 0
    table.insert(north, modified_layer)
  end

  local east = {}
  for _, layer in ipairs(animation) do
    local modified_layer = table.deepcopy(layer)
    modified_layer.x = width
    table.insert(east, modified_layer)
  end

  local south = {}
  for _, layer in ipairs(animation) do
    local modified_layer = table.deepcopy(layer)
    modified_layer.x = width * 2
    table.insert(south, modified_layer)
  end

  local west = {}
  for _, layer in ipairs(animation) do
    local modified_layer = table.deepcopy(layer)
    modified_layer.x = width * 3
    table.insert(west, modified_layer)
  end

  return {
    north = { layers = north },
    east = { layers = east },
    south = { layers = south },
    west = { layers = west }
  }
end

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
}

local charging_state_animation = convert_to_4way({
  base_animation,
  base_glow_animation,
  charging_animation,
})

data:extend({
  ---@type data.ElectricTurretPrototype
  {
    type = "electric-turret",
    name = "town-tesla-turret",
    subgroup = "virentis-machines",
    icon = "__space-age__/graphics/icons/fulgoran-ruin-attractor.png",
    flags = { "placeable-player", "player-creation" },
    max_health = 3000,
    collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    collision_mask = { layers = { item = true, object = true, player = true, water_tile = true, is_object = true, is_lower_object = true } },
    damaged_trigger_effect = hit_effects.entity(),
    start_attacking_only_when_can_shoot = true,
    rotation_speed = 0.005,
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
      probability_expression = "2 * max(virentis_town_edge, 0.1 * virentis_town_rural) * grid_random_shift(16, 10, 996)",
    },
    turret_base_has_direction = true,
    ending_attack_animation = convert_to_4way({
      base_animation,
      base_glow_animation,
      attacking_animation,
    }),
    preparing_animation = charging_state_animation,
    folded_animation = convert_to_4way({
      base_animation,
      base_glow_animation,
    }),
    glow_light_intensity = 0.5, -- defaults to 0
    integration_patch_render_layer = "elevated-higher-object",
    graphics_set =
    {
      -- base_visualisation =
      -- {
      -- {
      --   animation =     {
      --     layers = {
      --       {
      --         filename = "__virentis__/graphics/mocks/empty-icon.png",
      --         priority = "low",
      --         width = 16,
      --         height = 16,
      --         frame_count = 1,
      --         direction_count = 1,
      --         line_length = 1,
      --         lines_per_file = 1,
      --       }
      --     },
      --   },
      -- },
      -- }
    },

    attack_parameters =
    {
      type = "beam",
      cooldown = 120,
      range = 60,
      range_mode = "center-to-bounding-box",
      fire_penalty = 0.9,
      source_direction_count = 64,
      source_offset = { -1.1, -0.5 },
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
                    chain = "chain-tesla-turret-chain",
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
                    beam = "chain-tesla-turret-beam-start",
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
})
