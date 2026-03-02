local function on_init()
  if remote.interfaces["fishing_dock"] == nil then
    game.print("Fishing dock not found, skipping fishing logic")
    return
  end
  remote.call(
    "fishing_dock",
    "register_dock",
    "watchtower",
    {
      boat_entity_name = "fishing-boat",
      seperation_distance = 40,
      boat_collect_radius = 4,
      boat_spawn_offset = 8
    }
  )
  remote.call(
    "fishing_dock",
    "register_fish",
    "fishing-kraken",
    {
      spawn_entity_name = "kraken",
      spawn_tiles = { "virentis-deep-water" },
      target_entity_name = "kraken-tentacle-remain",
      min_spawn_radius = 48,
      max_spawn_radius = 64,
      max_count = 1,
      spawn_angle = 0.125,
      boat_radius = 64,
      move_to_dock_after_spawn = true,
    }
  )
  remote.call(
    "fishing_dock",
    "register_fish",
    "fishing-pentapus",
    {
      spawn_entity_name = "pentapus",
      spawn_tiles = { "virentis-deep-water" },
      target_entity_name = "pentapus",
      min_spawn_radius = 5,
      max_spawn_radius = 20,
      max_count = 5,
    }
  )
end

script.on_init(on_init)
script.on_configuration_changed(on_init)
