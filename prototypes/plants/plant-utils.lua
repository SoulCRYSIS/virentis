local virentis_plant = {}

local sounds = require("__base__.prototypes.entity.sounds")

virentis_plant.simulation = function(name, tile_name)
  return {
    planet = "virentis",
    hide_factoriopedia_gradient = true,
    init =
        [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "]] .. tile_name .. [["}}
      end
    end

    game.surfaces[1].create_entity{name = "]] .. name .. [[-tree", position = {x=-2.54, y=-0.76}, tick_grown = 5000}
    game.surfaces[1].create_entity{name = "]] .. name .. [[-tree", position = {x=2.87, y=-0.37}, tick_grown = 8000}
    game.surfaces[1].create_entity{name = "]] .. name .. [[-tree", position = {x=-4.68, y=1.83}, tick_grown = 1000}
    game.surfaces[1].create_entity{name = "]] .. name .. [[-tree", position = {x=-0.10, y=0.67}, tick_grown = 10000}
    game.surfaces[1].create_entity{name = "]] .. name .. [[-tree", position = {x=4.80, y=1.69}, tick_grown = 5000}
  ]]
  }
end

virentis_plant.sound_variations = function(filename_string, variations, volume_parameter, modifiers_parameter)
  local result = {}
  for i = 1, variations do
    result[i] = { filename = filename_string .. "-" .. i .. ".ogg", volume = volume_parameter or 0.5 }
    if modifiers_parameter then
      result[i].modifiers = modifiers_parameter
    end
  end
  return result
end

virentis_plant.default_emission = { spores = 5 }
virentis_plant.default_flags = { "placeable-neutral", "placeable-off-grid", "breaths-air" }
virentis_plant.leaf_sound = sounds.tree_leaves
virentis_plant.spoilage_sound = virentis_plant.sound_variations("__space-age__/sound/mining/spoilage", 3, 0)
virentis_plant.leaf_sound_trigger = {
  {
    type = "direct",
    action_delivery =
    {
      {
        type = "instant",
        target_effects = {
          {
            type = "play-sound",
            sound = virentis_plant.leaf_sound,
            damage_type_filters = "fire"
          }
        }
      }
    }
  }
}
virentis_plant.spoilage_sound_trigger = {
  {
    type = "direct",
    action_delivery =
    {
      {
        type = "instant",
        target_effects = {
          {
            type = "play-sound",
            sound = virentis_plant.spoilage_sound,
            damage_type_filters = "fire"
          }
        }
      }
    }
  }
}

local virentis_tree_particle_effects =
{
  -- ["vangrove"] = {
  --   leaf_1 = "teflilly-leaf-particle",
  --   trunk_1 = "teflilly-branch-particle"
  -- },
  -- ["gnarpod"] = {
  --   crop_1 = "sunnycomb-leaf-particle",
  --   trunk_1 = "stingfrond-branch-particle",
  -- },
  -- ["coneflora"] = {
  --   crop_1 = "teflilly-leaf-particle",
  --   trunk_1 = "teflilly-branch-particle",
  -- },
  -- ["puffberry"] = {
  --   crop_1 = "yumako-leaf-particle",
  --   trunk_1 = "yumako-branch-particle",
  -- },
  ["redbloom"] = {
    crop_1 = "yumako-leaf-particle",
    trunk_1 = "yumako-branch-particle",
  },
  ["rockmalt"] = {
    crop_1 = "sunnycomb-leaf-particle",
    spongy = "sunnycomb-branch-particle"
  },
  ["mangroove"] = {
    crop_1 = "sunnycomb-leaf-particle",
    spongy = "sunnycomb-branch-particle"
  },
  ["nyxoleum"] = {
    water_cane_top = "water-cane-branch-particle",
    water_cane = "water-cane-branch-particle",
  },
  -- ["jellystem"] =     { sap = "jellystem-leaf-particle",
  --                       jellystem = "jellystem-branch-particle"
  --                     },
  -- ["cuttlepop"] =     { crop_4 = "cuttlepop-leaf-particle",
  --                       spongy = "cuttlepop-branch-particle"
  --                     },
  -- ["slipstack"] =     { slime = "slipstack-leaf-particle",
  --                       spongy = "slipstack-branch-particle"
  --                     },
  -- ["funneltrunk"] =   { crop_1 = "funneltrunk-leaf-particle",
  --                       spongy = "funneltrunk-branch-particle"
  --                     },
  -- ["hairyclubnub"] =  { leaf_3 = "hairyclubnub-leaf-particle",
  --                       trunk_2 = "hairyclubnub-branch-particle"
  --                     },
  -- ["teflilly"] =      { leaf_1 = "teflilly-leaf-particle",
  --                       trunk_1 = "teflilly-branch-particle"
  --                     },
  -- ["lickmaw"] =       { crop_1 = "lickmaw-leaf-particle",
  --                       spongy = "lickmaw-branch-particle"
  --                     },
  -- ["stingfrond"] =    { leaf_2 = "stingfrond-leaf-particle",
  --                       trunk_1 = "stingfrond-branch-particle"
  --                     },
  -- ["boompuff"] =      { crop_3 = "boompuff-leaf-particle",
  --                       trunk_3 = "boompuff-branch-particle"
  --                     },
  -- ["sunnycomb"] =     { crop_1 = "sunnycomb-leaf-particle",
  --                       spongy = "sunnycomb-branch-particle"
  --                     },
  -- ["water-cane"] =    { water_cane_top = "water-cane-branch-particle",
  --                       water_cane = "water-cane-branch-particle"
  --                     }
}

virentis_plant.tree_variations = function(name, variation_count, per_row, scale_multiplier, width, height, has_glow, shift,
                                        reflection_shift)
  variation_count = variation_count or 5
  per_row = per_row or 5
  scale_multiplier = scale_multiplier or 1
  local variations = {}
  local reflection_shift = reflection_shift or util.by_pixel(52, 80)
  local shift = shift or util.by_pixel(52, -40)
  -- local reflection_shift = {shift[0], shift[1]} --or util.by_pixel(52, 40)

  local sap_particle = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].sap
  local leaf_particle_1 = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].leaf_1
  local leaf_particle_2 = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].leaf_2
  local leaf_particle_3 = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].leaf_3
  local crop_particle_1 = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].crop_1
  local crop_particle_2 = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].crop_2
  local crop_particle_3 = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].crop_3
  local crop_particle_4 = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].crop_4
  local slime_particle = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].slime
  local trunk_particle_1 = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].trunk_1
  local trunk_particle_2 = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].trunk_2
  local trunk_particle_3 = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].trunk_3
  local spongy_particle = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].spongy
  local water_cane_particle = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].water_cane
  local water_cane_top_particle = virentis_tree_particle_effects[name] and
      virentis_tree_particle_effects[name].water_cane_top
  local jellystem_particle = virentis_tree_particle_effects[name] and virentis_tree_particle_effects[name].jellystem

  for i = 1, variation_count do
    local x = ((i - 1) % per_row) * width
    local y = math.floor((i - 1) / per_row) * height

    ---@type data.TreeVariation
    local variation = {
      trunk                             = {
        filename = "__virentis-graphics__/entities/plants/" .. name .. "/" .. name .. ".png", -- use same graphics for now
        flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.5 * scale_multiplier
      },
      leaves                            = {
        filename = "__virentis-graphics__/entities/plants/" .. name .. "/" .. name .. "-harvest.png",
        flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.5 * scale_multiplier
      },
      normal                            = {
        filename = "__virentis-graphics__/entities/plants/" .. name .. "/" .. name .. "-normal.png",
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.5 * scale_multiplier
      },
      shadow                            = {
        frame_count = 2,
        lines_per_file = 1,
        line_length = 1,
        flags = { "mipmap", "shadow" },
        surface = "gleba",
        filenames =
        {
          "__virentis-graphics__/entities/plants/" .. name .. "/" .. name .. "-harvest-shadow.png",
          "__virentis-graphics__/entities/plants/" .. name .. "/" .. name .. "-shadow.png",
        },
        width = width,
        height = height,
        x = x,
        y = y,
        shift = shift,
        scale = 0.5 * scale_multiplier
      },

      -- water_reflection                  = {
      --   pictures = {
      --     filename = "__space-age__/graphics/entity/plant/" .. name .. "/" .. name .. "-effect-map.png",
      --     --flags = { "mipmap" },
      --     surface = "gleba",
      --     width = width,
      --     height = height,
      --     x = x,
      --     y = y,
      --     --frame_count = 1,
      --     shift = reflection_shift,
      --     scale = 0.33 * scale_multiplier
      --   }
      -- } or nil,

      ---@diagnostic disable-next-line: missing-fields
      leaf_generation                   = {},
      ---@diagnostic disable-next-line: missing-fields
      branch_generation                 = {},

      leaves_when_damaged               = 100,
      leaves_when_destroyed             = 35,
      leaves_when_mined_manually        = 40,
      leaves_when_mined_automatically   = 16,
      branches_when_damaged             = 20,
      branches_when_destroyed           = 16,
      branches_when_mined_manually      = 15,
      branches_when_mined_automatically = 8
    }

    if has_glow then
      variation.leaves =
      {
        layers =
        {
          variation.leaves,
          {
            filename = "__virentis-graphics__/entities/plants/" .. name .. "/" .. name .. "-glow.png",
            flags = { "mipmap" },
            surface = "gleba",
            width = width,
            height = height,
            x = x,
            y = y,
            frame_count = 1,
            shift = shift,
            scale = 0.5 * scale_multiplier,
            apply_runtime_tint = true,
            draw_as_light = true
          }
        }
      }
    end

    if sap_particle then -- jellystem
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = sap_particle,
        offset_deviation =
        {
          { -0.8, -1.2 },
          { 0.8,  1.2 }
        },
        initial_height = 1.5,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.06,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.025,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.5,
        tail_length = 10,
        tail_length_deviation = 5,
        tail_width = 5,
        rotate_offsets = false,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 50
      variation.leaves_when_destroyed = 35
      variation.leaves_when_mined_manually = 40
      variation.leaves_when_mined_automatically = 16
    end

    if slime_particle then -- slipstack
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = slime_particle,
        offset_deviation =
        {
          { -0.6, -0.6 },
          { 0.6,  0.6 }
        },
        initial_height = 2.3,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.14,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.013,
        speed_from_center_deviation = 0.02,
        frame_speed = 1,
        frame_speed_deviation = 0,
        only_when_visible = true
      }
    end

    if leaf_particle_1 then -- teflilly
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = leaf_particle_1,
        offset_deviation = { { -1, -0.8 }, { 1, 0.8 } },
        initial_height = 2.8,
        initial_height_deviation = 0.035,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.13,
        speed_from_center = 0.015,
        speed_from_center_deviation = 0.025,
        frame_speed = 0.6,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 15
      variation.leaves_when_destroyed = 40
      variation.leaves_when_mined_manually = 35
      variation.leaves_when_mined_automatically = 25
    end

    if leaf_particle_2 then -- stingfrond
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = leaf_particle_2,
        offset_deviation = { { -0.8, -0.6 }, { 0.8, 0.6 } },
        initial_height = 2,
        initial_height_deviation = 0.035,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.13,
        speed_from_center = 0.015,
        speed_from_center_deviation = 0.025,
        frame_speed = 0.6,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 20
      variation.leaves_when_destroyed = 40
      variation.leaves_when_mined_manually = 40
      variation.leaves_when_mined_automatically = 20
    end

    if leaf_particle_3 then -- hairy-clubnub
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = leaf_particle_3,
        offset_deviation = { { -1.2, -1 }, { 1.2, 1 } },
        initial_height = 2.7,
        initial_height_deviation = 0.035,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.13,
        speed_from_center = 0.005,
        speed_from_center_deviation = 0.025,
        frame_speed = 0.6,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 30
      variation.leaves_when_destroyed = 40
      variation.leaves_when_mined_manually = 35
      variation.leaves_when_mined_automatically = 20
    end

    if crop_particle_1 then -- funneltrunk, lickmaw, sunnycomb
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = crop_particle_1,
        repeat_count = 16,
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        initial_height = 3,
        initial_height_deviation = 0.035,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.045,
        only_when_visible = true
      }
      if name == "funneltrunk" then
        variation.leaves_when_damaged = 50
      else
        variation.leaves_when_damaged = 30
      end
      variation.leaves_when_destroyed = 40
      variation.leaves_when_mined_manually = 40
      variation.leaves_when_mined_automatically = 20
    end

    if crop_particle_2 then -- yumako
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = crop_particle_2,
        offset_deviation = { { -1, -1 }, { 1, 1 } },
        initial_height = 2.5,
        initial_height_deviation = 0.035,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.045,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 25
      variation.leaves_when_destroyed = 35
      variation.leaves_when_mined_manually = 40
      variation.leaves_when_mined_automatically = 16
    end

    if crop_particle_3 then -- boompuff
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = crop_particle_3,
        offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
        initial_height = 2,
        initial_height_deviation = 0.035,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.065,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 18
      variation.leaves_when_destroyed = 35
      variation.leaves_when_mined_manually = 40
      variation.leaves_when_mined_automatically = 16
    end

    if crop_particle_4 then -- cuttlepop
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = crop_particle_4,
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        initial_height = 2.2,
        initial_height_deviation = 0.035,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.045,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 30
      variation.leaves_when_destroyed = 40
      variation.leaves_when_mined_manually = 35
      variation.leaves_when_mined_automatically = 25
    end

    if trunk_particle_1 then -- teflilly, stingfrond
      variation.branch_generation = {
        type = "create-particle",
        particle_name = trunk_particle_1,
        offset_deviation = { { -0.4, -0.8 }, { 0.4, 0.8 } },
        initial_height = 1.5,
        initial_height_deviation = 1.5,
        initial_vertical_speed = 0.01,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.015,
        frame_speed = 0.8,
        only_when_visible = true
      }
      variation.branches_when_damaged = 30
      variation.branches_when_destroyed = 40
      variation.branches_when_mined_manually = 35
      variation.branches_when_mined_automatically = 8
    end

    if trunk_particle_2 then -- yumako, hairyclubnub
      variation.branch_generation = {
        type = "create-particle",
        particle_name = trunk_particle_2,
        offset_deviation = { { -0.8, -1.4 }, { 0.8, 1.4 } },
        initial_height = 1.7,
        initial_height_deviation = 1.5,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.02,
        only_when_visible = true
      }
      variation.branches_when_damaged = 40
      variation.branches_when_destroyed = 50
      variation.branches_when_mined_manually = 40
      variation.branches_when_mined_automatically = 20
    end

    if trunk_particle_3 then -- boompuff
      variation.branch_generation = {
        type = "create-particle",
        particle_name = trunk_particle_3,
        offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
        initial_height = 1.3,
        initial_height_deviation = 2,
        initial_vertical_speed = 0.01,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.045,
        speed_from_center_deviation = 0.02,
        only_when_visible = true
      }
      variation.branches_when_damaged = 30
      variation.branches_when_destroyed = 30
      variation.branches_when_mined_manually = 30
      variation.branches_when_mined_automatically = 15
    end

    if jellystem_particle then -- jellystem
      variation.branch_generation = {
        type = "create-particle",
        particle_name = jellystem_particle,
        offset_deviation = { { -0.65, -1 }, { 0.65, 1 } },
        initial_height = 1.7,
        initial_height_deviation = 0.8,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.02,
        frame_speed = 0.8,
        only_when_visible = true
      }
      variation.branches_when_damaged = 30
      variation.branches_when_destroyed = 40
      variation.branches_when_mined_manually = 35
      variation.branches_when_mined_automatically = 8
    end

    if spongy_particle then -- cuttlepop, slipstack, funneltrunk, lickmaw, sunnycomb
      variation.branch_generation = {
        type = "create-particle",
        particle_name = spongy_particle,
        offset_deviation = { { -0.8, -1.5 }, { 0.8, 1.5 } },
        initial_height = 1.7,
        initial_height_deviation = 0.6,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.04,
        frame_speed = 0.8,
        only_when_visible = true
      }
      if name == "funneltrunk" then
        variation.branches_when_damaged = 60
        variation.branches_when_mined_automatically = 25
      else
        variation.branches_when_damaged = 40
        variation.branches_when_mined_automatically = 16
      end
      variation.branches_when_destroyed = 40
      variation.branches_when_mined_manually = 35
    end

    if water_cane_top_particle then -- water-cane
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = water_cane_top_particle,
        probability = 0.01,
        offset_deviation = { { -0.15, -0.4 }, { 0.15, 0.4 } },
        initial_height = 1,
        initial_height_deviation = 0.01,
        initial_vertical_speed = 0.015,
        initial_vertical_speed_deviation = 0.055,
        speed_from_center = 0.025,
        speed_from_center_deviation = 0.05,
        frame_speed = 0.8,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 4
      variation.leaves_when_destroyed = 2
      variation.leaves_when_mined_manually = 2
      variation.leaves_when_mined_automatically = 1
    end

    if water_cane_particle then -- water-cane
      variation.branch_generation = {
        type = "create-particle",
        particle_name = water_cane_particle,
        initial_height = 0.6,
        only_when_visible = true
      }
      variation.branches_when_damaged = 2
      variation.branches_when_destroyed = 1
      variation.branches_when_mined_manually = 1
      variation.branches_when_mined_automatically = 1
    end

    table.insert(variations, variation)
  end
  return variations
end

virentis_plant.minor_tints = function() -- Only for leaves where most if the colour is baked in.
  return {
    { r = 255, g = 255, b = 255 },
    { r = 220, g = 255, b = 255 },
    { r = 255, g = 220, b = 255 },
    { r = 255, g = 255, b = 220 },
    { r = 220, g = 220, b = 255 },
    { r = 255, g = 220, b = 220 },
    { r = 220, g = 255, b = 220 },
  }
end

virentis_plant.very_minor_tints = function() -- Only for leaves where very little of the colour is baked in.
  return {
    { r = 255, g = 255, b = 255 },
    { r = 240, g = 255, b = 255 },
    { r = 255, g = 240, b = 255 },
    { r = 255, g = 255, b = 240 },
    { r = 240, g = 240, b = 255 },
    { r = 255, g = 240, b = 240 },
    { r = 240, g = 255, b = 240 },
  }
end

virentis_plant.extreme_minor_tints = function() -- Only for leaves where very little of the colour is baked in.
  return {
    { r = 255, g = 255, b = 255 },
    { r = 250, g = 255, b = 255 },
    { r = 255, g = 250, b = 255 },
    { r = 255, g = 255, b = 250 },
    { r = 252, g = 252, b = 255 },
    { r = 255, g = 252, b = 252 },
    { r = 252, g = 255, b = 252 },
  }
end

virentis_plant.grey_tints = function() -- Only for leaves where most if the colour is baked in.
  return {
    { r = 255, g = 255, b = 255 },
    { r = 240, g = 240, b = 240 },
    { r = 230, g = 230, b = 230 },
    { r = 220, g = 220, b = 220 },
  }
end

return virentis_plant