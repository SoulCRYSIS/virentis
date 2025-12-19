data:extend(
{
  {
    type = "noise-expression",
    name = "virentis_temperature", -- used for biome health. Lower temperature is more pale, hot more vibrant
    --intended_property = "temperature",
    expression = "10 + virentis_temperature_normalised * 10"
  },
  {
    type = "noise-expression",
    name = "virentis_temperature_normalised", -- used for biome health. Lower temperature is more pale, hot more vibrant
    expression = "clamp(0.8 * multioctave_noise{x = x + virentis_wobble_x * 6, y = y + virentis_wobble_y * 6, persistence = 0.65, octaves = 4, input_scale = 1/4, seed0 = map_seed, seed1 = 18000}, -1, 1)"
  },
})