spot_noise{x = x,y = y,seed0 = map_seed,seed1 = 567,candidate_spot_count = 1,region_size = 64,density_expression = 1,spot_quantity_expression = 64,spot_radius_expression = 8,spot_favorability_expression = 1,basement_value = -1,suggested_minimum_candidate_point_spacing = 8,maximum_spot_basement_radius = 16}

voronoi_spot_noise{x=x, y=y, seed0=map_seed, seed1=123, grid_size=16, distance_type='manhattan', jitter=1}

(0.5 + 0.5 * 0.8 * abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 21000, octaves = 2, input_scale = 1/3})) - 1
(0.025 * ((aquilo_island_peaks > 0) + 2 * aquilo_island_peaks))

spot_noise{x = x,y = y,seed0 = map_seed,seed1 = 567,candidate_spot_count = 1,region_size = 16,density_expression = 1,spot_quantity_expression = 1,spot_radius_expression = 1,spot_favorability_expression = 1,basement_value = 0,suggested_minimum_candidate_point_spacing = 12,maximum_spot_basement_radius = 12}