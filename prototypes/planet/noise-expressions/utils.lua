data:extend(
  {
    {
      type = "noise-function",
      name = "virentis_pos_peak",
      parameters = { "input", "point", "range" },
      expression = "max(0, 1 - abs(input - point) / range)"
    },
    {
      type = "noise-function",
      name = "virentis_select",
      parameters = { "input", "from", "to", "slope", "min", "max" },
      expression = "clamp(min(input - (from - slope), to + slope - input) / slope, min, max)"
    },
    {
      type = "noise-function",
      name = "virentis_wobble",
      parameters = { "seed", "scale" },
      expression =
      "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = seed, octaves = 3, input_scale = scale}"
    },
    {
      type = "noise-expression",
      name = "virentis_wobble_x",
      expression = "virentis_wobble(1005, 1/20)"
    },
    {
      type = "noise-expression",
      name = "virentis_wobble_y",
      expression = "virentis_wobble(2005, 1/20)"
    },
    {
      type = "noise-expression",
      name = "virentis_wobble_small_x",
      expression = "virentis_wobble(1005, 1/6)"
    },
    {
      type = "noise-expression",
      name = "virentis_wobble_small_y",
      expression = "virentis_wobble(2005, 1/6)"
    },
    {
      type = "noise-function",
      name = "grpi", -- virentis_random_penalty_inverse, add for knockout effect
      parameters = {"survival"},
      expression = "random_penalty{x = x, y = y, seed = 1, source = 1, amplitude = 1/survival} - 1"
    },
    {
      type = "noise-expression",
      name = "virentis_decorative_knockout", -- small wavelength noise (5 tiles-ish) to make decoratives patchy
      expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1300000, octaves = 2, input_scale = 1/3}"
    },
    {
      type = "noise-expression",
      name = "virentis_decorative_subtype_mixer", -- small wavelength noise (1 tiles-ish) to make decoratives patchy
      expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1300000, octaves = 2, input_scale = 1/1}"
    },
    {
      type = "noise-expression",
      name = "virentis_decal_noise", -- positive has ridge bias, mainly for ground decals, mycelium, veins
      expression = "0.6 * multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1500, octaves = 2, input_scale = 1/16, output_scale = 0.5}\z
        + 0.3 - abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 2500, octaves = 2, input_scale = 1/20})"
    },
    {
      type = "noise-expression",
      name = "virentis_bush_noise", -- positive has ridge bias, mainly for bush-scale stalks, sceptres, cups, pita
      expression = "0.6 * multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 5500, octaves = 2, input_scale = 1/12, output_scale = 0.5}\z
        + 0.3 - abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 6500, octaves = 2, input_scale = 1/12})"
    },
    {
      type = "noise-expression",
      name = "virentis_cover_noise", -- positive has ridge bias, mainly for thicker ground cover, lettuce, splitgill
      expression = "0.6 * multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 3500, octaves = 2, input_scale = 1/10, output_scale = 0.5}\z
        + 0.3 - abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 4500, octaves = 2, input_scale = 1/16})"
    },
    {
      type = "noise-expression",
      name = "virentis_scrub_noise", -- positive has ridge bias, mainly for smaller scatter plants, cronton, wisp, desert bush
      expression = "0.6 * multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 7500, octaves = 2, input_scale = 1/8, output_scale = 0.5}\z
        + 0.3 - abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 8500, octaves = 2, input_scale = 1/8})"
    },
    {
      type = "noise-expression",
      name = "virentis_small_cover_noise",
      expression = "0.6 * multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 7500, octaves = 2, input_scale = 1/6, output_scale = 0.5}\z
        + 0.3 - abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 8500, octaves = 2, input_scale = 1/6})"
    },
    {
      type = "noise-expression",
      name = "virentis_town_region_patchy",
      expression = "0.4 * abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 21000, octaves = 2, input_scale = 1/12}) - 0.5"
    },
  })
