data:extend(
---@type data.NoiseExpression[]
  {
    {
      type = "noise-expression",
      name = "virentis_cliffiness",
      expression = "max(0.95 * cliffiness_basic, 0.99 * (virentis_rockpools > 0))"
    },
    {
      type = "noise-expression",
      name = "virentis_elevation",
      --intended_property = "elevation",
      expression = "max(lerp(virentis_elevation_common, lowland_elevation, lowland_mask) - virentis_select(virentis_river_ridge, 0, 0.002, 0.02, 0, 1) * 180, virentis_select(virentis_town_raw, 0.1, 1, 0.1, 0, 1) * 120)",
      local_expressions =
      {
        aux_high_contrast = "clamp(10 * (virentis_aux - 0.5) + 0.5, 0, 1)",
        aux_adjustment_peak = "virentis_pos_peak(aux_high_contrast, 0.5, 0.5)",
        --lowland_elevation = "clamp(virentis_elevation_common * 0.5 + transition_adjusted_mud_noise, 0.1, 19.9)",
        lowland_elevation = "clamp(virentis_elevation_common * 0.5 + transition_adjusted_mud_noise, -1.5, 19.9) + 0.15 * transition_adjusted_mud_noise",
        lowland_mask = "virentis_select(virentis_elevation_common, -5, 20, 1, 0, 1)",
        mixed_mud_noise = "lerp(-8 + 16 * virentis_mud_basins, -12 + 16 * virentis_mud_channels, aux_high_contrast)",
        transition_adjusted_mud_noise = "mixed_mud_noise * (1 + 0.3 * aux_adjustment_peak) + 0.1 * aux_adjustment_peak"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_elevation_common",
      expression = "lerp(starting_main_blend, -1, enemies_water_knockout)",
      local_expressions =
      {
        enemies_water_knockout = "clamp(max(virentis_starting_enemies_safe, virentis_starting_enemies) * 2, 0, 1)",
        rockpool_elevation = "lerp(lerp(20, 80, virentis_rockpools < 0.3), 250, virentis_rockpools < 0.01)",
        starting_main_blend =
        "min(rockpool_elevation, lerp(terraces_combined, starting_area, clamp(1.7 - (distance / virentis_starting_area_multiplier / 500), 0, 1))) + 3 * (0.5 - abs(high_frequency))",
        starting_area =
        "max(-30 * clamp(starting_lakes * 2, 0, 1), 5 * min(virentis_starting_lowlands * 2, 1), 130 * min(virentis_starting_highlands * 2, 1), 80 * min(starting_midlands * 2, 1), 70 * min((starting_bridges - 0.5) * 3, 1)) + 6 * ridges_small_noise",
        spiral_angle =
        "virentis_starting_angle - virentis_starting_direction * (distance / virentis_starting_area_multiplier / 16 - 15)",
        starting_rotated_x = "rotate_x(x_from_start, y_from_start, spiral_angle) + virentis_wobble_x * 10",
        starting_rotated_y = "rotate_y(x_from_start, y_from_start, spiral_angle) + virentis_wobble_y * 10",
        starting_bridge =
        "min(1 - abs(starting_rotated_x / virentis_starting_area_multiplier - virentis_starting_direction * sin(starting_rotated_y / 64 / virentis_starting_area_multiplier) * 64 * virentis_starting_area_multiplier) / 110, 2 - distance / virentis_starting_area_multiplier / 700)",
        spiral_angle_b =
        "virentis_starting_angle + virentis_starting_direction * (distance / virentis_starting_area_multiplier / 16 - 15)", -- other direction
        starting_rotated_b_x = "rotate_x(x_from_start, y_from_start, spiral_angle_b) + virentis_wobble_x * 10",
        starting_rotated_b_y = "rotate_y(x_from_start, y_from_start, spiral_angle_b) + virentis_wobble_y * 10",
        --starting_bridge = "min(1 - abs(starting_rotated_x + sin(starting_rotated_y / 64) * 64) / 96, 1 - starting_rotated_y/32, 2 + starting_rotated_y/512)",
        starting_bridge_b =
        "min(1 - abs(starting_rotated_b_x / virentis_starting_area_multiplier - virentis_starting_direction * sin(starting_rotated_b_y / 64 / virentis_starting_area_multiplier) * 64 * virentis_starting_area_multiplier) / 110, 2 - distance / virentis_starting_area_multiplier / 700)",
        starting_bridges = "max(starting_bridge, starting_bridge_b)",
        high_frequency =
        "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1, octaves = 3, input_scale = 1/18}",
        --peaks = "max(starting_highlands, multioctave_noise{x = x + virentis_wobble_x * 10, y = y + virentis_wobble_y * 10, persistence = 0.7, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/60} + ridges)",
        peaks =
        "multioctave_noise{x = x + virentis_wobble_x * 10, y = y + virentis_wobble_y * 10, persistence = 0.7, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/60*slider_rescale(virentis_water_frequency, 3)} + ridges",
        peaks_terrace = "terrace{value = min(150, -25 + peaks * 250), offset = 40, width = 20, strength = 0.2}",
        ridges_small_noise =
        "abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/60})",
        --ridges = "lerp(max(-virentis_tri_ridge, starting_bridge - 0.8, -0.1 + starting_midlands / 2) * 2.3, 0, min(1, starting_lowlands * 8)) + 0.2 * ridges_small_noise - clamp(starting_lakes * 4, 0, 1)",
        --ridges = "max(-virentis_tri_ridge, starting_bridge - 0.8) * 2.3 + 0.2 * ridges_small_noise",
        --ridges = "max(-virentis_tri_ridge, starting_bridges - 0.8) * 2.3 + 0.2 * ridges_small_noise", -- bridge extends out of starting area.
        ridges =
        "max(-virentis_tri_ridge * (0.4 + var('virentis_water_size') / 3), starting_bridges - 0.8) * 2.4 + 0.2 * ridges_small_noise", -- bridge extends out of starting area.
        ridge_terrace = "terrace{value = min(80, 110 + ridges * 500), offset = 40, width = 20, strength = 0.2}",
        terraces_combined = "max(ridge_terrace, peaks_terrace, 25 + 22 * ridges)",
        starting_midlands = "max(starting_midland_landing, starting_midland_iron, starting_midland_copper)",
        starting_midland_landing =
        "starting_spot_at_angle{ angle = virentis_starting_angle + 265 * virentis_starting_direction,\z
                                                          distance = 10 * virentis_starting_area_multiplier,\z
                                                          radius = 80 * virentis_starting_area_multiplier,\z
                                                          x_distortion = virentis_wobble_x * 15,\z
                                                          y_distortion = virentis_wobble_x * 15}",
        starting_midland_iron = "starting_spot_at_angle{angle = virentis_starting_angle + 180 * virentis_starting_direction,\z
                                                      distance = 120 * virentis_starting_area_multiplier,\z
                                                      radius = 130 * virentis_starting_area_multiplier,\z
                                                      x_distortion = virentis_wobble_x * 15,\z
                                                      y_distortion = virentis_wobble_x * 15}",
        starting_midland_copper =
        "starting_spot_at_angle{angle = virentis_starting_angle + 340 * virentis_starting_direction,\z
                                                        distance = 100 * virentis_starting_area_multiplier,\z
                                                        radius = 80 * virentis_starting_area_multiplier,\z
                                                        x_distortion = virentis_wobble_x * 15,\z
                                                        y_distortion = virentis_wobble_x * 15}",
        starting_lakes = "max(starting_stone_lake, starting_opposite_lake, starting_opposite_small_lake)",
        starting_stone_lake = "starting_spot_at_angle{angle = virentis_starting_angle + 90 * virentis_starting_direction,\z
                                                    distance = 500 * virentis_starting_area_multiplier,\z
                                                    radius = 350 * virentis_starting_area_multiplier,\z
                                                    x_distortion = virentis_wobble_x * 15,\z
                                                    y_distortion = virentis_wobble_x * 15}",
        starting_opposite_lake =
        "starting_spot_at_angle{ angle = virentis_starting_angle + 270 * virentis_starting_direction,\z
                                                        distance = 500 * virentis_starting_area_multiplier,\z
                                                        radius = 450 * virentis_starting_area_multiplier,\z
                                                        x_distortion = virentis_wobble_x * 15,\z
                                                        y_distortion = virentis_wobble_x * 15}",
        starting_opposite_small_lake =
        "starting_spot_at_angle{ angle = virentis_starting_angle + 265 * virentis_starting_direction,\z
                                                              distance = 50 * virentis_starting_area_multiplier,\z
                                                              radius = 50 * virentis_starting_area_multiplier,\z
                                                              x_distortion = virentis_wobble_x * 15,\z
                                                              y_distortion = virentis_wobble_x * 15}"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_tri_ridge", -- from Space Exploration
      expression = "0.5 * ((tri_bc < tri_a) * (tri_a - tri_bc) + (tri_ac < tri_b) * (tri_b - tri_ac) + (tri_ab < tri_c) * (tri_c - tri_ab))",
      local_expressions =
      {
        tri_a = "1 + multioctave_noise{x = wobble_x, y = wobble_y, persistence = 0.65, octaves = 3, input_scale = 1/300*virentis_water_frequency, seed0 = map_seed, seed1 = 10000}",
        tri_b = "1 + multioctave_noise{x = wobble_x, y = wobble_y, persistence = 0.65, octaves = 3, input_scale = 1/300*virentis_water_frequency, seed0 = map_seed, seed1 = 20000}",
        tri_c = "1 + multioctave_noise{x = wobble_x, y = wobble_y, persistence = 0.65, octaves = 3, input_scale = 1/300*virentis_water_frequency, seed0 = map_seed, seed1 = 30000}",
        tri_ab = "max(tri_a, tri_b)",
        tri_ac = "max(tri_a, tri_c)",
        tri_bc = "max(tri_b, tri_c)",
        wobble_x = "x + virentis_wobble_x * 6",
        wobble_y = "y + virentis_wobble_y * 6"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_river_ridge", -- from Space Exploration
      expression = "0.5 * ((tri_bc < tri_a) * (tri_a - tri_bc) + (tri_ac < tri_b) * (tri_b - tri_ac) + (tri_ab < tri_c) * (tri_c - tri_ab))",
      local_expressions =
      {
        tri_a = "1 + multioctave_noise{x = wobble_x, y = wobble_y, persistence = 0.65, octaves = 3, input_scale = 1/600*virentis_water_frequency, seed0 = map_seed, seed1 = 10005}",
        tri_b = "1 + multioctave_noise{x = wobble_x, y = wobble_y, persistence = 0.65, octaves = 3, input_scale = 1/600*virentis_water_frequency, seed0 = map_seed, seed1 = 20005}",
        tri_c = "1 + multioctave_noise{x = wobble_x, y = wobble_y, persistence = 0.65, octaves = 3, input_scale = 1/600*virentis_water_frequency, seed0 = map_seed, seed1 = 30005}",
        tri_ab = "max(tri_a, tri_b)",
        tri_ac = "max(tri_a, tri_c)",
        tri_bc = "max(tri_b, tri_c)",
        wobble_x = "x + virentis_wobble_x * 6",
        wobble_y = "y + virentis_wobble_y * 6"
      }
    },
    {
      type = "noise-expression",
      name = "virentis_deep_water_level",
      expression = "-90"
    },
    {
      type = "noise-expression",
      name = "virentis_above_deep_water_mask",
      expression = "elevation > virentis_deep_water_level"
    },
    {
      type = "noise-expression",
      name = "virentis_mud_basins",
      expression = "1 - abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/10})"
    },
    {
      type = "noise-expression",
      name = "virentis_mud_channels",
      expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.5, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/9})"
    },
    {
      type = "noise-expression",
      name = "virentis_highland",
      expression = "virentis_select(virentis_elevation, 120, 1000, 0.5, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_midland",
      expression = "virentis_select(virentis_elevation, 20, 120, 0.5, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_lowland",
      expression = "virentis_select(virentis_elevation, 1, 20, 0.5, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_shallows_edge",
      expression = "virentis_select(virentis_elevation, -2, 2, 0.5, 0, 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_shallows",
      expression = "virentis_select(virentis_elevation, -5, -2, 0.5, 0, 1)"
    },
  })
