local BEACON_NAME = "ethernal-lantern"
local MODULE_NAME = "quality-module" -- Change this to your desired hidden module

local function on_created_entity(event)
  local entity = event.created_entity or event.entity
  if not (entity and entity.valid and entity.name == BEACON_NAME) then return end

  -- Insert the module into the beacon
  local inventory = entity.get_inventory(defines.inventory.beacon_modules)
  if inventory then
    inventory.insert({name = MODULE_NAME, count = inventory.get_bar()})
  end

  -- Make the entity inoperable so players can't open it
  entity.operable = false
end

local function on_removed_entity(event)
  local entity = event.entity
  if not (entity and entity.valid and entity.name == BEACON_NAME) then return end

  -- Clear the module inventory so the player doesn't get the hidden module back
  local inventory = entity.get_inventory(defines.inventory.beacon_modules)
  if inventory then
    inventory.clear()
  end
end

local filter = {{filter = "name", name = BEACON_NAME}}

script.on_event(defines.events.on_built_entity, on_created_entity, filter)
script.on_event(defines.events.on_robot_built_entity, on_created_entity, filter)
script.on_event(defines.events.script_raised_built, on_created_entity, filter)
script.on_event(defines.events.script_raised_revive, on_created_entity, filter)

script.on_event(defines.events.on_player_mined_entity, on_removed_entity, filter)
script.on_event(defines.events.on_robot_mined_entity, on_removed_entity, filter)
script.on_event(defines.events.on_entity_died, on_removed_entity, filter)
script.on_event(defines.events.script_raised_destroy, on_removed_entity, filter)
