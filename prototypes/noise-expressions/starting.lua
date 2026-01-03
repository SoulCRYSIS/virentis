data:extend(
---@type data.NoiseExpression[]
  {
    {
      type = "noise-expression",
      name = "virentis_starting_direction",
      expression = "-1 + 2 * (map_seed_small & 1)"
    },
    {
      type = "noise-expression",
      name = "virentis_starting_angle",
      expression = "map_seed_normalized * 3600"
    },
    {
      type = "noise-expression",
      name = "virentis_starting_area_multiplier",
      expression = "0.7"
    },
    {
      type = "noise-expression",
      name = "virentis_starting_lowlands",
      expression = "max(starting_lowland_yumako, starting_lowland_jellynut)",
      local_expressions =
      {
        starting_lowland_yumako = "starting_spot_at_angle{angle = virentis_starting_angle + 235 * virentis_starting_direction,\z
                                                          distance = 300 * virentis_starting_area_multiplier,\z
                                                          radius = 140 * virentis_starting_area_multiplier,\z
                                                          x_distortion = virentis_wobble_x * 15,\z
                                                          y_distortion = virentis_wobble_x * 15}",
        starting_lowland_jellynut = "starting_spot_at_angle{angle = virentis_starting_angle + 65 * virentis_starting_direction,\z
                                                            distance = 290 * virentis_starting_area_multiplier,\z
                                                            radius = 100 * virentis_starting_area_multiplier,\z
                                                            x_distortion = virentis_wobble_x * 15,\z
                                                            y_distortion = virentis_wobble_x * 15}",
      }
    },
    {
      type = "noise-expression",
      name = "virentis_starting_fertile",
      expression = "max(starting_nyxoleum, starting_mangroove)",
      local_expressions =
      {
        starting_nyxoleum = "starting_spot_at_angle{angle = virentis_starting_angle + 235 * virentis_starting_direction,\z
                                                          distance = 310 * virentis_starting_area_multiplier,\z
                                                          radius = 30 * virentis_starting_area_multiplier,\z
                                                          x_distortion = virentis_wobble_x * 15,\z
                                                          y_distortion = virentis_wobble_x * 15}",
        starting_mangroove = "starting_spot_at_angle{angle = virentis_starting_angle + 65 * virentis_starting_direction,\z
                                                            distance = 310 * virentis_starting_area_multiplier,\z
                                                            radius = 30 * virentis_starting_area_multiplier,\z
                                                            x_distortion = virentis_wobble_x * 15,\z
                                                            y_distortion = virentis_wobble_x * 15}",
      }
    },
    {
      type = "noise-expression",
      name = "virentis_starting_rockmalt",
      expression = "max(0, starting_spot_at_angle{ angle = virentis_starting_angle + 40 * virentis_starting_direction,\z
                                            distance = 130 * virentis_starting_area_multiplier,\z
                                            radius = 20 * virentis_starting_area_multiplier,\z
                                            x_distortion = virentis_wobble_x * 15,\z
                                            y_distortion = virentis_wobble_x * 15})"
    },
    {
      type = "noise-expression",
      name = "virentis_starting_redbloom",
      expression = "max(0, starting_spot_at_angle{ angle = virentis_starting_angle + 340 * virentis_starting_direction,\z
                                            distance = 100 * virentis_starting_area_multiplier,\z
                                            radius = 20 * virentis_starting_area_multiplier,\z
                                            x_distortion = virentis_wobble_x * 15,\z
                                            y_distortion = virentis_wobble_x * 15}"
    },
    {
      type = "noise-expression",
      name = "virentis_starting_enemies_safe",
      expression = "starting_spot_at_angle{ angle = virentis_starting_angle + 40 * virentis_starting_direction,\z
                                            distance = 210 * virentis_starting_area_multiplier,\z
                                            radius = 30 * virentis_starting_area_multiplier,\z
                                            x_distortion = virentis_wobble_x * 20,\z
                                            y_distortion = virentis_wobble_x * 20}"
    },
    {
      type = "noise-expression",
      name = "virentis_starting_enemies",
      expression = "max(starting_lowland_yumako, starting_lowland_jellynut)",
      local_expressions =
      {
        starting_lowland_yumako = "starting_spot_at_angle{angle = virentis_starting_angle + 210 * virentis_starting_direction,\z
                                                          distance = 410 * virentis_starting_area_multiplier,\z
                                                          radius = 30 * virentis_starting_area_multiplier,\z
                                                          x_distortion = virentis_wobble_x * 20,\z
                                                          y_distortion = virentis_wobble_x * 20}",
        starting_lowland_jellynut = "starting_spot_at_angle{angle = virentis_starting_angle + 30 * virentis_starting_direction,\z
                                                            distance = 410 * virentis_starting_area_multiplier,\z
                                                            radius = 30 * virentis_starting_area_multiplier,\z
                                                            x_distortion = virentis_wobble_x * 20,\z
                                                            y_distortion = virentis_wobble_x * 20}",
      }
    },
    {
      type = "noise-expression",
      name = "virentis_starting_highlands",
      expression = "max(starting_highland_main, starting_highland_small)",
      local_expressions =
      {
        starting_highland_main = "starting_spot_at_angle{angle = virentis_starting_angle + 95 * virentis_starting_direction,\z
                                                        distance = 100 * virentis_starting_area_multiplier,\z
                                                        radius = 130 * virentis_starting_area_multiplier,\z
                                                        x_distortion = virentis_wobble_x * 15,\z
                                                        y_distortion = virentis_wobble_x * 15}",
        starting_highland_small = "starting_spot_at_angle{angle = virentis_starting_angle + 40 * virentis_starting_direction,\z
                                                        distance = 130 * virentis_starting_area_multiplier,\z
                                                        radius = 65 * virentis_starting_area_multiplier,\z
                                                        x_distortion = virentis_wobble_x * 15,\z
                                                        y_distortion = virentis_wobble_x * 15}",
      }
    },
    {
      type = "noise-expression",
      name = "virentis_starting_area",
      expression = "distance_from_nearest_point{x = x, y = y, points = starting_positions} < 512"
    }
  })
