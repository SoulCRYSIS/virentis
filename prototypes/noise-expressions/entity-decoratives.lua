data:extend(
  {
    
    {
      type = "noise-expression",
      name = "virentis_funneltrunk_probability",
      expression = "min(0.02, virentis_water_plant_ramp * 0.2 * (main_box + virentis_plants_noise - 0.2) * control:virentis_plants:size) - virentis_town_raw",
      local_expressions = {
        main_box = "virentis_select(virentis_aux, 0, 0.3, 0.15, -10, 1) - 1",
      }
    },
    {
      type = "noise-expression",
      name = "virentis_slipstack_probability",
      expression = "min(0.02, virentis_water_plant_ramp * 0.2 * (main_box + virentis_plants_noise - 0.2) * control:virentis_plants:size)",
      local_expressions = {
        main_box = "virentis_select(virentis_aux, 0.7, 1, 0.1, -10, 1) - 1",
      }
    },
    {
      type = "noise-expression",
      name = "virentis_hairyclubnub_probability",
      expression = "min(0.02, virentis_water_plant_ramp * 0.2 * (main_box + virentis_plants_noise - 0.2) * control:virentis_plants:size)",
      local_expressions = {
        main_box = "virentis_select(virentis_aux, 0, 0.3, 0.15, -10, 1) - 1",
      }
    },
    {
      type = "noise-expression",
      name = "virentis_teflilly_probability",
      expression = "min(0.02, 0.1 * (main_box + virentis_plants_noise - 0.2) * control:virentis_plants:size) - virentis_town_raw",
      local_expressions = {
        main_box = "min(virentis_select(virentis_aux, 0.7, 1, 0.15, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.01, -10, 1)) - 1",
      }
    },
    {
      type = "noise-expression",
      name = "virentis_cuttlepop_probability",
      expression = "min(0.03, virentis_water_plant_ramp * 0.2 * (main_box + virentis_plants_noise_b - 0.2) * control:virentis_plants:size) - virentis_town_raw",
      local_expressions = {
        main_box = "virentis_select(virentis_aux, 0.35, 0.65, 0.1, -10, 1) - 1",
      }
    },
    {
      type = "noise-expression",
      name = "virentis_lickmaw_probability",
      expression = "min(0.02, 0.1 * (main_box + virentis_plants_noise - 0.2) * control:virentis_plants:size) - virentis_town_raw",
      local_expressions = {
        main_box = "min(virentis_select(virentis_aux, 0.7, 1, 0.15, -10, 1), virentis_select(virentis_moisture, 0.5, 0.75, 0.01, -10, 1)) - 1",
      }
    },
    {
      type = "noise-expression",
      name = "virentis_sunnycomb_probability",
      expression = "max(main_probability, invasion_tall_probability) - virentis_town_raw",
      local_expressions = {
        main_box = "virentis_select(virentis_moisture, 0, 0.25, 0.01, -10, 1) - 1",
        main_probability = "min(0.08, 0.15 * (main_box + virentis_plants_noise_b - 0.45) * control:virentis_plants:size)", -- bigger patches, denser
        invasion_tall_box = "virentis_select(virentis_moisture, 0, 0.35, 0.01, -10, 1) - 1",
        invasion_tall_probability = "min(0.05, 0.15 * (invasion_tall_box + virentis_plants_noise_b - 0.4) * control:virentis_plants:size)",
      }
    },
    {
      type = "noise-expression",
      name = "virentis_big_fulgora_rock_probability",
      expression = "virentis_town_edge * 0.02"
    },
  }
)