

data:extend({
  {
    type = "noise-expression",
    name = "virentis_town_size",
    expression = "40 * control:virentis_town:size"
  },
  {
    type = "noise-expression",
    name = "virentis_starting_town",
    expression = "max(0, starting_spot_at_angle{angle = virentis_starting_angle + 95 * virentis_starting_direction,\z
                                                      distance = 100 * virentis_starting_area_multiplier,\z
                                                      radius = virentis_town_size * virentis_starting_area_multiplier,\z
                                                      x_distortion = virentis_wobble_small_x * 5 * virentis_starting_area_multiplier,\z
                                                      y_distortion = virentis_wobble_small_x * 5 * virentis_starting_area_multiplier})"
  },
  {
    type = "noise-expression",
    name = "virentis_town_raw",
    expression = "virentis_highland * spot_noise{x = x + virentis_wobble_small_x * 5,\z
                             y = y + virentis_wobble_small_y * 5,\z
                             seed0 = map_seed,\z
                             seed1 = 7777,\z
                             density_expression = virentis_select(virentis_elevation, 140, 1000, 0.5, 0, 1) - virentis_starting_area,\z
                             spot_radius_expression = virentis_town_size,\z
                             spot_quantity_expression = virentis_town_size * virentis_town_size,\z
                             spot_favorability_expression = 1,\z
                             candidate_spot_count = 8,\z
                             basement_value = 0,\z
                             suggested_minimum_candidate_point_spacing = virentis_town_size * 4,\z
                             hard_region_target_quantity = 200,\z
                             maximum_spot_basement_radius = virentis_town_size * 2,\z
                             region_size = 500 + 400 / control:virentis_town:frequency} + virentis_starting_town"
  },
  {
    type = "noise-expression",
    name = "virentis_town_center",
    expression = "virentis_select(virentis_town_raw, 0.8, 1, 0, 0, 1)" 
  },
  {
    type = "noise-expression",
    name = "virentis_town_rural",
    expression = "virentis_select(virentis_town_raw, 0.4, 0.8, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_town_edge",
    expression = "virentis_select(virentis_town_raw, 0.2, 0.4, 0.05, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_town_border",
    expression = "virentis_select(virentis_town_raw, 0.1, 0.25, 0.05, 0, 1)"
  },
})
