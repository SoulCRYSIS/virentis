data:extend({
  {
    type = "noise-expression",
    name = "virentis_town_size",
    expression = "32 * control:virentis_town:size"
  },
  {
    type = "noise-expression",
    name = "virentis_town_size_scale_distance",
    expression = "min(virentis_town_size, (distance_from_nearest_point{x = x, y = y, points = starting_positions} / 48) ^ 0.5) + virentis_town_size"
  },
  {
    type = "noise-expression",
    name = "virentis_starting_town",
    expression = "max(0, starting_spot_at_angle{angle = virentis_starting_angle + 95 * virentis_starting_direction,\z
                                                      distance = 100 * virentis_starting_area_multiplier,\z
                                                      radius = virentis_town_size,\z
                                                      x_distortion = virentis_wobble_small_x * 5,\z
                                                      y_distortion = virentis_wobble_small_x * 5})"
  },
  {
    type = "noise-expression",
    name = "virentis_town_point_candidate",
    expression = "virentis_select(virentis_elevation_common, 140, 1000, 0.5, 0, 1) - virentis_starting_area"
  },
  {
    type = "noise-expression",
    name = "virentis_town_raw",
    expression = "spot_noise{x = x + virentis_wobble_small_x * 5,\z
                             y = y + virentis_wobble_small_y * 5,\z
                             seed0 = map_seed,\z
                             seed1 = 7777,\z
                             density_expression = virentis_town_point_candidate,\z
                             spot_radius_expression = virentis_town_size_scale_distance,\z
                             spot_quantity_expression = virentis_town_size_scale_distance * virentis_town_size_scale_distance,\z
                             spot_favorability_expression = virentis_town_point_candidate,\z
                             candidate_spot_count = 4,\z
                             basement_value = 0,\z
                             suggested_minimum_candidate_point_spacing = 600,\z
                             maximum_spot_basement_radius = virentis_town_size * 4,\z
                             region_size = 800 + 600 / control:virentis_town:frequency} + virentis_starting_town"
  },
  {
    type = "noise-expression",
    name = "virentis_windmill_spot",
    expression = "(spot_noise{x = x,\z
                             y = y,\z
                             seed0 = map_seed,\z
                             seed1 = 7777,\z
                             density_expression = virentis_town_point_candidate,\z
                             spot_radius_expression = 1,\z
                             spot_quantity_expression = 5,\z
                             spot_favorability_expression = virentis_town_point_candidate,\z
                             candidate_spot_count = 4,\z
                             basement_value = 0,\z
                             suggested_minimum_candidate_point_spacing = 600,\z
                             maximum_spot_basement_radius = 1,\z
                             region_size = 800 + 600 / control:virentis_town:frequency} > 0) + virentis_starting_windmill",
    local_expressions = {
      virentis_starting_windmill =
      "starting_spot_at_angle{angle = virentis_starting_angle + 95 * virentis_starting_direction,\z
                                                                            distance = 100 * virentis_starting_area_multiplier,\z
                                                                            radius = 1,\z
                                                                            x_distortion = 0,\z
                                                                            y_distortion = 0} > 0",
    },
  },
  {
    type = "noise-expression",
    name = "virentis_town_center",
    expression = "virentis_select(virentis_town_raw, 0.8, 1, 0, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_town_rural",
    expression = "virentis_select(virentis_town_raw, 0.45, 0.8, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_town_edge",
    expression = "virentis_select(virentis_town_raw, 0.3, 0.45, 0.05, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_town_border",
    expression = "virentis_select(virentis_town_raw, 0.2, 0.35, 0.05, 0, 1)"
  },
})
