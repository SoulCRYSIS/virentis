data:extend(
{
  {
    type = "noise-function",
    name = "virentis_pos_peak",
    parameters = {"input", "point", "range"},
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
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = seed, octaves = 3, input_scale = scale}"
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
})