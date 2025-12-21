data:extend(
  {
    -- Plant / tree regions
    -- region_box plateau potential should be: -10 to 0
    {
      type = "noise-expression",
      name = "virentis_funnel_trunk_region",
      expression = "max(main_probability, invasion_middle_probability)",
      local_expressions =
      {                                                                                                                                -- plateau potential: -10 to 0
        main_box =
        "min(virentis_select(virentis_aux, 0, 0.4, 0.05, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.01, -10, 1)) - 1",
        main_probability = "min(0.08, 0.15 * (main_box + virentis_plants_noise_b - 0.25) * control:virentis_plants:size)",                   -- bigger patches, denser
        invasion_middle_box =
        "min(virentis_select(virentis_aux, 0, 0.55, 0.05, -10, 1), virentis_select(virentis_moisture, 0.4, 0.6, 0.01, -10, 1)) - 1",
        invasion_middle_probability =
        "min(0.01, 0.1 * (invasion_middle_box + virentis_plants_noise_b - 0.5) * control:virentis_plants:size)",                             -- smaller patches, sparser
      }
    },
    {
      type = "noise-expression",
      name = "virentis_boompuff_region",
      expression = "max(main_probability, invasion_tall_probability)",
      local_expressions =
      {                                                                                                                           -- plateau potential: -10 to 0
        main_box =
        "min(virentis_select(virentis_aux, 0.5, 1, 0.05, -10, 1), virentis_select(virentis_moisture, 0.25, 0.5, 0.01, -10, 1)) - 1",
        main_probability = "min(0.1, 0.15 * (main_box + virentis_plants_noise - 0.45) * control:virentis_plants:size)",                 -- bigger patches, denser
        invasion_tall_box =
        "min(virentis_select(virentis_aux,  0.55, 1, 0.15, -10, 1), virentis_select(virentis_moisture, 0.1, 0.6, 0.01, -10, 1)) - 1",
        invasion_tall_probability =
        "min(0.05, 0.1 * (invasion_tall_box + virentis_plants_noise - 0.55) * control:virentis_plants:size)",                           -- smaller patches, sparser
      }
    },
    {
      type = "noise-expression",
      name = "virentis_teflilly_region",
      expression = "max(main_probability, invasion_middle_probability)",
      local_expressions =
      {                                                                                                                                  -- plateau potential: -10 to 0
        main_box =
        "min(virentis_select(virentis_aux, 0.3, 0.7, 0.15, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.01, -10, 1)) - 1",
        main_probability = "min(0.1, 0.15 * (main_box + virentis_plants_noise_b - 0.3) * control:virentis_plants:size)",                       -- bigger patches, denser
        invasion_middle_box =
        "min(virentis_select(virentis_aux, 0.55, 0.85, 0.15, -10, 1), virentis_select(virentis_moisture, 0.4, 0.7, 0.01, -10, 1)) - 1",
        invasion_middle_probability =
        "min(0.05, 0.15 * (invasion_middle_box + virentis_plants_noise_b - 0.55) * control:virentis_plants:size)",                             -- smaller patches, sparser
      }
    },

    --- Decorative regions
    -- region_box plateau potential should be: -10 to 0
    -- decal groups

    -- mycelium a
    -- veins a
    -- barnacles a
    -- grey-cracked-mud b
    -- cracked-mud b
    -- light-mud b
    -- dark-mud b

    -- A-pattern (ridge)
    {
      type = "noise-expression",
      name = "virentis_mycelium",
      expression = "region_box + virentis_decal_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, -1, 0.4, 0.05, -10, 1), virentis_select(virentis_moisture, 0.2, 0.45, 0.01, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_white_grass",
      expression = "region_box + virentis_decal_noise",
      local_expressions =
      {                                                                                                                             -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, -1, 0.35, 0.1, -10, 1), virentis_select(virentis_moisture, 0.25, 0.4, 0.05, -10, 1)) - 1"            -- like virentis_mycelium
      }
    },
    {
      type = "noise-expression",
      name = "virentis_veins",
      expression = "region_box + virentis_decal_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.6, 2, 0.05, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.01, -10, 1)) - 1"
      }
    },
    -- B-pattern (billows)
    {
      type = "noise-expression",
      name = "virentis_grey_cracked_mud",
      expression = "max(region_box_a, region_box_b) - virentis_decal_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box_a = "virentis_select(virentis_moisture, 0, 0.20, 0.05, -10, 1) - 1",
        region_box_b =
        "min(virentis_select(virentis_aux, -1, 0.4, 0.05, -10, 1), virentis_select(virentis_moisture, 0, 0.45, 0.05, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_cracked_mud",
      expression = "region_box - virentis_decal_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.7, 2, 0.1, -10, 1), virentis_select(virentis_moisture, 0.55, 0.6, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_cracked_mud_probability",
      expression =
      "grpi(0.05) + virentis_select(virentis_cracked_mud - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_light_mud",
      expression = "region_box - virentis_decal_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.6, 2, 0.05, -10, 1), virentis_select(virentis_moisture, 0.28, 0.47, 0.02, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_light_mud_probability",
      expression =
      "grpi(0.05) + virentis_select(virentis_light_mud - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_dark_mud",
      expression = "max(region_box_a, region_box_b) - virentis_decal_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box_a =
        "min(virentis_select(virentis_aux, -1, 0.6, 0.05, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.1, -10, 1)) - 1",
        region_box_b =
        "min(virentis_select(virentis_aux, 0.45, 0.55, 0.05, -10, 1), virentis_select(virentis_moisture, 0.3, 0.75, 0.05, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_dark_mud_probability",
      expression =
      "grpi(0.05) + virentis_select(virentis_dark_mud - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_barnacles",
      expression = "region_box - virentis_decal_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.1, 0.4, 0.1, -10, 1), virentis_select(virentis_moisture, 0, 0.2, 0.02, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_barnacle_solo",
      expression = "region_box - virentis_decal_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0, 0.45, 0.1, -10, 1), virentis_select(virentis_moisture, 0, 0.5, 0.02, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_polycephalum",
      expression = "max(region_box_a, 0.9 * region_box_b) - virentis_decal_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box_a =
        "min(virentis_select(virentis_aux, 0.25, 0.65, 0.2, -10, 1), virentis_select(virentis_moisture, 0.5, 0.7, 0.05, -10, 1)) - 1",
        region_box_b =
        "min(virentis_select(virentis_aux, 0.5, 0.75, 0.2, -10, 1), virentis_select(virentis_moisture, 0.35, 0.6, 0.05, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_coral_stunted_grey",
      expression =
      "min(0.15, virentis_select(virentis_aux, 0.45, 0.65, 0.1, -10, 1) - (virentis_elevation - 2) / 5 + 0.25 * virentis_decorative_knockout - 0.8)",
    },
    {
      type = "noise-expression",
      name = "virentis_coral_stunted",
      expression =
      "min(0.15, virentis_select(virentis_aux, 0.65, 1, 0.1, -10, 1) - (virentis_elevation - 2) / 5 + 0.25 * virentis_decorative_knockout - 0.8)",
    },

    -- cover groups

    -- yellow lettuce a
    -- lichen-decal a
    -- split-gill a
    -- lichen b
    -- shroom b
    -- green lettuce b
    -- brown cups  b

    -- A-pattern (ridge)
    {
      type = "noise-expression",
      name = "virentis_yellow_lettuce",
      expression = "region_box + 0.3 * virentis_cover_noise + 0.75 * virentis_small_cover_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.55, 2, 0.05, -10, 1), virentis_select(virentis_moisture, 0.3, 0.5, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_yellow_lettuce_cups",
      expression = "region_box + virentis_cover_noise",
      local_expressions =
      {
        region_box =
        "min(virentis_select(virentis_aux, 0.5, 2, 0.1, -10, 1), virentis_select(virentis_moisture, 0.2, 0.6, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_purple_cups",
      expression = "max(region_box_a, region_box_b) + virentis_cover_noise",
      local_expressions =
      {
        region_box_a =
        "min(virentis_select(virentis_aux, 0.2, 0.8, 0.15, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.05, -10, 1)) - 1",
        region_box_b =
        "min(virentis_select(virentis_aux, 0.6, 1, 0.15, -10, 1), virentis_select(virentis_moisture, 0.35, 0.85, 0.05, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_split_gill_dying",
      expression = "region_box + 0.5 * virentis_cover_noise + 0.6 * virentis_small_cover_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.5, 0.6, 0.1, -10, 1), virentis_select(virentis_moisture, 0.51, 0.75, 0.01, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_split_gill",
      expression = "region_box + 0.5 * virentis_cover_noise + 0.6 * virentis_small_cover_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.6, 0.85, 0.2, -10, 1), virentis_select(virentis_moisture, 0.51, 0.75, 0.01, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_split_gill_red",
      expression = "region_box + 0.5 * virentis_cover_noise + 0.6 * virentis_small_cover_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.85, 1, 0.1, -10, 1), virentis_select(virentis_moisture, 0.51, 0.75, 0.01, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_pink_lichen", -- old enemy "lichen"
      expression = "region_box + virentis_cover_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.6, 2, 0.05, -10, 1), virentis_select(virentis_moisture, 0.45, 0.75, 0.05, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_pink_lichen_probability",
      expression =
      "grpi(0.5) + virentis_select(virentis_pink_lichen - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_yellow_coral",
      expression = "region_box + virentis_cover_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0, 0.3, 0.1, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.02, -10, 1)) - 1"
      }
    },

    -- B-pattern (billows)
    {
      type = "noise-expression",
      name = "virentis_carpet_shroom", -- old enemy "shroom"
      expression = "region_box - virentis_cover_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.85, 2, 0.05, -10, 1), virentis_select(virentis_moisture, 0.6, 0.75, 0.05, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_carpet_shroom_probability",
      expression =
      "grpi(0.25) + virentis_select(virentis_carpet_shroom - clamp(virentis_decorative_knockout, 0, 1), 0.1, 2, 0.1, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_orange_lichen", -- old enemy "lichen"
      expression = "region_box - virentis_cover_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.8, 2, 0.05, -10, 1), virentis_select(virentis_moisture, 0.4, 0.55, 0.05, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_orange_lichen_probability", -- old enemy "lichen"
      expression =
      "grpi(0.25) + virentis_select(virentis_orange_lichen - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_red_lichen",
      expression = "region_box - virentis_cover_noise + virentis_temperature_normalised",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.65, 1, 0.005, -10, 1), virentis_select(virentis_moisture, 0.55, 0.75, 0.05, -10, 1), virentis_select(virentis_temperature_normalised, 0.65, 1, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_green_lettuce",
      expression = "region_box - 0.5 * virentis_cover_noise + 0.7 * virentis_small_cover_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, -1, 0.25, 0.15, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.05, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_pale_lettuce",
      expression = "region_box - 0.5 * virentis_cover_noise + 0.7 * virentis_small_cover_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.25, 0.55, 0.1, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.05, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_brown_cup",
      expression = "max(region_box_a, region_box_b) - virentis_cover_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box_a =
        "min(virentis_select(virentis_aux, -1, 0.55, 0.1, -10, 1), virentis_select(virentis_moisture, 0, 0.3, 0.05, -10, 1)) - 1",
        region_box_b =
        "min(virentis_select(virentis_aux, 0.1, 0.4, 0.1, -10, 1), virentis_select(virentis_moisture, 0, 0.5, 0.05, -10, 1)) - 1"
      }
    },

    -- bush groups

    -- honeycomb a
    -- brambles a
    -- grapes a
    -- pink-phalanges a
    -- green pita a
    -- red pita b
    -- fuchia pita b
    -- green cups b
    -- black scepter b

    -- A-pattern (ridge)
    {
      type = "noise-expression",
      name = "virentis_honeycomb",
      expression = "region_box + virentis_bush_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.8, 2, 0.1, -10, 1), virentis_select(virentis_moisture, 0.1, 0.35, 0.05, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_bramble_vines",
      expression = "region_box + virentis_bush_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.6, 2, 0.1, -10, 1), virentis_select(virentis_moisture, 0.4, 0.65, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_bramble_grapes",
      expression = "region_box + virentis_bush_noise",
      local_expressions =
      { -- plateau potential: -10 to 00
        region_box =
        "min(virentis_select(virentis_aux, 0.65, 2, 0.1, -10, 1), virentis_select(virentis_moisture, 0.35, 0.55, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_bramble_grapes_vibrant",
      expression = "region_box + virentis_bush_noise",
      local_expressions =
      { -- plateau potential: -10 to 00
        region_box =
        "min(virentis_select(virentis_aux, 0.65, 2, 0.1, -10, 1), virentis_select(virentis_moisture, 0.55, 0.75, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_pink_phalanges",
      expression = "region_box + virentis_bush_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.30, 0.8, 0.2, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_green_pita",
      expression = "region_box + virentis_bush_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, -1, 0.5, 0.1, -10, 1), virentis_select(virentis_moisture, 0.35, 0.5, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_green_pita_probability",
      expression =
      "grpi(0.5) + virentis_select(virentis_green_pita - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },

    -- B-pattern (billows)
    {
      type = "noise-expression",
      name = "virentis_red_pita",
      expression = "region_box - virentis_bush_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.6, 0.7, 0.1, -10, 1), virentis_select(virentis_moisture, 0.25, 0.35, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_red_pita_probability",
      expression = "grpi(0.5) + virentis_select(virentis_red_pita - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_fuchsia_pita",
      expression = "grpi(0.5) + max(virentis_teflilly_region, region_box - virentis_bush_noise)",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.35, 0.75, 0.05, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.05, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_black_sceptre",
      expression = "max(region_box_a, region_box_b) - virentis_bush_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box_a =
        "min(virentis_select(virentis_aux, -1, 0.35, 0.1, -10, 1), virentis_select(virentis_moisture, 0.2, 0.55, 0.05, -10, 1)) - 1",
        region_box_b =
        "min(virentis_select(virentis_aux, -1, 0.5, 0.05, -10, 1), virentis_select(virentis_moisture, 0.25, 0.5, 0.05, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_green_cup",
      expression = "region_box - virentis_bush_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, -1, 0.35, 0.1, -10, 1), virentis_select(virentis_moisture, 0.45, 0.75, 0.15, -10, 1)) - 1"
      }
    },

    -- scrub groups

    -- cronton a
    -- green bush mini a
    -- wispy-lichen a
    -- red desert bush a
    -- white desert bush b
    -- corals b
    -- green pita mini b
    -- red asterisk b

    -- A-pattern (ridge)
    {
      type = "noise-expression",
      name = "virentis_green_cronton",
      expression = "region_box + virentis_scrub_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.25, 0.45, 0.1, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_green_cronton_probability",
      expression =
      "grpi(0.5) + virentis_select(virentis_green_cronton - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_green_bush",
      expression = "region_box + virentis_scrub_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, -1, 0.3, 0.1, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_green_bush_probability",
      expression =
      "grpi(0.5) + virentis_select(virentis_green_bush - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_wispy_lichen",
      expression = "region_box + virentis_scrub_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, -1, 0.4, 0.1, -10, 1), virentis_select(virentis_moisture, 0.25, 0.45, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_red_desert_bush",
      expression = "region_box + virentis_scrub_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.4, 0.8, 0.1, -10, 1), virentis_select(virentis_moisture, 0.2, 0.45, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_red_desert_bush_probability",
      expression =
      "grpi(0.5) + virentis_select(virentis_red_desert_bush - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },

    -- B-pattern (billows)
    {
      type = "noise-expression",
      name = "virentis_white_desert_bush",
      expression = "max(region_box_a, region_box_b) - virentis_scrub_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box_a =
        "min(virentis_select(virentis_aux, 0.35, 2, 0.1, -10, 1), virentis_select(virentis_moisture, 0, 0.25, 0.05, -10, 1)) - 1",
        region_box_b =
        "min(virentis_select(virentis_aux, 0.35, 0.55, 0.1, -10, 1), virentis_select(virentis_moisture, 0.25, 0.55, 0.05, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_white_desert_bush_probability",
      expression =
      "grpi(0.5) + virentis_select(virentis_white_desert_bush - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_corals",
      expression = "region_box - virentis_scrub_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.65, 2, 0.35, -10, 1), virentis_select(virentis_moisture, 0.65, 0.8, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_green_pita_mini",
      expression = "region_box - virentis_scrub_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, -1, 0.5, 0.1, -10, 1), virentis_select(virentis_moisture, 0.2, 0.4, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_green_pita_mini_probability",
      expression =
      "grpi(0.5) + virentis_select(virentis_green_pita_mini - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_red_asterisk",
      expression = "region_box - virentis_scrub_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.85, 2, 0.1, -10, 1), virentis_select(virentis_moisture, 0.1, 0.55, 0.1, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_curly_orange_roots",
      expression = "max(region_box_a - virentis_temperature_normalised, region_box_b + virentis_plants_noise_b)",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box_a =
        "min(virentis_select(virentis_aux, 0.75, 2, 0.1, -10, 1), virentis_select(virentis_moisture, 0.3, 0.5, 0.05, -10, 1)) - 1",
        region_box_b =
        "min(virentis_select(virentis_aux, 0.6, 0.75, 0.15, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.05, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_nerve_veins",
      expression = "region_box + virentis_temperature_normalised",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box =
        "min(virentis_select(virentis_aux, 0.7, 2, 0.1, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.05, -10, 1)) - 1",
      }
    },

    {
      type = "noise-expression",
      name = "virentis_clubnub_grass",
      expression = "region_box + virentis_plants_noise",
      local_expressions =
      {
        region_box =
        "min(virentis_select(virentis_aux, 0, 0.3, 0.15, -10, 1), virentis_water_plant_ramp, virentis_elevation < 2) - 1",
      }
    },
    {
      type = "noise-expression",
      name = "virentis_green_carpet_grass_probability",
      expression = "grpi(0.3) + 0.3 * virentis_select(virentis_clubnub_grass, 0.7, 2, 0.2, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_green_hairy_grass_probability",
      expression = "grpi(0.5) + 0.8 * virentis_select(virentis_clubnub_grass, 0.8, 2, 0.2, 0, 1)"
    },


    -- B-pattern (billows)
    {
      type = "noise-expression",
      name = "virentis_iron_stromatolite",
      expression = "region_box - virentis_scrub_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box = "virentis_select(virentis_aux, 0.6, 2, 0.1, -10, 1) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_copper_stromatolite",
      expression = "region_box - virentis_scrub_noise",
      local_expressions =
      { -- plateau potential: -10 to 0
        region_box = "virentis_select(virentis_aux, -1, 0.4, 0.1, -10, 1) - 1"
      }
    },

    -- Gleba decorations
    {
      type = "noise-expression",
      name = "virentis_red_lichen_decal_probability",
      expression = "grpi(0.3) + virentis_select(virentis_red_lichen - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.4, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_barnacles_decal_probability",
      expression = "grpi(0.2) + virentis_select(virentis_white_grass - clamp(virentis_decorative_knockout, 0, 1), 0.5, 2, 0.5, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_black_sceptre_probability",
      expression = "grpi(0.7) + virentis_water_plant_ramp * virentis_select(virentis_corals - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_blood_grape_probability",
      expression = "grpi(0.8) + virentis_select(virentis_bramble_vines - clamp(virentis_decorative_knockout, 0, 1), 0.0, 0.4, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_blood_grape_vibrant_probability",
      expression = "grpi(0.4) + virentis_select(virentis_bramble_grapes - clamp(virentis_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_brambles_probability",
      expression = "grpi(0.5) + virentis_select(virentis_veins - clamp(virentis_decorative_knockout, 0, 1), 0.3, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_brown_cup_probability",
      expression = "grpi(0.4) + virentis_select(virentis_bramble_grapes_vibrant - clamp(virentis_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_coral_land_probability",
      expression = "grpi(0.7) + virentis_select(virentis_wispy_lichen - 0.5 * clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_coral_stunted_probability",
      expression = "min(0.2, virentis_coral_stunted)",
    },
    {
      type = "noise-expression",
      name = "virentis_coral_stunted_grey_probability",
      expression = "virentis_coral_stunted_grey",
    },
    {
      type = "noise-expression",
      name = "virentis_coral_water_probability",
      expression = "grpi(0.5) + virentis_select(virentis_corals - clamp(virentis_decorative_knockout, 0, 1), 0.3, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_curly_roots_grey_probability",
      expression = "grpi(0.1) + virentis_select(virentis_curly_orange_roots, 0.5, 2, 0.5, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_curly_roots_orange_probability",
      expression = "grpi(0.6) + virentis_select(virentis_barnacle_solo - 0.5 * clamp(virentis_decorative_knockout, 0, 1), 0.6, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_fuchsia_pita_probability",
      expression = "grpi(0.7) + virentis_select(virentis_fuchsia_pita - clamp(virentis_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_gleba_spawner_slime_probability",
      expression = "min(0.2, virentis_coral_stunted)",
    },
    {
      type = "noise-expression",
      name = "virentis_green_cup_probability",
      expression = "grpi(0.6) + virentis_select(virentis_green_cup - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.2, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_green_lettuce_lichen_1x1_probability",
      expression = "grpi(0.3) + virentis_select(virentis_green_lettuce - 0.7 * clamp(virentis_decorative_knockout, 0, 1), -0.5, 0.1, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_green_lettuce_lichen_3x3_probability",
      expression = "grpi(0.3) + virentis_select(virentis_green_lettuce - 0.8 * clamp(virentis_decorative_knockout, 0, 1), 0.1, 0.4, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_green_lettuce_lichen_6x6_probability",
      expression = "grpi(0.3) + virentis_select(virentis_green_lettuce - 0.9 * clamp(virentis_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_green_lettuce_lichen_water_1x1_probability",
      expression = "grpi(0.3) + virentis_water_plant_ramp * virentis_select(virentis_green_lettuce - 0.7 * clamp(virentis_decorative_knockout, 0, 1), -0.5, 0.1, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_green_lettuce_lichen_water_3x3_probability",
      expression = "grpi(0.3) + virentis_water_plant_ramp * virentis_select(virentis_green_lettuce - 0.8 * clamp(virentis_decorative_knockout, 0, 1), 0.1, 0.4, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_green_lettuce_lichen_water_6x6_probability",
      expression = "grpi(0.3) + virentis_water_plant_ramp * virentis_select(virentis_green_lettuce - 0.9 * clamp(virentis_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_grey_cracked_mud_decal_probability",
      expression = "grpi(0.08) + virentis_select(virentis_grey_cracked_mud - clamp(virentis_decorative_knockout, 0, 1), 0.1, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_honeycomb_fungus_probability",
      expression = "grpi(0.7) + min(virentis_decorative_subtype_mixer, virentis_select(virentis_honeycomb, 0.3, 2, 0.1, 0, 1))",
    },
    {
      type = "noise-expression",
      name = "virentis_honeycomb_fungus_1x1_probability",
      expression = "grpi(0.7) + min(virentis_decorative_subtype_mixer, virentis_select(virentis_honeycomb, 0.3, 2, 0.1, 0, 1))",
    },
    {
      type = "noise-expression",
      name = "virentis_honeycomb_fungus_decayed_probability",
      expression = "grpi(0.4) + min(virentis_decorative_subtype_mixer, virentis_select(virentis_honeycomb, 0, 0.4, 0.1, 0, 1))",
    },
    {
      type = "noise-expression",
      name = "virentis_iron_stromatolite_probability",
      expression = "2 * virentis_boompuff_region",
    },
    {
      type = "noise-expression",
      name = "virentis_knobbly_roots_orange_probability",
      expression = "2 * virentis_funnel_trunk_region",
    },
    {
      type = "noise-expression",
      name = "virentis_matches_small_probability",
      expression = "grpi(0.6) + virentis_select(region_box + 0.3 * virentis_scrub_noise + 0.7 * virentis_temperature_normalised - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)",
      local_expressions =
      {
        region_box = "min(virentis_select(virentis_aux, 0.65, 2, 0.05, -10, 1), virentis_select(virentis_moisture, 0.25, 0.55, 0.01, -10, 1), virentis_select(virentis_temperature_normalised, 0.5, 2, 0.3, -10, 1)) - 1"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_mycelium_probability",
      expression = "grpi(0.5) + virentis_select(virentis_mycelium - clamp(virentis_decorative_knockout, 0, 1), 0.1, 2, 0.2, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_nerve_roots_dense_probability",
      expression = "grpi(0.2) + virentis_select(virentis_nerve_veins + virentis_temperature_normalised  - clamp(virentis_decorative_knockout, 0, 1), 0.6, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_nerve_roots_sparse_probability",
      expression = "grpi(0.2) + virentis_select(virentis_nerve_veins + virentis_temperature_normalised  - clamp(virentis_decorative_knockout, 0, 1), 0.2, 0.6, 0.2, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_pale_lettuce_lichen_1x1_probability",
      expression = "grpi(0.2) + virentis_select(virentis_pale_lettuce - 0.7 * clamp(virentis_decorative_knockout, 0, 1), -0.6, -0.1, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_pale_lettuce_lichen_3x3_probability",
      expression = "grpi(0.2) + virentis_select(virentis_pale_lettuce - 0.8 * clamp(virentis_decorative_knockout, 0, 1), -0.2, 0.4, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_pale_lettuce_lichen_6x6_probability",
      expression = "grpi(0.3) + virentis_select(virentis_pale_lettuce - 0.9 * clamp(virentis_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_pale_lettuce_lichen_cups_1x1_probability",
      expression = "0",
    },
    {
      type = "noise-expression",
      name = "virentis_pale_lettuce_lichen_cups_3x3_probability",
      expression = "grpi(0.3) + virentis_water_plant_ramp * virentis_select(virentis_purple_cups - 0.7 * clamp(virentis_decorative_knockout, 0, 1), -0.5, -0.1, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_pale_lettuce_lichen_cups_6x6_probability",
      expression = "grpi(0.2) + virentis_water_plant_ramp * virentis_select(virentis_purple_cups - 0.8 * clamp(virentis_decorative_knockout, 0, 1), -0.1, 0.2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_pale_lettuce_lichen_water_1x1_probability",
      expression = "grpi(0.1) + virentis_water_plant_ramp * virentis_select(virentis_pale_lettuce - 0.7 * clamp(virentis_decorative_knockout, 0, 1), -0.5, 0.1, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_pale_lettuce_lichen_water_3x3_probability",
      expression = "grpi(0.2) + virentis_water_plant_ramp * virentis_select(virentis_pale_lettuce - 0.8 * clamp(virentis_decorative_knockout, 0, 1), 0.1, 0.5, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_pale_lettuce_lichen_water_6x6_probability",
      expression = "grpi(0.3) + virentis_water_plant_ramp * virentis_select(virentis_pale_lettuce - 0.9 * clamp(virentis_decorative_knockout, 0, 1), 0.5, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_pink_lichen_decal_probability",
      expression = "virentis_pink_lichen_probability",
    },
    {
      type = "noise-expression",
      name = "virentis_pink_phalanges_probability",
      expression = "grpi(0.6) + virentis_select(virentis_pink_phalanges - clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_polycephalum_balloon_probability",
      expression = "virentis_select(virentis_polycephalum - clamp(-virentis_decorative_knockout, 0, 1), 0.9, 2, 0.2, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_polycephalum_slime_probability",
      expression = "grpi(0.7) + virentis_select(virentis_brown_cup - clamp(virentis_decorative_knockout, 0, 1), 0.6, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_red_nerve_roots_veins_dense_probability",
      expression = "0",
    },
    {
      type = "noise-expression",
      name = "virentis_red_nerve_roots_veins_sparse_probability",
      expression = "0",
    },
    {
      type = "noise-expression",
      name = "virentis_purple_nerve_roots_veins_dense_probability",
      expression = "0",
    },
    {
      type = "noise-expression",
      name = "virentis_purple_nerve_roots_veins_sparse_probability",
      expression = "0",
    },
    {
      type = "noise-expression",
      name = "virentis_cream_nerve_roots_veins_dense_probability",
      expression = "0",
    },
    {
      type = "noise-expression",
      name = "virentis_cream_nerve_roots_veins_sparse_probability",
      expression = "0",
    },
    {
      type = "noise-expression",
      name = "virentis_solo_barnacle_probability",
      expression = "grpi(0.6) + virentis_select(virentis_barnacle_solo - 0.5 * clamp(virentis_decorative_knockout, 0, 1), 0.6, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_split_gill_1x1_probability",
      expression = "grpi(0.5) + virentis_select(0.4 + virentis_split_gill + 0.2 * virentis_decorative_knockout, -0.5, 0.2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_split_gill_2x2_probability",
      expression = "grpi(0.6) + virentis_select(0.4 + virentis_split_gill + 0.3 * virentis_decorative_knockout, 0.2, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_split_gill_dying_1x1_probability",
      expression = "grpi(0.5) + virentis_select(0.4 + virentis_split_gill_dying + 0.2 * virentis_decorative_knockout, -0.5, 0.2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_split_gill_dying_2x2_probability",
      expression = "grpi(0.6) + virentis_select(0.4 + virentis_split_gill_dying + 0.3 * virentis_decorative_knockout, 0.2, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_split_gill_red_1x1_probability",
      expression = "grpi(0.5) + virentis_select(0.4 + virentis_split_gill_red + 0.2 * virentis_decorative_knockout, -0.5, 0.2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_split_gill_red_2x2_probability",
      expression = "grpi(0.6) + virentis_select(0.4 + virentis_split_gill_red + 0.3 * virentis_decorative_knockout, 0.2, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_veins_probability",
      expression = "grpi(0.5) + virentis_select(virentis_veins - clamp(virentis_decorative_knockout, 0, 1), -0.1, 0.3, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_veins_small_probability",
      expression = "grpi(0.5) + virentis_select(virentis_veins - clamp(virentis_decorative_knockout, 0, 1), 0.3, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_wispy_lichen_probability",
      expression = "grpi(0.7) + virentis_select(virentis_wispy_lichen - 0.5 * clamp(virentis_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_white_carpet_grass_probability",
      expression = "grpi(0.2) + virentis_select(virentis_white_grass - clamp(virentis_decorative_knockout, 0, 1), 0.5, 2, 0.5, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_yellow_coral_probability",
      expression = "grpi(0.2) + virentis_select(virentis_yellow_coral - 0.5 * clamp(virentis_decorative_knockout, 0, 1), 0.4, 2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_yellow_lettuce_lichen_1x1_probability",
      expression = "grpi(0.5) + virentis_select(virentis_yellow_lettuce - 0.6 * clamp(virentis_decorative_knockout, 0, 1), -0.6, -0.1, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_yellow_lettuce_lichen_3x3_probability",
      expression = "grpi(0.5) + virentis_select(virentis_yellow_lettuce - 0.7 * clamp(virentis_decorative_knockout, 0, 1), 0.-0.1, 0.3, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_yellow_lettuce_lichen_6x6_probability",
      expression = "grpi(0.5) + virentis_select(virentis_yellow_lettuce - 0.8 * clamp(virentis_decorative_knockout, 0, 1), 0.3, 10, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_yellow_lettuce_lichen_cups_1x1_probability",
      expression = "grpi(0.5) + virentis_select(virentis_yellow_lettuce - 0.8 * clamp(virentis_decorative_knockout, 0, 1), 0.3, 10, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_yellow_lettuce_lichen_cups_3x3_probability",
      expression = "grpi(0.3) + virentis_select(virentis_yellow_lettuce_cups - 0.7 * clamp(virentis_decorative_knockout, 0, 1), -0.5, -0.2, 0.1, 0, 1)",
    },
    {
      type = "noise-expression",
      name = "virentis_yellow_lettuce_lichen_cups_6x6_probability",
      expression = "grpi(0.2) + virentis_select(virentis_yellow_lettuce_cups - 0.8 * clamp(virentis_decorative_knockout, 0, 1), -0.2, 0.2, 0.1, 0, 1)",
    },
    -- Town
    {
      type = "noise-expression",
      name = "virentis_fulgoran_ruin_tiny_probability",
      expression = "virentis_town_rural * 0.05"
    },
    {
      type = "noise-expression",
      name = "virentis_fulgoran_gravewort_probability",
      expression = "max(virentis_town_center * 0.1, virentis_town_rural * 0.05)"
    },
    {
      type = "noise-expression",
      name = "virentis_tiny_fulgora_rock_probability",
      expression = "(virentis_town_raw - virentis_town_center) * 0.05"
    },
    {
      type = "noise-expression",
      name = "virentis_small_fulgora_rock_probability",
      expression = "virentis_town_edge * 0.05"
    },
    -- Rockmalt
    {
      type = "noise-expression",
      name = "virentis_rockmalt_decorate_area",
      expression = "(virentis_highland - virentis_starting_town) * virentis_fertile_spots_coastal_raw(2) * 50000 - 25000"
    },
    {
      type = "noise-expression",
      name = "virentis_tiny_volcanic_rock_probability",
      expression = "virentis_rockmalt_decorate_area * 0.05"
    },
    {
      type = "noise-expression",
      name = "virentis_small_volcanic_rock_probability",
      expression = "virentis_rockmalt_decorate_area * 0.03"
    },
    {
      type = "noise-expression",
      name = "virentis_medium_volcanic_rock_probability",
      expression = "virentis_rockmalt_decorate_area * 0.01"
    },
    {
      type = "noise-expression",
      name = "virentis_crater_small_probability",
      expression = "virentis_rockmalt_decorate_area * 0.03"
    },
    {
      type = "noise-expression",
      name = "virentis_vulcanus_pita_probability",
      expression = "spot_noise{x = x + virentis_wobble_small_x,\z
                             y = y + virentis_wobble_small_y,\z
                             seed0 = map_seed,\z
                             seed1 = 7777,\z
                             density_expression = virentis_rockmalt_decorate_area,\z
                             spot_radius_expression = 6,\z
                             spot_quantity_expression = 10,\z
                             spot_favorability_expression = 1,\z
                             candidate_spot_count = 10,\z
                             basement_value = 0,\z
                             suggested_minimum_candidate_point_spacing = 12,\z
                             maximum_spot_basement_radius = 12,\z
                             region_size = 32}"
    },
  })
