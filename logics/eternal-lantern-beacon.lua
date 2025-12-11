local BEACON_NAME = "eternal-lantern"
local MODULE_NAME = "eternal-lantern-module" -- Change this to your desired hidden module

local function on_created_entity(event)
  local entity = event.created_entity or event.entity
  if not (entity and entity.valid and entity.name == BEACON_NAME) then return end

  -- Insert the module into the beacon
  local inventory = entity.get_inventory(defines.inventory.beacon_modules)
  inventory.insert({ name = MODULE_NAME })

  entity.operable = false
end

local function on_pre_removed_entity(event)
  local entity = event.entity
  if not (entity and entity.valid and entity.name == BEACON_NAME) then return end

  -- Remove module directly from entity inventory BEFORE mining occurs
  local inventory = entity.get_inventory(defines.inventory.beacon_modules)
  if inventory then
    inventory.remove({ name = MODULE_NAME })
  end
end

local filter = { { filter = "name", name = BEACON_NAME } }

script.on_event(defines.events.on_built_entity, on_created_entity, filter)
script.on_event(defines.events.on_robot_built_entity, on_created_entity, filter)
script.on_event(defines.events.script_raised_built, on_created_entity, filter)
script.on_event(defines.events.script_raised_revive, on_created_entity, filter)

-- Use pre-mined events to remove the module from the entity before it's given to the player
script.on_event(defines.events.on_pre_player_mined_item, on_pre_removed_entity, filter)
script.on_event(defines.events.on_robot_pre_mined, on_pre_removed_entity, filter)
