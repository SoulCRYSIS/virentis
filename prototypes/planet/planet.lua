-- Planet map generation settings
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

-- Create the actual planet prototype
data:extend({
  {
    type = "planet",
    name = "virentis",
    icon = "__virentis__/graphics/icons/misc/starmap-virentis.png",
    icon_size = 512,
    pollutant_type = "spores",
    starmap_icon = "__virentis__/graphics/icons/misc/starmap-virentis.png",
    starmap_icon_size = 512,
    gravity_pull = 10,
    distance = 15, -- Between Vulcanus (10) and Gleba (20)
    orientation = 0.25,
    magnitude = 1.0,
    order = "c[virentis]",
    subgroup = "planets",
    map_gen_settings = {
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
        name = "cliff-gleba",
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
            ["mangroove-fertile-soil"] = {},
            ["rockmalt-fertile-soil"] = {},
            ["redbloom-fertile-soil"] = {},
            ["nyxoleum-fertile-soil"] = {},
            ["tar-puddle"] = {},
            ["town-floor"] = {},
            ["virentis-deep-water"] = {},
            ["virentis-midland-cracked-lichen"] = {},
            ["virentis-midland-cracked-lichen-dull"] = {},
            ["virentis-midland-cracked-lichen-dark"] = {},
            ["virentis-midland-turquoise-bark-2"] = {},
            ["virentis-midland-turquoise-bark"] = {},
            ["virentis-midland-yellow-crust-3"] = {},
            ["virentis-midland-yellow-crust-2"] = {},
            ["virentis-midland-yellow-crust"] = {},
            ["virentis-midland-yellow-crust-4"] = {},
            ["virentis-highland-dark-rock"] = {},
            ["virentis-highland-dark-rock-2"] = {},
            ["virentis-highland-yellow-rock"] = {},
            ["virentis-lowland-olive-blubber"] = {},
            ["virentis-lowland-olive-blubber-2"] = {},
            ["virentis-lowland-olive-blubber-3"] = {},
            ["virentis-lowland-brown-blubber"] = {},
            ["virentis-lowland-pale-green"] = {},
            ["virentis-lowland-cream-cauliflower"] = {},
            ["virentis-lowland-cream-cauliflower-2"] = {},
            ["virentis-lowland-dead-skin"] = {},
            ["virentis-lowland-dead-skin-2"] = {},
            ["virentis-lowland-cream-red"] = {},
            ["virentis-lowland-red-vein"] = {},
            ["virentis-lowland-red-vein-2"] = {},
            ["virentis-lowland-red-vein-3"] = {},
            ["virentis-lowland-red-vein-4"] = {},
            ["virentis-lowland-red-vein-dead"] = {},
            ["virentis-lowland-red-infection"] = {},
            ["virentis-wetland-dead-skin"] = {},
            ["virentis-wetland-light-dead-skin"] = {},
            ["virentis-wetland-mud"] = {},
            ["virentis-wetland-mud-slime"] = {},
            ["virentis-wetland-light-mud-slime"] = {},
            ["virentis-wetland-red-tentacle"] = {},
            ["virentis-wetland-pink-tentacle"] = {},
            ["virentis-wetland-blue-slime"] = {},
          }
        },
        ["decorative"] = {
          settings = {}
        },
        ["entity"] = {
          settings = {
            ["trader-t1"] = {},
            ["eternal-lantern"] = {},
          }
        }
      }
    },
    surface_properties =
    {
      ["day-night-cycle"] = 5 * minute,
      ["magnetic-field"] = 50,
      ["solar-power"] = 30,
      pressure = 2000,
      gravity = 10
    },
    -- Using default surface render parameters
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.9)
  }
})
