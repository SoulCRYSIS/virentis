data:extend(
{
  {
    type = "noise-expression",
    name = "virentis_rockpools",
    expression = "clamp(1 - 2 * abs(multioctave_noise{x = x, y = y, persistence = 0.75, seed0 = map_seed, seed1 = 1000000, octaves = 4, input_scale = 1/45}), 0, 1)\z
                  * virentis_select(rockpools_mask_noise + min(0, distance / 150 - 2) - max(0, virentis_fertile_spots_coastal_raw_default), 1.4, 3, 0.4, 0, 1) * (1 + (rockpools_mask_noise - 1) / 10)",
    local_expressions = {
      rockpools_mask_noise = "abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/75})"
    }
  },
  {
    type = "noise-expression",
    name = "virentis_rockpools_deepwater",
    expression = "virentis_select(virentis_rockpools, 1.1, 2, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_rockpools_bluewater",
    expression = "virentis_select(virentis_rockpools, 0.8, 1.1, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_rockpools_shallow",
    expression = "virentis_select(virentis_rockpools, 0.6, 0.8, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_rockpools_pitrock",
    expression = "virentis_select(virentis_rockpools, 0.05, 0.6, 0.05, 0, 1) * (elevation > 20)"
  },
})