local space_age_sounds = require("__space-age__.prototypes.entity.sounds")

local make_enemy = function(name, zoom)
  return
      [[
    game.simulation.camera_zoom = ]] .. zoom .. [[
    game.simulation.camera_position = {0, 0}
    game.surfaces[1].build_checkerboard{{-40, -40}, {40, 40}}

    enemy = game.surfaces[1].create_entity{name = "]] .. name .. [[", position = {0, 0}}

    step_0 = function()
      if enemy.valid then
          game.simulation.camera_position = {enemy.position.x, enemy.position.y - 0.5}
      end

      script.on_nth_tick(1, function()
          step_0()
      end)
    end

    step_0()
  ]]
end

local function from_color(a)
  return { a.r, a.g, a.b, a.a }
end

local function lerp_color(a, b, amount)
  return {
    r = a.r + amount * (b.r - a.r),
    g = a.g + amount * (b.g - a.g),
    b = a.b + amount * (b.b - a.b),
    a = a.a + amount * (b.a - a.a),
  }
end

local function fade(tint, amount) -- fades to minimal opacity grey. Low opacity is good for the mask to let the base layer show htough (instead of having a grey mask)
  return from_color(lerp_color(tint, { r = 1, g = 1, b = 1, a = 2 }, amount))
end

local function grey_overlay(tint, amount) -- fades to opaque grey. Full opacity is required for body.
  return lerp_color(tint, { r = 127, g = 127, b = 127, a = 255 }, amount)
end

if mods["behemoth-enemies"] == nil then
  local gleba_body_tint = { r = 117, g = 116, b = 104, a = 255 }
  local behemoth_wriggler_body_tint = gleba_body_tint
  local behemoth_color = { r = 150, g = 0, b = 150, a = 255 }
  local behemoth_color2 = { r = 150, g = 100, b = 150, a = 255 }
  local behemoth_scale = 1

  new_tier_list = { "behemoth" }
  local gleba_mask_tints = { behemoth_color }
  local gleba_mask_tints2 = { behemoth_color2 }

  for i, k in pairs(new_tier_list) do
    gleba_mask_tint = gleba_mask_tints[i]
    gleba_mask_tint2 = gleba_mask_tints2[i]
    local behemoth_wriggler_mask_tint = fade(gleba_mask_tint, 0.4)

    factoriopedia_gleba_enemy_stomper = { init = make_enemy(k .. "-stomper-pentapod", 0.8) }
    factoriopedia_gleba_enemy_strafer = { init = make_enemy(k .. "-strafer-pentapod", 0.8) }
    factoriopedia_gleba_enemy_wriggler = { init = make_enemy(k .. "-wriggler-pentapod", 1.8) }
    factoriopedia_gleba_enemy_wriggler_premature = { init = make_enemy(k .. "-wriggler-pentapod-premature", 1.8) }

    make_strafer(k .. "-", 2.0 * behemoth_scale, 4000, 2.4, 7.0, 30, 35, 40, {
      mask = fade(gleba_mask_tint, 0.4),
      mask_thigh = fade(gleba_mask_tint2, 0.2),
      body = from_color(grey_overlay(gleba_body_tint, 0.1)),
      projectile_mask = behemoth_wriggler_mask_tint, -- same as wriggler mask tint
      projectile = behemoth_wriggler_body_tint       -- same as wriggler body tint
    }, factoriopedia_gleba_enemy_strafer, space_age_sounds.strafer_pentapod.big)
    make_stomper(k .. "-", 2.3 * behemoth_scale, 30000, 2.4, 2.8, {
      mask = fade(gleba_mask_tint, 0.4),
      mask_thigh = fade(gleba_mask_tint2, 0.3),
      body = from_color(grey_overlay(gleba_body_tint, 0.1)),
      body_thigh = lerp_color(gleba_body_tint, grey_overlay({ r = 250, g = 108, b = 0, a = 255 }, 0.7), 0.1) -- more orange/yellow
    }, factoriopedia_gleba_enemy_stomper, space_age_sounds.stomper_pentapod.big)

    make_wriggler(k .. "-", 1.2 * behemoth_scale, 600, 2.6, {
        mask = fade(gleba_mask_tint, 0.5),
        body = gleba_body_tint
      }, factoriopedia_gleba_enemy_wriggler, factoriopedia_gleba_enemy_wriggler_premature,
      space_age_sounds.wriggler_pentapod.big)
      
    if not data.raw["unit"][k .. "-wriggler-pentapod-premature"] then
      local premature_wriggler = table.deepcopy(data.raw["unit"][k .. "-wriggler-pentapod"])
      premature_wriggler.name = k .. "-wriggler-pentapod-premature"
      premature_wriggler.healing_per_tick = -premature_wriggler.max_health / 50 / 60
      premature_wriggler.absorptions_to_join_attack = { spores = 0 }
      data:extend({ premature_wriggler })
    end

    data.raw["spider-unit"][k .. "-strafer-pentapod"].icon = "__virentis-graphics__/icons/enemies/" ..
        k .. "-strafer.png"
    data.raw["spider-unit"][k .. "-stomper-pentapod"].icon = "__virentis-graphics__/icons/enemies/" ..
        k .. "-stomper.png"
    data.raw["simple-entity"][k .. "-stomper-shell"].icon = "__virentis-graphics__/icons/enemies/" .. k .. "-stomper.png"
    data.raw["unit"][k .. "-wriggler-pentapod-premature"].icon = "__virentis-graphics__/icons/enemies/" ..
        k .. "-wriggler.png"
    data.raw["unit"][k .. "-wriggler-pentapod"].icon = "__virentis-graphics__/icons/enemies/" .. k .. "-wriggler.png"
    data.raw["corpse"][k .. "-wriggler-pentapod-corpse"].icon = "__virentis-graphics__/icons/enemies/" ..
        k .. "-wriggler-corpse.png"
    data.raw["corpse"][k .. "-stomper-corpse"].icon = "__virentis-graphics__/icons/enemies/" .. k .. "-stomper.png"
    data.raw["corpse"][k .. "-strafer-corpse"].icon = "__virentis-graphics__/icons/enemies/" .. k .. "-strafer.png"
    data.raw["spider-leg"][k .. "-stomper-pentapod-leg"].icon = "__virentis-graphics__/icons/enemies/" .. k ..
        "-stomper.png"
    data.raw["spider-leg"][k .. "-strafer-pentapod-leg"].icon = "__virentis-graphics__/icons/enemies/" .. k ..
        "-strafer.png"
  end
end

local behemoth_stomper_pentapod_shell = table.deepcopy(data.raw["simple-entity"]["behemoth-stomper-shell"])
behemoth_stomper_pentapod_shell.name = "virentis-behemoth-stomper-shell"
behemoth_stomper_pentapod_shell.minable.results = {
  { type = "item", name = "kheast",       amount_min = 30, amount_max = 45 },
  { type = "item", name = "stone",        amount_min = 20, amount_max = 30 },
  { type = "item", name = "pentapod-egg", amount_min = 3,  amount_max = 5, percent_spoiled = 0.5 },
}
behemoth_stomper_pentapod_shell.minable.mining_trigger = {
  type = "direct",
  action_delivery = {
    type = "instant",
    target_effects = {
      {
        type = "create-entity",
        entity_name = "behemoth-wriggler-pentapod-premature",
        as_enemy = true,
        find_non_colliding_position = true,
        offset_deviation = { { -5, -5 }, { 5, 5 } },
      }
    }
  }
}
behemoth_stomper_pentapod_shell.minable.mining_time = 5
behemoth_stomper_pentapod_shell.autoplace = {
  force = "enemy",
  probability_expression =
  "spot_noise{x = x,\z
              y = y,\z
              seed0 = map_seed,\z
              seed1 = 7778,\z
              density_expression = virentis_select(virentis_elevation, -50, 0, 2, 0, 1),\z
              spot_radius_expression = 0.5,\z
              spot_quantity_expression = 1,\z
              spot_favorability_expression = 1,\z
              candidate_spot_count = 4,\z
              basement_value = 0,\z
              suggested_minimum_candidate_point_spacing = 20,\z
              maximum_spot_basement_radius = 0.5,\z
              region_size = 512}"
}
behemoth_stomper_pentapod_shell.created_effect = {
  type = "direct",
  action_delivery =
  {
    type = "instant",
    source_effects =
    {
      {
        type = "create-decorative",
        decorative = "virentis-pale-lettuce-lichen-cups-1x1",
        spawn_min = 6,
        spawn_max = 12,
        spawn_min_radius = 5,
        spawn_max_radius = 7,
      },
      {
        type = "create-decorative",
        decorative = "virentis-pale-lettuce-lichen-cups-3x3",
        spawn_min = 4,
        spawn_max = 8,
        spawn_min_radius = 5,
        spawn_max_radius = 7,
      },
      {
        type = "create-decorative",
        decorative = "virentis-pale-lettuce-lichen-cups-6x6",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 5,
        spawn_max_radius = 7,
      },
      {
        type = "create-decorative",
        decorative = "virentis-gleba-spawner-slime",
        spawn_min = 2,
        spawn_max = 4,
        spawn_min_radius = 4,
        spawn_max_radius = 6,
      },
      {
        type = "create-decorative",
        decorative = "virentis-coral-stunted",
        spawn_min = 2,
        spawn_max = 4,
        spawn_min_radius = 5,
        spawn_max_radius = 7,
      },
      {
        type = "create-decorative",
        decorative = "virentis-purple-nerve-roots-veins-dense",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 4,
        spawn_max_radius = 6,
      },
    }
  }
}

local pentapod_spawner = table.deepcopy(data.raw["unit-spawner"]["gleba-spawner"])
pentapod_spawner.name = "virentis-pentapod-spawner"
pentapod_spawner.max_health = 1500
pentapod_spawner.subgroup = "virentis-enemies"
pentapod_spawner.result_units = {
  { "small-wriggler-pentapod",    { { 0.0, 0.4 }, { 0.1, 0.4 }, { 0.5, 0 } } },
  { "small-strafer-pentapod",     { { 0.0, 0.4 }, { 0.1, 0.4 }, { 0.5, 0 } } },
  { "small-stomper-pentapod",     { { 0.0, 0.2 }, { 0.1, 0.2 }, { 0.5, 0 } } },
  { "medium-wriggler-pentapod",   { { 0.1, 0 }, { 0.5, 0.4 }, { 0.85, 0 } } },
  { "medium-strafer-pentapod",    { { 0.1, 0 }, { 0.5, 0.4 }, { 0.85, 0 } } },
  { "medium-stomper-pentapod",    { { 0.1, 0 }, { 0.5, 0.2 }, { 0.85, 0 } } },
  { "big-wriggler-pentapod",      { { 0.5, 0 }, { 0.85, 0.4 }, { 1.5, 0 } } },
  { "big-strafer-pentapod",       { { 0.5, 0 }, { 0.85, 0.4 }, { 1.5, 0 } } },
  { "big-stomper-pentapod",       { { 0.5, 0 }, { 0.85, 0.2 }, { 1.5, 0 } } },
  { "behemoth-wriggler-pentapod", { { 0.85, 0 }, { 0.95, 0.4 }, { 1.0, 0.4 } } },
  { "behemoth-strafer-pentapod",  { { 0.85, 0 }, { 0.95, 0.4 }, { 1.0, 0.4 } } },
  { "behemoth-stomper-pentapod",  { { 0.85, 0 }, { 0.95, 0.2 }, { 1.0, 0.2 } } },
}
pentapod_spawner.autoplace = {
  order = "ba",
  force = "enemy",
  probability_expression = "virentis_pentapod_spawner",
  control = "virentis_enemy_base",
}

local pentapod_spawner_small = table.deepcopy(data.raw["unit-spawner"]["gleba-spawner-small"])
pentapod_spawner_small.name = "virentis-pentapod-spawner-small"
pentapod_spawner_small.max_health = 300
pentapod_spawner_small.subgroup = "virentis-enemies"
pentapod_spawner_small.result_units = {
  { "small-wriggler-pentapod",    { { 0.0, 0.9 }, { 0.1, 0.9 }, { 0.5, 0 } } },
  { "medium-wriggler-pentapod",   { { 0.1, 0 }, { 0.5, 0.9 }, { 0.85, 0 } } },
  { "big-wriggler-pentapod",      { { 0.5, 0 }, { 0.85, 0.9 }, { 1, 0.45 } } },
  { "behemoth-wriggler-pentapod", { { 0.85, 0 }, { 0.95, 0.9 }, { 1, 0.9 } } },
}
pentapod_spawner_small.autoplace = {
  order = "bb",
  force = "enemy",
  probability_expression = "virentis_pentapod_spawner_small",
  control = "virentis_enemy_base",
}
data:extend({
  pentapod_spawner,
  pentapod_spawner_small,
  behemoth_stomper_pentapod_shell,
})
