data:extend({
    {
      type = "noise-expression",
      name = "virentis_pentapod_spawner",
      expression = "max(0.01 * virentis_starting_enemies, max(min(0.02, enemy_autoplace_base(0, 8)), min(0.001, virentis_fertile_spots_coastal * 5000 - virentis_biome_mask_green * 25000)) * (distance > 500 * virentis_starting_area_multiplier)) * virentis_above_deep_water_mask"
    },
    {
      type = "noise-expression",
      name = "virentis_pentapod_spawner_small",
      expression = "max(0.02 * virentis_starting_enemies, 0.02 * virentis_starting_enemies_safe, min(0.02, enemy_autoplace_base(0, 8)), min(0.001, virentis_fertile_spots_coastal * 5000 - virentis_biome_mask_green * 25000)) * virentis_above_deep_water_mask"
    },
  })