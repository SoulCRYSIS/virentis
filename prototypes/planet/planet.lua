-- Planet map generation settings
local planet_map_gen = {}
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

planet_map_gen.virentis = function()
  ---@type data.PlanetPrototypeMapGenSettings
  return {
    property_expression_names =
    {
      elevation = "",
      temperature = "1",
      moisture = "1",
      aux = "1",
      cliffiness = "0",
      cliff_elevation = "0",
    },
    cliff_settings =
    {
      name = "cliff",
      cliff_elevation_interval = 40,
      cliff_elevation_0 = 10
    },
    autoplace_controls = {
      ["virentis_plants"] = {},
    },
    autoplace_settings = {
      ["tile"] = {
        settings = {
          ["virentis-plain-grass"] = {},
          ["virentis-deep-lake"] = {}
        }
      },
      ["decorative"] = {
        settings = {}
      },
      ["entity"] = {
        settings = {
          ["trader-t1"] = {}
        }
      }
    }
  }
end

-- Create the actual planet prototype
data:extend({
  {
    type = "planet",
    name = "virentis",
    icon = "__virentis__/graphics/icons/misc/starmap-virentis.png",
    icon_size = 512,
    starmap_icon = "__virentis__/graphics/icons/misc/starmap-virentis.png",
    starmap_icon_size = 512,
    gravity_pull = 10,
    distance = 15, -- Between Vulcanus (10) and Gleba (20)
    orientation = 0.25,
    magnitude = 1.0,
    order = "c[virentis]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen.virentis(),
    surface_properties =
    {
      ["day-night-cycle"] = 10 * minute,
      ["magnetic-field"] = 50,
      ["solar-power"] = 100,
      pressure = 1000,
      gravity = 10
    },
    -- Using default surface render parameters
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.9)
  }
})
