-- logics/auto-module.lua
-- This logic handles auto-inserting hidden modules into specific entities.

-- List of entities and their corresponding modules
local entity_modules = {
  ["eternal-lantern"] = "eternal-lantern-module",
  ["windmill"] = "windmill-module",
}

-- Helper to add variants (e.g., eternal-lantern-1, eternal-lantern-2, etc.)
local function add_variants(base_name, count, module_name)
  for i = 1, count do
    entity_modules[base_name .. "-" .. i] = module_name
  end
end

-- Add variants for eternal-lantern
add_variants("eternal-lantern", 3, "eternal-lantern-module")

local function process_entity(entity)
  if not (entity and entity.valid) then return end
  local module_name = entity_modules[entity.name]
  if not module_name then return end

  -- Insert module into beacon inventory
  -- Note: This assumes the entity is a beacon. If it's something else, 
  -- we might need to check other inventory types.
  local inventory = entity.get_inventory(defines.inventory.beacon_modules)
  if inventory then
    inventory.insert({ name = module_name })
  end
  
  -- Prevent player interaction
  entity.operable = false
end

local function on_created_entity(event)
  local entity = event.created_entity or event.entity
  process_entity(entity)
end

local function on_chunk_generated(event)
  local surface = event.surface
  local area = event.area
  
  local names = {}
  for name, _ in pairs(entity_modules) do
    table.insert(names, name)
  end

  local entities = surface.find_entities_filtered({
    area = area,
    name = names
  })
  
  for _, entity in pairs(entities) do
    process_entity(entity)
  end
end

local function on_pre_removed_entity(event)
  local entity = event.entity
  if not (entity and entity.valid) then return end
  local module_name = entity_modules[entity.name]
  if not module_name then return end

  -- Remove module before mining to prevent player from receiving it
  local inventory = entity.get_inventory(defines.inventory.beacon_modules)
  if inventory then
    inventory.remove({ name = module_name })
  end
end

local filters = {}
for name, _ in pairs(entity_modules) do
  table.insert(filters, { filter = "name", name = name })
end

script.on_event({
  defines.events.on_built_entity,
  defines.events.on_robot_built_entity,
  defines.events.script_raised_built,
  defines.events.script_raised_revive
}, on_created_entity, filters)

script.on_event(defines.events.on_chunk_generated, on_chunk_generated)

script.on_event({
  defines.events.on_pre_player_mined_item,
  defines.events.on_robot_pre_mined
}, on_pre_removed_entity, filters)

