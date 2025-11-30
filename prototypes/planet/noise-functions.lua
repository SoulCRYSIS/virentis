data:extend {
  -- 1. UTILITY FUNCTIONS
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

  -- 2. COORDINATE DISTORTION (For organic shapes)
  {
    type = "noise-expression",
    name = "virentis_wobble_x",
    expression = "virentis_wobble(1000, 1/20)"
  },
  {
    type = "noise-expression",
    name = "virentis_wobble_y",
    expression = "virentis_wobble(2000, 1/20)"
  },

  -- 3. MAIN ELEVATION & WATER
  -- Controls the Ocean (1/3 map) vs Land split
  {
    type = "noise-expression",
    name = "virentis_water_level",
    expression = "-5 + 10 * slider_rescale(control:virentis_water:size, 2)" -- Slider controls how much ocean exists
  },
  {
    type = "noise-expression",
    name = "virentis_elevation_raw",
    expression = "multioctave_noise{x = x + virentis_wobble_x, y = y + virentis_wobble_y, persistence = 0.5, seed0 = map_seed, seed1 = 5000, octaves = 4, input_scale = 1/100}"
  },
  {
    type = "noise-expression",
    name = "virentis_elevation",
    -- intended_property = "elevation",
    expression = "lerp(virentis_elevation_raw * 20, -20, virentis_elevation_raw < 0) - virentis_water_level"
  },

  -- 4. BIOME SPLITTER: DESERT VS WETLAND
  -- We use "Moisture" to split the land. 
  -- Low Moisture = Desert (1/3 land). High Moisture = Wetland (2/3 land).
  {
    type = "noise-expression",
    name = "virentis_moisture",
    -- intended_property = "moisture",
    expression = "multioctave_noise{x = x + virentis_wobble_x, y = y + virentis_wobble_y, persistence = 0.6, seed0 = map_seed, seed1 = 6000, octaves = 3, input_scale = 1/200}"
  },
  {
    type = "noise-expression",
    name = "virentis_biome_desert",
    expression = "virentis_moisture < -0.33" -- Roughly 1/3 of the range
  },
  {
    type = "noise-expression",
    name = "virentis_biome_wetland",
    expression = "virentis_moisture >= -0.33"
  },

  -- 5. CLIFFINESS
  -- Desert gets extreme cliffs. Wetland gets none (flat).
  {
    type = "noise-expression",
    name = "virentis_cliffiness",
    -- intended_property = "cliffiness",
    expression = "virentis_biome_desert * 10" 
  },

  -- 6. WETLAND INTERNAL STRUCTURE
  -- "River Noise": creates snaking channels of water inside the wetland
  {
    type = "noise-expression",
    name = "virentis_wetland_rivers",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.6, seed0 = map_seed, seed1 = 7000, octaves = 3, input_scale = 1/40})"
  },
  -- "Building Plateaus": High flat ground in wetland
  {
    type = "noise-expression",
    name = "virentis_wetland_plateaus",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.6, seed0 = map_seed, seed1 = 8000, octaves = 2, input_scale = 1/80} > 0.5"
  },
  
  -- 7. SUB-BIOMES (Mudland, Illuminescense, Fungal)
  -- We use "Aux" to split the Wetland into 3 zones.
  {
    type = "noise-expression",
    name = "virentis_aux",
    -- intended_property = "aux",
    expression = "multioctave_noise{x = x + virentis_wobble_x, y = y + virentis_wobble_y, persistence = 0.6, seed0 = map_seed, seed1 = 9000, octaves = 3, input_scale = 1/150}"
  },
  -- Define the 3 sub-regions using `virentis_select` based on aux levels
  {
    type = "noise-expression",
    name = "virentis_sub_mudland",
    expression = "virentis_select(virentis_aux, -1.0, -0.33, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_sub_illuminescense",
    expression = "virentis_select(virentis_aux, -0.33, 0.33, 0.1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "virentis_sub_fungal",
    expression = "virentis_select(virentis_aux, 0.33, 1.0, 0.1, 0, 1)"
  },

  -- 8. PLANTING SPOTS (Fertile Areas)
  -- Just like Gleba's "fertile spots", we create small circles of high value inside the sub-biomes
  {
    type = "noise-expression",
    name = "virentis_fertile_spots",
    expression = "spot_noise{x = x + virentis_wobble_x, y = y + virentis_wobble_y, seed0 = map_seed, seed1 = 123, candidate_spot_count = 50, suggested_minimum_candidate_point_spacing = 64, region_size = 512, density_expression = 10, spot_quantity_expression = 100, spot_radius_expression = 20, basement_value = -1, maximum_spot_basement_radius = 32}"
  },

  -- 9. TILE PLACEMENT RULES (The Logic)
  -- This would usually go in tiles.lua `autoplace`, but here is the logic as a named expression for reference.
  
  -- DESERT: Just sand/dirt.
  -- WETLAND LOGIC:
  -- If (River Noise is low) -> Place Shallow Water
  -- Else If (Plateau Noise is high) -> Place Dry Dirt (Building Area)
  -- Else -> Place Biome Soil (Mud/Illum/Fungal)
  --    Inside Biome Soil: If (Fertile Spot > 0) -> Place Special Fertile Soil
}
