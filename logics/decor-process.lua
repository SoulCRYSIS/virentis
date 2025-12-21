-- logics/variant-switcher.lua
-- This logic handles switching a base entity with a random variant upon creation.

-- List of base entities and their variant counts (excluding 0)
local variants_to_switch = {
  ["eternal-lantern"] = 3
}

local module_to_insert = {
  ["eternal-lantern"] = "eternal-lantern-module",
  ["windmill"] = "windmill-module",
}

local random_rotate = {
  ["town-mortar-turret"] = "orientation",
  ["town-tesla-turret"] = "4way",
}

local to_process = {
  "eternal-lantern",
  "windmill",
  "town-mortar-turret",
  "town-tesla-turret",
}

local function apply_variant(event)
  local entity = event.created_entity or event.entity
  if not (entity and entity.valid) then return end
  
  local variant_count = variants_to_switch[entity.name]

  -- 0 means keep the base variant
  local variant = 0
  if variant_count then
    variant = math.random(0, variant_count)
  end

  local name = entity.name

  ---@type LuaEntity
  local new_entity
  if variant == 0 then 
    new_entity = entity
  else
    local surface = entity.surface
    local position = entity.position
    local force = entity.force
    local direction = entity.direction
    local player_index = event.player_index

    -- Destroy the original entity
    entity.destroy()

    -- Create the variant
    new_entity = surface.create_entity({
      name = name .. "-" .. variant,
      position = position,
      force = force,
      direction = direction,
      fast_replace = true,
      player = player_index,
    })
  end

  -- If this was created from map generation, make it non-minable
  if event.is_from_map then
    new_entity.minable = false
  end

  local module_name = module_to_insert[name]
  if module_name then
    local inventory = new_entity.get_inventory(defines.inventory.beacon_modules)
    inventory.insert({ name = module_name })
    new_entity.operable = false
  end

  if random_rotate[name] then
    if random_rotate[name] == "orientation" then
      new_entity.orientation = math.random()
    elseif random_rotate[name] == "4way" then
      local directions = { defines.direction.north, defines.direction.east, defines.direction.south, defines.direction.west }
      new_entity.direction = directions[math.random(1, 4)]
    end
  end
end

local function on_chunk_generated(event)
  local surface = event.surface
  local area = event.area
  
  for _, base_name in ipairs(to_process) do
    local entities = surface.find_entities_filtered({
      area = area,
      name = base_name
    })
    
    for _, entity in ipairs(entities) do
      -- Simulate built event for chunk generated entities
      apply_variant({
        entity = entity,
        is_from_map = true,
      })
    end
  end
end

local filters = {}
for _, name in ipairs(to_process) do
  table.insert(filters, { filter = "name", name = name })
end

script.on_event(defines.events.on_built_entity, apply_variant, filters)
script.on_event(defines.events.on_robot_built_entity, apply_variant, filters)
script.on_event(defines.events.script_raised_built, apply_variant, filters)
script.on_event(defines.events.script_raised_revive, apply_variant, filters)

script.on_event(defines.events.on_chunk_generated, on_chunk_generated)

local function remove_module(event)
  local entity = event.entity
  if not (entity and entity.valid) then return end
  local module_name = module_to_insert[entity.name]
  if module_name then
    local inventory = entity.get_inventory(defines.inventory.beacon_modules)
    if inventory then
      inventory.remove({ name = module_name })
    end
  end
end

local remove_module_filters = {}
for name, _ in pairs(module_to_insert) do
  table.insert(remove_module_filters, { filter = "name", name = name })
  local variant_count = variants_to_switch[name]
  if variant_count then
    for i = 1, variant_count do
      table.insert(remove_module_filters, { filter = "name", name = name .. "-" .. i })
    end
  end
end

script.on_event(defines.events.on_pre_player_mined_item, remove_module, remove_module_filters)
script.on_event(defines.events.on_robot_pre_mined, remove_module, remove_module_filters)
