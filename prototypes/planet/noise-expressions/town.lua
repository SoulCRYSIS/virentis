

data:extend({
  {
    type = "noise-expression",
    name = "virentis_town_size",
    expression = "24 * control:virentis_town:size"
  },
  {
    type = "noise-expression",
    name = "virentis_starting_town",
    expression = "max(0, starting_spot_at_angle{angle = virentis_starting_angle + 95 * virentis_starting_direction,\z
                                                      distance = 100 * virentis_starting_area_multiplier,\z
                                                      radius = virentis_town_size * virentis_starting_area_multiplier,\z
                                                      x_distortion = virentis_wobble_small_x * 3 * virentis_starting_area_multiplier,\z
                                                      y_distortion = virentis_wobble_small_x * 3 * virentis_starting_area_multiplier})"
  },
  {
    type = "noise-expression",
    name = "virentis_town_raw",
    expression = "virentis_highland * spot_noise{x = x + virentis_wobble_small_x * 3,\z
                             y = y + virentis_wobble_small_y * 3,\z
                             seed0 = map_seed,\z
                             seed1 = 7777,\z
                             density_expression = virentis_select(virentis_elevation, 140, 1000, 0.5, 0, 1) - virentis_starting_area,\z
                             spot_radius_expression = virentis_town_size,\z
                             spot_quantity_expression = virentis_town_size * virentis_town_size,\z
                             spot_favorability_expression = 1,\z
                             candidate_spot_count = 8,\z
                             basement_value = 0,\z
                             suggested_minimum_candidate_point_spacing = virentis_town_size * 4,\z
                             maximum_spot_basement_radius = virentis_town_size * 2,\z
                             region_size = 600 + 400 / control:virentis_town:frequency} + virentis_starting_town"
  },
  {
    type = "noise-expression",
    name = "virentis_town_center",
    expression = "virentis_select(virentis_town_raw, 0.7, 1, 0.1, 0, 1)" 
  },
  {
    type = "noise-expression",
    name = "virentis_town_rural",
    expression = "virentis_select(virentis_town_raw, 0.3, 0.7, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_town_edge",
    expression = "virentis_select(virentis_town_raw, 0.15, 0.3, 0.1, 0, 1)"
  },
})
