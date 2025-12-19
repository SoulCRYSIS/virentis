-- logics/variant-switcher.lua
-- This logic handles switching a base entity with a random variant upon creation.

-- List of base entities and their variant counts (excluding 0)
local variants_to_switch = {
  ["eternal-lantern"] = 3
}

local function on_created_entity(event)
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
    fast_replace = true,
    player = player_index,
    raise_built = true -- Trigger script_raised_built for other logics
  })

  -- If this was created from map generation, make it non-minable
  if new_entity and event.is_from_map then
    new_entity.minable = false
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
      on_created_entity({
        entity = entity,
        is_from_map = true
      })
    end
  end
end

local filters = {}
for name, _ in pairs(variants_to_switch) do
  table.insert(filters, { filter = "name", name = name })
end

script.on_event({
  defines.events.on_built_entity,
  defines.events.on_robot_built_entity,
  defines.events.script_raised_built,
  defines.events.script_raised_revive
}, on_created_entity, filters)

script.on_event(defines.events.on_chunk_generated, on_chunk_generated)

