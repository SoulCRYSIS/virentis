data:extend(
{
  {
    type = "noise-expression",
    name = "virentis_aux",
    --intended_property = "aux",
    expression = "clamp(0.5 + 0.5 * lerp(aux_mutated, starting_aux, starting_radius) - min(0.2, virentis_rockpools), 0, 1)",
    local_expressions = {
      aux_pattern = "multioctave_noise{x = x + virentis_wobble_x * 15 + virentis_wobble_small_x * 5, y = y + virentis_wobble_y * 15 + virentis_wobble_small_y * 5, persistence = 0.75, octaves = 7, input_scale = 1/70, seed0 = map_seed, seed1 = 7000}",
      starting_radius = "clamp(1 - distance / virentis_starting_area_multiplier / 900, 0, 0.9)",
      starting_aux = "clamp(-starting_rotated_y / virentis_starting_area_multiplier / 200, -2, 2)",
      aux_angle = "virentis_starting_angle - virentis_starting_direction * (distance / 20 / virentis_starting_area_multiplier - 15)",
      starting_rotated_y = "rotate_y(x_from_start, y_from_start, aux_angle) + virentis_wobble_x * 10",
      aux_mutator_large = "multioctave_noise{x = x, y = y, persistence = 0.75, octaves = 4, input_scale = 1/30, seed0 = map_seed, seed1 = 8000}",
      aux_mutator_small = "virentis_cover_noise",
      aux_mutator = "aux_mutator_large + 0.1 * aux_mutator_small",
      aux_mutator_multiplier = "1 + 4 * virentis_select(aux_mutator, 1.4, 3, 0.5, 0, 1) - 0.9 * virentis_select(aux_mutator, -3, -1.4, 0.5, 0, 1)",
      aux_mutated = "clamp(aux_pattern * aux_mutator_multiplier, -3, 3)" -- makes invader pockets on middle aux, or magnfied aux.
    }
  },

  {
    type = "noise-expression",
    name = "virentis_biome_mask_green",
    expression = "aux > 0.375"
  },
  {
    type = "noise-expression",
    name = "virentis_biome_mask_red",
    expression = "aux < 0.625"
  },

  {
    type = "noise-expression",
    name = "virentis_lowland_aux_1",
    expression = "virentis_lowland * virentis_select(virentis_aux, 0, 0.3, 0.005, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_lowland_aux_2",
    expression = "virentis_lowland * virentis_select(virentis_aux, 0.3, 0.7, 0.005, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_lowland_aux_3",
    expression = "virentis_lowland * virentis_select(virentis_aux, 0.7, 1, 0.005, 0, 1)"
  },

  {
    type = "noise-expression",
    name = "virentis_shallows_edge_aux_1",
    expression = "virentis_shallows_edge * virentis_select(virentis_aux, 0, 0.3, 0.005, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_shallows_edge_aux_2",
    expression = "virentis_shallows_edge * virentis_select(virentis_aux, 0.3, 0.7, 0.005, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_shallows_edge_aux_3",
    expression = "virentis_shallows_edge * virentis_select(virentis_aux, 0.7, 1, 0.005, 0, 1)"
  },

  {
    type = "noise-expression",
    name = "virentis_shallows_aux_1",
    expression = "virentis_shallows * virentis_select(virentis_aux, 0, 0.3, 0.005, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_shallows_aux_2",
    expression = "virentis_shallows * virentis_select(virentis_aux, 0.3, 0.7, 0.005, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_shallows_aux_3",
    expression = "virentis_shallows * virentis_select(virentis_aux, 0.7, 1, 0.005, 0, 1)"
  },

  {
    type = "noise-expression",
    name = "virentis_midland_aux_1",
    expression = "virentis_midland * virentis_select(virentis_aux, 0, 0.45, 0.0025, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_midland_aux_2",
    expression = "virentis_midland * virentis_select(virentis_aux, 0.45, 0.55, 0.0025, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_midland_aux_3",
    expression = "virentis_midland * virentis_select(virentis_aux, 0.55, 1, 0.0025, 0, 1)"
  },
})