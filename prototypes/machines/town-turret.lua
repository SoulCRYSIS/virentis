local sounds = require("__base__/prototypes/entity/sounds")

data:extend({
  ---@type data.ElectricTurretPrototype
  {
    type = "electric-turret",
    name = "town-turret",
    icon = "__virentis__/graphics/icons/machines/town-turret.png",
    icon_size = 64,
    flags = { "placeable-neutral", "player-creation" },
    max_health = 2000,
    corpse = "gun-turret-remnants",
    dying_explosion = "gun-turret-explosion",
    collision_box = { { -0.7, -0.7 }, { 0.7, 0.7 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    --damaged_trigger_effect = hit_effects.entity(),
    rotation_speed = 0.35 / 60,
    preparing_speed = 0.08,
    preparing_sound = sounds.gun_turret_activate,
    folding_sound = sounds.gun_turret_deactivate,
    folding_speed = 0.08,
    inventory_size = 1,
    automated_ammo_count = 10,
    alert_when_attacking = true,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    turret_base_has_direction = true,
    autoplace = {
      order = "ac",
      force = "player",
      probability_expression = "2 * virentis_town_border * grid_random_shift(10, 6, 995)",
    },
    energy_source = {
      type = "void"
    },
    folded_animation =
    {
      layers =
      {
        {
          filename = "__virentis__/graphics/entities/machines/town-turret/mortar-turret.png",
          priority = "low",
          line_length = 16,
          width = 2048 / 16,
          height = 448 / 4,
          frame_count = 1,
          direction_count = 64,
          shift = util.by_pixel(0, -28),
          animation_speed = 8,
          scale = 0.65
        },
        {
          filename = "__virentis__/graphics/entities/machines/town-turret/mortar-turret-mask.png",
          priority = "low",
          line_length = 16,
          width = 2048 / 16,
          height = 448 / 4,
          frame_count = 1,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = util.by_pixel(0, -28),
          scale = 0.65
        },
        {
          filename = "__virentis__/graphics/entities/machines/town-turret/mortar-turret-shadow.png",
          priority = "low",
          line_length = 4,
          width = 672 / 4,
          height = 1472 / 16,
          frame_count = 1,
          draw_as_shadow = true,
          direction_count = 64,
          shift = util.by_pixel(20, -3.5),
          scale = 0.65
        }
      }
    },
    graphics_set =
    {
      base_visualisation =
      {
        animation =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/gun-turret/gun-turret-base.png",
              priority = "high",
              width = 150,
              height = 118,
              axially_symmetrical = false,
              direction_count = 1,
              frame_count = 1,
              shift = util.by_pixel(0.5, -1),
              scale = 0.5

            },
            {
              filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
              flags = { "mask", "low-object" },
              line_length = 1,
              width = 122,
              height = 102,
              axially_symmetrical = false,
              direction_count = 1,
              frame_count = 1,
              shift = util.by_pixel(0, -4.5),
              apply_runtime_tint = true,
              scale = 0.5
            }
          }
        }
      }
    },
    vehicle_impact_sound = sounds.generic_impact,

    attack_parameters =
    ---@type data.ProjectileAttackParameters
    {
      type = "projectile",
      ammo_category = "mortar-bomb",
      cooldown = 540,
      movement_slow_down_factor = 0,
      projectile_creation_distance = 0.5,
      projectile_center = { -0, -0.6 },
      health_penalty = -1,
      rotate_penalty = 1,
      range = 80,
      min_range = 20,
      turn_range = 1,
      sound = sounds.tank_gunshot,
      ammo_type = {
        target_type = "position",
        clamp_position = true,
        action = {
          type = "direct",
          action_delivery = {
            type = "stream",
            stream = "town-turret-projectile-stream",
            source_offset = { 0, 0.25 },
          },
        },
      }
    },

    call_for_help_radius = 40,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/gun-turret/gun-turret-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 32,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "trivial-smoke",
    name = "town-turret-smoke-trail",
    animation =
    {
      filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
      priority = "high",
      width = 50,
      height = 50,
      frame_count = 16,
      animation_speed = 16 / 60,
      scale = 0.5
    },
    duration = 60,
    fade_away_duration = 30,
    show_when_smoke_off = true
  },
  {
    type = "stream",
    name = "town-turret-projectile-stream",
    action = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "big-explosion",
            only_when_visible = true
          },
          {
            type = "damage",
            damage = {amount = 100, type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "medium-scorchmark-tintable",
            check_buildability = true
          },
          {
            type = "invoke-tile-trigger",
            repeat_count = 1
          },
          {
            type = "destroy-decoratives",
            from_render_layer = "decorative",
            to_render_layer = "object",
            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
            include_decals = false,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
            radius = 3.5 -- large radius for demostrative purposes
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 6.5,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 200, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion",
                    only_when_visible = true
                  }
                }
              }
            }
          }
        }
      }
    },
    flags = { "not-on-map" },
    hidden = true,
    ground_light = {
      color = { r = 1, g = 0.9, b = 0.5 },
      intensity = 0.4,
      size = 15
    },
    stream_light = {
      color = { r = 1, g = 0.9, b = 0.5 },
      intensity = 1,
      size = 4
    },
    oriented_particle = true,
    particle = {
      filename = "__base__/graphics/entity/cluster-grenade/cluster-grenade.png",
      width = 48,
      height = 54,
      animation_speed = 0.25,
      frame_count = 16,
      line_length = 8,
      shift = { 0.015625, 0.015625 },
      scale = 0.5,
    },
    shadow = {
      draw_as_shadow = true,
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      width = 50,
      height = 40,
      animation_speed = 0.25,
      frame_count = 16,
      line_length = 8,
      shift = { 0.0625, 0.1875 },
      scale = 0.5,
    },
    particle_buffer_size = 1,
    particle_end_alpha = 1,
    particle_fade_out_threshold = 1,
    particle_horizontal_speed = 0.5,
    particle_horizontal_speed_deviation = 0.05,
    particle_loop_exit_threshold = 1,
    particle_loop_frame_count = 1,
    particle_spawn_interval = 0,
    particle_spawn_timeout = 1,
    particle_start_alpha = 1,
    particle_start_scale = 1,
    particle_vertical_acceleration = 0.01,
    progress_to_create_smoke = 0.03,
    smoke_sources = {
      {
        name = "town-turret-smoke-trail",
        deviation = { 0.1, 0.1 },
        frequency = 1,
        position = { 0, 0 },
        starting_frame = 4,
        starting_frame_deviation = 4,
      }
    },
  }
})
