-- Planet map generation settings
local planet_map_gen = {}
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

planet_map_gen.virentis = function()
  ---@type data.PlanetPrototypeMapGenSettings
  return {
    property_expression_names =
    {
      elevation = "virentis_elevation",
      temperature = "virentis_temperature",
      moisture = "virentis_moisture",
      aux = "virentis_aux",
      cliffiness = "virentis_cliffiness",
      cliff_elevation = "cliff_elevation_from_elevation",
    },
    cliff_settings =
    {
      name = "cliff-virentis",
      control = "virentis_cliff",
      cliff_elevation_0 = 40,
      cliff_elevation_interval = 60,
      richness = 0.80,
      cliff_smoothing = 0 -- Not critical but looks better
    },
    autoplace_controls = {
      ["virentis_plants"] = {},
      ["virentis_water"] = {},
      ["virentis_cliff"] = {},
      ["virentis_trader"] = {},
    },
    autoplace_settings = {
      ["tile"] = {
        settings = {
          ["virentis-mudland-shallow-water"] = {},
          ["virentis-mudland-shallow-water-edge"] = {},
          ["virentis-fertile-soil"] = {},
          ["virentis-fertile-soil-2"] = {},
          -- ["virentis-fertile-soil-3"] = {},
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
