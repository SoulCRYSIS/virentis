spot_noise{x = x,y = y,seed0 = map_seed,seed1 = 567,candidate_spot_count = 1,region_size = 64,density_expression = 1,spot_quantity_expression = 64,spot_radius_expression = 8,spot_favorability_expression = 1,basement_value = -1,suggested_minimum_candidate_point_spacing = 8,maximum_spot_basement_radius = 16}

voronoi_spot_noise{x=x, y=y, seed0=map_seed, seed1=123, grid_size=16, distance_type='manhattan', jitter=1}

(0.5 + 0.5 * 0.8 * abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 21000, octaves = 2, input_scale = 1/3})) - 1
(0.025 * ((aquilo_island_peaks > 0) + 2 * aquilo_island_peaks))

spot_noise{x = x,y = y,seed0 = map_seed,seed1 = 567,candidate_spot_count = 1,region_size = 16,density_expression = 1,spot_quantity_expression = 1,spot_radius_expression = 1,spot_favorability_expression = 1,basement_value = 0,suggested_minimum_candidate_point_spacing = 12,maximum_spot_basement_radius = 12}

spot_noise{x = x + gleba_wobble_small_x,y = y + gleba_wobble_small_y,seed0 = map_seed,seed1 = 7777,density_expression = gleba_select(gleba_elevation, 140, 1000, 0.5, 0, 1),spot_radius_expression = 24,spot_quantity_expression = 576,spot_favorability_expression = 1,candidate_spot_count = 8,basement_value = 0,maximum_spot_basement_radius = 48,region_size = 1024}

gleba_starting_circle
distance_from_nearest_point(x = x, y = y, points = starting_positions) < 300

gleba_highland * spot_noise{x = x + gleba_wobble_small_x * 5,y = y + gleba_wobble_small_y * 5,seed0 = map_seed,seed1 = 7777,density_expression = gleba_select(gleba_elevation, 140, 1000, 0.5, 0, 1) - gleba_starting_area,spot_radius_expression = 24,spot_quantity_expression = 576,spot_favorability_expression = 1,candidate_spot_count = 8,basement_value = 0,maximum_spot_basement_radius = 48,region_size = 1024} + gleba_starting_town

max(0, starting_spot_at_angle{angle = gleba_starting_angle + 95 * gleba_starting_direction,distance = 100 * gleba_starting_area_multiplier,radius = gleba_town_size * gleba_starting_area_multiplier,x_distortion = gleba_wobble_small_x * 5 * gleba_starting_area_multiplier,y_distortion = gleba_wobble_small_x * 5 * gleba_starting_area_multiplier})