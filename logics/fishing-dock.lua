local util = require("util")

local DOCK_NAME = "fishing-dock"
local BOAT_NAME = "fishing-boat"
local FISH_NAME = "raw-fish"
local RADIUS = 16
local MAX_FISH = 10

local function is_water(tile)
  return tile.collides_with("water_tile")
end

local function ensure_storage()
  if not storage.fishing_docks then storage.fishing_docks = {} end
end

local function on_built(event)
  local entity = event.created_entity or event.entity
  if not entity or not entity.valid or entity.name ~= DOCK_NAME then return end

  local surface = entity.surface
  local position = entity.position
  local tile = surface.get_tile(position)

  -- Check if placed on water
  if not is_water(tile) then
    entity.destroy({ raise_destroy = true })
    if event.player_index then
      local player = game.get_player(event.player_index)
      if player then
        player.insert({ name = DOCK_NAME, count = 1 })
        player.create_local_flying_text({ text = "Must be placed on water", position = position, color = { 1, 0, 0 } })
      end
    end
    return
  end

  ensure_storage()

  -- Spawn boat
  -- Spawn slightly offset to avoid getting stuck inside the dock collision box
  local spawn_pos = { x = position.x + 2, y = position.y + 2 }
  local check_tile = surface.get_tile(spawn_pos)
  if not is_water(check_tile) then
    spawn_pos = { x = position.x - 2, y = position.y - 2 }
  end

  local boat = surface.create_entity {
    name = BOAT_NAME,
    position = spawn_pos,
    force = entity.force
  }

  storage.fishing_docks[entity.unit_number] = {
    dock = entity,
    boat = boat
  }
end

local function on_destroy(event)
  local entity = event.entity
  if not entity or not entity.valid or entity.name ~= DOCK_NAME then return end

  ensure_storage()

  if storage.fishing_docks[entity.unit_number] then
    local data = storage.fishing_docks[entity.unit_number]
    if data.boat and data.boat.valid then
      data.boat.destroy()
    end
    storage.fishing_docks[entity.unit_number] = nil
  end
end

local function update_docks()
  ensure_storage()

  for unit_number, data in pairs(storage.fishing_docks) do
    local dock = data.dock
    local boat = data.boat

    if not dock.valid then
      storage.fishing_docks[unit_number] = nil
      if boat and boat.valid then boat.destroy() end
    else
      -- Check boat
      if not boat or not boat.valid then
        -- Respawn boat
        -- Spawn slightly offset to avoid getting stuck inside the dock collision box
        local spawn_pos = { x = dock.position.x + 2, y = dock.position.y + 2 }
        local tile = dock.surface.get_tile(spawn_pos)
        if not is_water(tile) then
          spawn_pos = { x = dock.position.x - 2, y = dock.position.y - 2 }
        end

        boat = dock.surface.create_entity {
          name = BOAT_NAME,
          position = spawn_pos,
          force = dock.force
        }
        data.boat = boat
      end

      -- Boat Logic
      if boat and boat.valid then
        -- Move boat
        
        -- Ripple effect based on movement (trust user request: speed != 0 proxy)
        -- Since we can't rely on accurate speed/moving state, we use distance moved.
        local last_pos = data.last_pos or boat.position
        local dist_moved = util.distance(boat.position, last_pos)
        
        if dist_moved > 0.01 then
            if game.tick % 20 == 0 then
                dock.surface.create_trivial_smoke{name="ironclad-ripple", position=boat.position}
            end
        end
        data.last_pos = boat.position

        -- Boat Command Logic
        if boat.commandable then
            local dist_to_dock = util.distance(boat.position, dock.position)
            
            -- Leash: If too far, come back
            if dist_to_dock > RADIUS then
                boat.commandable.set_command({
                    type = defines.command.go_to_location,
                    destination = dock.position,
                    distraction = defines.distraction.none
                })
            -- Wander if idle
            elseif not boat.commandable.has_command then
                boat.commandable.set_command({
                    type = defines.command.wander,
                    radius = 5, -- Wander in short bursts
                    distraction = defines.distraction.none
                })
            end
        end

        -- Collect fish
        local fish = dock.surface.find_entities_filtered {
          name = "fish",
          position = boat.position,
          radius = 3
        }
        for _, f in pairs(fish) do
          if f.valid then
            local f_pos = f.position
            dock.insert({ name = FISH_NAME, count = 5 })
            f.destroy()
            dock.surface.create_entity { name = "water-splash", position = f_pos }
          end
        end
      end

      -- Spawn fish logic
      if math.random() < 0.2 then -- 20% chance per second
        local nearby_fish = dock.surface.count_entities_filtered {
          name = "fish",
          position = dock.position,
          radius = RADIUS
        }
        if nearby_fish < MAX_FISH then
          -- Spawn new fish
          local angle = math.random() * 2 * math.pi
          local dist = math.random() * RADIUS
          local dx = math.cos(angle) * dist
          local dy = math.sin(angle) * dist
          local target_pos = { x = dock.position.x + dx, y = dock.position.y + dy }

          local tile = dock.surface.get_tile(target_pos)
          if is_water(tile) then
            dock.surface.create_entity { name = "fish", position = target_pos }
            dock.surface.create_entity { name = "water-splash", position = target_pos }
          end
        end
      end
    end
  end
end

-- Events
script.on_event(defines.events.on_built_entity, on_built, { { filter = "name", name = DOCK_NAME } })
script.on_event(defines.events.on_robot_built_entity, on_built, { { filter = "name", name = DOCK_NAME } })
script.on_event(defines.events.script_raised_built, on_built)

script.on_event(defines.events.on_player_mined_entity, on_destroy, { { filter = "name", name = DOCK_NAME } })
script.on_event(defines.events.on_robot_mined_entity, on_destroy, { { filter = "name", name = DOCK_NAME } })
script.on_event(defines.events.on_entity_died, on_destroy, { { filter = "name", name = DOCK_NAME } })
script.on_event(defines.events.script_raised_destroy, on_destroy)

script.on_nth_tick(60, update_docks)
