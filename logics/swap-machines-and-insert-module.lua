-- logics/variant-switcher.lua
-- This logic handles switching a base entity with a random variant upon creation.

local module_to_insert = {
  ["eternal-lantern"] = "eternal-lantern-module",
  ["windmill"] = "windmill-module",
}

local random_rotate = {
  ["town-mortar-turret"] = "orientation",
  ["town-tesla-turret"] = "4way",
}

local swap_pairs = {
  ["biolab"] = "virentis-biolab",
}

local quality_by_distance = {
  ["town-mortar-turret"] = true,
  ["town-tesla-turret"] = true,
  ["trader-t1"] = true,
}

local to_process = {
  "eternal-lantern",
  "windmill",
  "town-mortar-turret",
  "town-tesla-turret",
  "biolab",
  "trader-t1",
}

local ghost_to_process = {
  "eternal-lantern",
}

local quality_list = {
  "normal",
  "uncommon",
  "rare",
  "epic",
  "legendary",
}

local function apply_variant(event)
  local entity = event.created_entity or event.entity
  if not (entity and entity.valid) then return end

  local name = entity.name
  if entity.type == "entity-ghost" then
    entity.insert_plan = {}
    return
  end

  ---@type LuaEntity
  local new_entity = entity
  local need_create = false
  local new_name = name
  local new_quallity = entity.quality.name

  if swap_pairs[name] and entity.surface.name == "virentis" then
    new_name = swap_pairs[name]
    need_create = true
  end

  if quality_by_distance[name] then
    local dist = math.sqrt(entity.position.x ^ 2 + entity.position.y ^ 2)
    local max_quality = #quality_list
    local base_dist = 1000
    local quality_index = 1

    if dist > base_dist then
      local log_val = math.log(dist / base_dist, 2)
      local base_level = math.floor(log_val)
      local probability = log_val - base_level
      local current_tier = base_level + 1

      if math.random() < probability then
        quality_index = current_tier + 1
      else
        quality_index = current_tier
      end
    end

    if quality_index > max_quality then
      quality_index = max_quality
    end

    new_quallity = quality_list[quality_index]
    need_create = true
  end

  if need_create then
    local surface = entity.surface
    local position = entity.position
    local force = entity.force
    local direction = entity.direction
    local player_index = event.player_index

    entity.destroy()

    new_entity = surface.create_entity({
      name = new_name,
      position = position,
      force = force,
      direction = direction,
      fast_replace = true,
      quality = new_quallity,
      player = player_index,
    })
  end

  if event.is_from_map then
    new_entity.minable = false
  end

  local module_name = module_to_insert[name]
  if module_name then
    local inventory = new_entity.get_inventory(defines.inventory.beacon_modules)
    if (name == "windmill") then
      local position = new_entity.position
      local distance = math.sqrt(position.x ^ 2 + position.y ^ 2)
      local amount = math.min(math.floor(math.sqrt(36 + distance / 32) - 4), 20)
      if amount > 0 then
        inventory.insert({ name = module_name, count = amount })
      end
    else
      inventory.insert({ name = module_name })
    end
    new_entity.operable = false
  end

  if random_rotate[name] then
    if random_rotate[name] == "orientation" then
      new_entity.orientation = math.random()
    elseif random_rotate[name] == "4way" then
      local directions = { defines.direction.north, defines.direction.east, defines.direction.south, defines.direction
          .west }
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
      local pos = entity.position
      if pos.x >= area.left_top.x and pos.y >= area.left_top.y and
          pos.x < area.right_bottom.x and pos.y < area.right_bottom.y then
        -- Simulate built event for chunk generated entities
        apply_variant({
          entity = entity,
          is_from_map = true,
        })
      end
    end
  end
end

local filters = { }
for _, name in ipairs(to_process) do
  table.insert(filters, { filter = "name", name = name })
end
for _, name in ipairs(ghost_to_process) do
  table.insert(filters, { filter = "ghost_name", ghost_name = name, name = name })
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
end

script.on_event(defines.events.on_pre_player_mined_item, remove_module, remove_module_filters)
script.on_event(defines.events.on_robot_pre_mined, remove_module, remove_module_filters)
