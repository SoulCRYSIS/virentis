data:extend({
  {
    type = "noise-expression",
    name = "virentis_enemy_base_radius",
    expression = "sqrt(control:virentis_enemy_base:size) * (15 + 4 * enemy_base_intensity)"
  },
  {
    type = "noise-expression",
    name = "virentis_enemy_base_frequency",
    -- bases_per_km2 = 10 + 3 * enemy_base_intensity
    expression = "(0.00002 + 0.000006 * enemy_base_intensity) * control:virentis_enemy_base:frequency"
  },
  {
    type = "noise-expression",
    name = "virentis_pentapod_spawner",
    expression =
    "max(0.01 * virentis_starting_enemies, max(min(0.02, enemy_autoplace_base(0, 8)), min(0.001, virentis_fertile_spots_coastal_default * 5000 - virentis_biome_mask_green * 25000)) * (distance > 500 * virentis_starting_area_multiplier)) * virentis_above_deep_water_mask"
  },
  {
    type = "noise-expression",
    name = "virentis_pentapod_spawner_small",
    expression =
    "max(0.02 * virentis_starting_enemies, 0.02 * virentis_starting_enemies_safe, min(0.02, enemy_autoplace_base(0, 8)), min(0.001, virentis_fertile_spots_coastal_default * 5000 - virentis_biome_mask_green * 25000)) * virentis_above_deep_water_mask"
  },
})
