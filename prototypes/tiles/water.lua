data:extend({
  
  {
    type = "tile",
    name = "wetland-jellynut",
    icon = "__space-age__/graphics/icons/wetland-jellynut.png",
    order = "c[resource]-b[wetland-jellynut]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_fertile_spots_coastal * 5000 * (1 - gleba_biome_mask_red) * gleba_above_deep_water_mask"},
    default_cover_tile = "landfill",
    fluid = "water",
    lowland_fog = true,
    effect = "wetland-purple",
    effect_color = { 83, 42, 56 },
    effect_color_secondary = { 91, 45, 88 },
    layer_group = "water-overlay",
    particle_tints = tile_graphics.gleba_mud_water_particle_tints,
    layer_group = "water",
    layer = 3,
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-purple-tentacle.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    map_color={132, 7, 119},
    absorptions_per_second = tile_pollution.gleba_water,

    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,

    walking_sound = base_tile_sounds.walking.shallow_water,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({max_entity_count = 30, average_pause_seconds = 8}),
      tile_sounds.ambient.night_frogs,
    },

    trigger_effect = tile_trigger_effects.water_mud_trigger_effect(),
  },
  {
    type = "tile",
    name = "wetland-dead-skin",
    order = "b[wetland]-d[wetland-dead-skin]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_aux_2 + 2 * min(gleba_select(gleba_aux, 0.3, 0.7, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-grey",
    --effect_color = { 76, 70, 79 },
    --effect_color_secondary = { 76, 70, 79 },
    effect_color = { 57, 58, 73 },
    effect_color_secondary = { 76, 70, 79 },
    map_color = {r = 46, g = 45, b = 51},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 7,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-dead-skin.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.wetland,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({}),
      tile_sounds.ambient.night_insects,
    },
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = tile_pollution.gleba_water,
  },
  {
    type = "tile",
    name = "wetland-light-dead-skin",
    order = "b[wetland]-c[wetland-light-dead-skin]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_edge_aux_2 + 2 * min(gleba_select(gleba_aux, 0.3, 0.7, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-grey",
    effect_color = { 78, 75, 86 },
    effect_color_secondary = { 76, 70, 79 },
    map_color = {r = 51, g = 50, b = 56},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 7,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-dead-skin.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.wetland,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({}),
      tile_sounds.ambient.night_insects,
    },
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = tile_pollution.gleba_water,
  },
  {
    type = "tile",
    name = "wetland-green-slime",
    order = "b[wetland]-b[wetland-green-slime]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_aux_1 + 2 * min(gleba_select(gleba_aux, 0, 0.3, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-green",
    --effect_color = {50,66,66},
    --effect_color_secondary = { 49, 80, 14 },
    effect_color = {40,56,71},
    effect_color_secondary = { 39, 70, 24 },
    map_color = {25, 53, 25},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 6,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-green-slime.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.slime,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({}),
      tile_sounds.ambient.night_frogs,
    },
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = tile_pollution.gleba_water,
  },
  {
    type = "tile",
    name = "wetland-light-green-slime",
    order = "b[wetland]-a[wetland-light-green-slime]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_edge_aux_1 + 2 * min(gleba_select(gleba_aux, 0, 0.3, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-green",
    effect_color = {50,66,66},
    effect_color_secondary = { 49, 80, 14 },
    map_color = {35, 63, 35},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 6,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-green-slime.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.slime,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({}),
      tile_sounds.ambient.night_frogs,
    },
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = tile_pollution.gleba_water,
  },
  {
    type = "tile",
    name = "wetland-red-tentacle",
    order = "b[wetland]-f[wetland-red-tentacle]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_aux_3 + 2 * min(gleba_select(gleba_aux, 0.7, 2, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-pink",
    effect_color = { 69, 53, 78 },
    effect_color_secondary = { 49, 80, 14 },
    map_color = { 54, 15, 24 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 5,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-purple-tentacle.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.wetland,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds = tile_sounds.ambient.insects_deep_mud({}),
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = tile_pollution.gleba_water,
  },
  {
    type = "tile",
    name = "wetland-pink-tentacle",
    order = "b[wetland]-e[wetland-pink-tentacle]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_edge_aux_3"},
    lowland_fog = true,
    effect = "wetland-pink",
    effect_color = { 85, 64, 88 },
    effect_color_secondary = { 60, 60, 40 },
    map_color = { 64, 19, 34 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 5,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/gleba/wetland-purple-tentacle.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.wetland,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds = tile_sounds.ambient.insects_deep_mud({}),
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = tile_pollution.gleba_water,
  },
  {
    type = "tile",
    name = "wetland-blue-slime",
    order = "b[wetland]-a[wetland-blue-slime]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "6 * gleba_select(gleba_elevation, gleba_deep_water_level, -4, 0.5, 0, 1) + 5 * gleba_rockpools_bluewater"},
    lowland_fog = true,
    effect = "wetland-blue-slime",
    effect_color = {45,66,74},
    effect_color_secondary = { 49, 80, 14 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 1,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water/water1.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      empty_transitions=true,
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/shallow-water", 7, 1),
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.waterlap,
      tile_sounds.ambient.rain_on_water,
    },
    map_color = {25,49,58},
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = tile_pollution.gleba_water,
  },
  {
    type = "tile",
    name = "gleba-deep-lake",
    order = "a[deep]",
    subgroup = "gleba-water-tiles",
    collision_mask =  tile_collision_masks.water(),
    autoplace = {probability_expression = "10 * gleba_select(elevation, -500, gleba_deep_water_level, 0.5, 0, 1) + 10 * gleba_rockpools_deepwater"},
    lowland_fog = false,
    effect = "wetland-blue-slime",
    effect_color = {31,51,60},
    effect_color_secondary = { 49, 80, 14 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 1,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater1.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      empty_transitions=true,
   },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/shallow-water", 7, 1),
    landing_steps_sound = tile_sounds.landing.wet,
    ambient_sounds =
    {
      tile_sounds.ambient.waterlap,
      tile_sounds.ambient.rain_on_water,
    },
    map_color = {18,37,51},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    absorptions_per_second = tile_pollution.gleba_water,
  }
})