data:extend(
{
  {
    type = "noise-expression",
    name = "virentis_plants",
    expression = "virentis_select(virentis_elevation, 0, 1, 0.5, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_plants_noise",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 700005, octaves = 3, input_scale = 1/20 * control:virentis_plants:frequency }\z
                      * multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 200005, octaves = 3, input_scale = 1/6 * control:virentis_plants:frequency })"
  },
  {
    type = "noise-expression",
    name = "virentis_plants_noise_b",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 750005, octaves = 3, input_scale = 1/20 * control:virentis_plants:frequency }\z
                      * multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 250005, octaves = 3, input_scale = 1/6 * control:virentis_plants:frequency })"
  },
  {
    type = "noise-function",
    name = "virentis_fertile_spots_coastal_raw",
    parameters = { "seed", "spot_radius" },
    expression = "spot_noise{ x = x + wobble_noise_x * 15,\z
                              y = y + wobble_noise_y * 15,\z
                              seed0 = map_seed,\z
                              seed1 = seed,\z
                              candidate_spot_count = 80,\z
                              suggested_minimum_candidate_point_spacing = spot_radius * 4,\z
                              skip_span = 1,\z
                              skip_offset = 0,\z
                              region_size = 1024,\z
                              density_expression = 80,\z
                              spot_quantity_expression = spot_radius * spot_radius,\z
                              spot_radius_expression = spot_radius,\z
                              hard_region_target_quantity = 0,\z
                              spot_favorability_expression = 60,\z
                              basement_value = -0.5,\z
                              maximum_spot_basement_radius = spot_radius * 4}",
    local_expressions =
    {
      wobble_noise_x = "multioctave_noise{x = x, y = y, persistence = 0.5, seed0 = map_seed, seed1 = 3000000 + seed, octaves = 2, input_scale = 1/20}",
      wobble_noise_y = "multioctave_noise{x = x, y = y, persistence = 0.5, seed0 = map_seed, seed1 = 4000000 + seed, octaves = 2, input_scale = 1/20}"
    }
  },
  {
    type = "noise-expression",
    name = "virentis_fertile_spots_coastal",
    expression = "max(min(1, virentis_starting_fertile * 4),\z
                      min(exclude_middle, virentis_fertile_spots_coastal_raw_default) - max(0, -(elevation + 2) / 5) - max(0, (elevation - 10) / 5))",
    local_expressions =
    {
      exclude_middle = "(distance / virentis_starting_area_multiplier / 150) - 2.2"
    }
  },
  {
    type = "noise-expression",
    name = "virentis_fertile_spots_coastal_raw_default",
    expression = "virentis_fertile_spots_coastal_raw(1, 32)"
  },
  {
    type = "noise-expression",
    name = "virentis_fertile_solid",
    expression = "2 * abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 2000000, octaves = 2, input_scale = 1/16})\z
                  * virentis_fertile_spots_coastal - virentis_river * 5"
  },
  {
    type = "noise-expression",
    name = "virentis_plants_probability",
    expression = "min(0.2, 0.3 * (1 - virentis_plants_noise) * control:virentis_plants:size)"
  },
})