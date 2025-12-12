local BEACON_NAMES = {
  ["eternal-lantern"] = true,
  ["eternal-lantern-1"] = true,
}
local MODULE_NAME = "eternal-lantern-module" -- Change this to your desired hidden module

local function on_created_entity(event)
  local entity = event.created_entity or event.entity
  if not (entity and entity.valid and BEACON_NAMES[entity.name]) then return end

  if entity.name == "eternal-lantern" then
    -- 50% chance to be replaced by variants, or whatever logic you want
    -- Actually, if we want random appearance, we should replace the entity here.
    -- Assuming we have variants 1, 2, 3...
    local variant_count = 1 -- Adjust this to how many variants you added in data stage (excluding 0)
    
    -- Randomly pick a variant (0 to variant_count)
    local variant = math.random(0, variant_count)
    
    if variant > 0 then
      local surface = entity.surface
      local position = entity.position
      local force = entity.force
      local direction = entity.direction
      
      -- Destroy the original placed entity
      entity.destroy()
      
      -- Create the variant
      entity = surface.create_entity({
        name = "eternal-lantern-" .. variant,
        position = position,
        force = force,
        direction = direction,
        fast_replace = true,
        player = event.player_index
      })
      
      if not entity then return end -- Should not happen if prototypes exist
    end
  end

  -- Insert the module into the beacon
  local inventory = entity.get_inventory(defines.inventory.beacon_modules)
  if inventory then
    inventory.insert({ name = MODULE_NAME })
  end

  entity.operable = false
end

local function on_pre_removed_entity(event)
  local entity = event.entity
  if not (entity and entity.valid and BEACON_NAMES[entity.name]) then return end

  -- Remove module directly from entity inventory BEFORE mining occurs
  local inventory = entity.get_inventory(defines.inventory.beacon_modules)
  if inventory then
    inventory.remove({ name = MODULE_NAME })
  end
end

-- Update filters to include all variants
local filters = {}
for name, _ in pairs(BEACON_NAMES) do
  table.insert(filters, { filter = "name", name = name })
end

script.on_event(defines.events.on_built_entity, on_created_entity, filters)
script.on_event(defines.events.on_robot_built_entity, on_created_entity, filters)
script.on_event(defines.events.script_raised_built, on_created_entity, filters)
script.on_event(defines.events.script_raised_revive, on_created_entity, filters)

script.on_event(defines.events.on_pre_player_mined_item, on_pre_removed_entity, filters)
script.on_event(defines.events.on_robot_pre_mined, on_pre_removed_entity, filters)
