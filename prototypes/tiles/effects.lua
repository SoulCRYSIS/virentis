data:extend({
  {
    type = "tile-effect",
    name = "mudland-oil-water",
    shader = "water",
    water =
    {
      shader_variation = "wetland-water",
      lightmap_alpha = 0, -- needed for water mask
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/gleba/watercaustics.png",
          width = 512,
          height = 512
        },
        {
          filename = "__virentis__/graphics/tiles/mudland-oil-water-shader.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,


      animation_speed = 1.5,
      animation_scale = { 0.8, 0.8 },
      tick_scale = 6,

      specular_lightness = { 11, 26, 5 },
      foam_color = { 21, 4, 4 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.3, 0.3 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.19, 0.25 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16,
    }
  },
  {
    type = "tile-effect",
    name = "mudland-slime",
    shader = "water",
    water =
    {
      shader_variation = "wetland-water",
      lightmap_alpha = 0, -- needed for water mask
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/gleba/watercaustics.png",
          width = 512,
          height = 512
        },
        {
          filename = "__virentis__/graphics/tiles/mudland-slime-shader.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,


      animation_speed = 1.5,
      animation_scale = { 0.8, 0.8 },
      tick_scale = 6,

      specular_lightness = { 11, 26, 5 },
      foam_color = { 21, 4, 4 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.1, 0.1 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.19, 0.25 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16,
    }
  },
  {
    type = "tile-effect",
    name = "tar-puddle",
    shader = "water",
    water =
    {
      shader_variation = "oil",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/oilNoise.png",
          width = 512,
          height = 512
        },
        {
          filename = "__virentis__/graphics/tiles/tar-puddle-shader.png",
          width = 512 * 4,
          height = 512 * 2
        },
        --gradient map for thin film effect
        {
          filename = "__space-age__/graphics/terrain/oilGradient.png",
          width = 512,
          height = 32
        },
        --specular highligts
        {
          filename = "__space-age__/graphics/terrain/oil-ocean-deep-spec.png",
          width = 512 * 4,
          height = 512 * 2
        },
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,

      specular_lightness = { 3, 3, 3 },
      foam_color = { 140, 60, 60 }, -- #4e3838ff,
      foam_color_multiplier = 0.1,

      animation_speed = 1.500,
      animation_scale = { 3, 3 },

      dark_threshold = { 2.000, 2.000 },
      reflection_threshold = { 5.00, 5.00 },
      specular_threshold = { 0.000, 0.000 },
      tick_scale = 1.000,

      near_zoom = 0.063,
      far_zoom = 0.063,
    },
  }
})
