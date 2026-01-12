local function on_init()
  remote.call(
    "fishing_dock",
    "register_fish",
    "fishing-pentapus",         -- Recipe name
    "pentapus",                         -- Entity name
    { "virentis-deep-water" }  -- Spawnable tiles
  )
end

script.on_init(on_init)