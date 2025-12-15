data:extend(
  {
    {
      type = "noise-expression",
      name = "virentis_highland_1",
      expression = "virentis_highland * max(0, 1.05 + 0.1 * (1 - virentis_aux) + 0.2 * virentis_temperature_normalised)"
    },
    {
      type = "noise-expression",
      name = "virentis_highland_2",
      expression = "virentis_highland * max(0, 1.13 + 0.1 * (min(virentis_aux + 0.1, 1-virentis_aux)))"
    },
    {
      type = "noise-expression",
      name = "virentis_highland_3",
      expression = "virentis_highland * max(0, 1 + 0.1 * virentis_aux - 0.2 * virentis_temperature_normalised)"
    }
  }
)