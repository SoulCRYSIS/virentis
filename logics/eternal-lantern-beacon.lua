local variant_count = 3 -- Adjust this to how many variants you added in data stage (excluding 0)
local beacon_names = { ["eternal-lantern"] = true }
for i = 1, variant_count do
  beacon_names["eternal-lantern-" .. i] = true
end

local beacon_name_list = {}
for name, _ in pairs(beacon_names) do
  table.insert(beacon_name_list, name)
end

local module_name = "eternal-lantern-module" -- Change this to your desired hidden module

local function process_beacon(entity, player_index)
  if not (entity and entity.valid) then return end

  if entity.name == "eternal-lantern" then
    -- 50% chance to be replaced by variants, or whatever logic you want
    -- Actually, if we want random appearance, we should replace the entity here.
    -- Assuming we have variants 1, 2, 3...

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
        player = player_index
      })

      if not entity then return end -- Should not happen if prototypes exist
    end
  end

  -- Insert the module into the beacon
  local inventory = entity.get_inventory(defines.inventory.beacon_modules)
  if inventory then
    inventory.insert({ name = module_name })
  end

  entity.operable = false
end

local function on_created_entity(event)
  local entity = event.created_entity or event.entity
  if not (entity and entity.valid and beacon_names[entity.name]) then return end
  process_beacon(entity, event.player_index)
end

local function on_chunk_generated(event)
  local surface = event.surface
  local area = event.area
  
  -- Check for the main entity and variants
  local entities = surface.find_entities_filtered({
    area = area,
    name = beacon_name_list
  })
  
  for _, entity in pairs(entities) do
    process_beacon(entity, nil)
  end
end

local function on_pre_removed_entity(event)
  local entity = event.entity
  if not (entity and entity.valid and beacon_names[entity.name]) then return end

  -- Remove module directly from entity inventory BEFORE mining occurs
  local inventory = entity.get_inventory(defines.inventory.beacon_modules)
  if inventory then
    inventory.remove({ name = module_name })
  end
end

-- Update filters to include all variants
local filters = {}
for name, _ in pairs(beacon_names) do
  table.insert(filters, { filter = "name", name = name })
end

script.on_event(defines.events.on_built_entity, on_created_entity, filters)
script.on_event(defines.events.on_robot_built_entity, on_created_entity, filters)
script.on_event(defines.events.script_raised_built, on_created_entity, filters)
script.on_event(defines.events.script_raised_revive, on_created_entity, filters)
script.on_event(defines.events.on_chunk_generated, on_chunk_generated)

script.on_event(defines.events.on_pre_player_mined_item, on_pre_removed_entity, filters)
script.on_event(defines.events.on_robot_pre_mined, on_pre_removed_entity, filters)
