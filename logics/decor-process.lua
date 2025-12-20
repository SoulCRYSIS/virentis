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

local function apply_variant(event)
  local entity = event.created_entity or event.entity
  if not (entity and entity.valid) then return end
  
  local variant_count = variants_to_switch[entity.name]
  if not variant_count or variant_count == 0 then return end

  -- 0 means keep the base variant
  local variant = math.random(0, variant_count)
  if variant == 0 then return end

  local surface = entity.surface
  local position = entity.position
  local force = entity.force
  local direction = entity.direction
  local player_index = event.player_index
  local name = entity.name

  -- Destroy the original entity
  entity.destroy()

  -- Create the variant
  local new_entity = surface.create_entity({
    name = name .. "-" .. variant,
    position = position,
    force = force,
    direction = direction,
    raise_built = true,
    player = player_index,
  })

  -- If this was created from map generation, make it non-minable
  if new_entity and event.is_from_map then
    new_entity.minable = false
  end

  local module_name = module_to_insert[name]
  if module_name then
    local module = new_entity.get_module_inventory()
    module.insert({ name = module_name })
  end
end

local function on_chunk_generated(event)
  local surface = event.surface
  local area = event.area
  
  for base_name, _ in pairs(variants_to_switch) do
    local entities = surface.find_entities_filtered({
      area = area,
      name = base_name
    })
    
    for _, entity in pairs(entities) do
      -- Simulate built event for chunk generated entities
      apply_variant({
        entity = entity,
        is_from_map = true
      })
    end
  end
end

local change_variant_filters = {}
for name, _ in pairs(variants_to_switch) do
  table.insert(change_variant_filters, { filter = "name", name = name })
end

script.on_event(defines.events.on_built_entity, apply_variant, change_variant_filters)
script.on_event(defines.events.on_robot_built_entity, apply_variant, change_variant_filters)
script.on_event(defines.events.script_raised_built, apply_variant, change_variant_filters)
script.on_event(defines.events.script_raised_revive, apply_variant, change_variant_filters)

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
