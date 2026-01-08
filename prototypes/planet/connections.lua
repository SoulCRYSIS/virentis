local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

data:extend({
  {
    type = "space-connection",
    name = "gleba-virentis",
    subgroup = "planet-connections",
    from = "gleba",
    to = "virentis",
    order = "fa",
    length = 12500,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora)
  },
  {
    type = "space-connection",
    name = "virentis-aquilo",
    subgroup = "planet-connections",
    from = "virentis",
    to = "aquilo",
    order = "fb",
    length = 20000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
  },
})