

require("logics.eternal-lantern-beacon")
require("logics.research-on-eat")



-- -------------------------------------------------------------------------------
-- -- Composter Logic
-- -------------------------------------------------------------------------------

-- local COMPOSTER_NAME = "composter"

-- ---@param entity LuaEntity
-- local function add_composter(entity)
--   if not storage.composters then storage.composters = {} end
--   storage.composters[entity.unit_number] = entity
-- end

-- ---@param unit_number number
-- local function remove_composter(unit_number)
--   if storage.composters then
--     storage.composters[unit_number] = nil
--   end
-- end

-- -- Event Filters
-- local composter_filter = { { filter = "name", name = COMPOSTER_NAME } }

-- script.on_event({
--   defines.events.on_built_entity,
--   defines.events.on_robot_built_entity,
--   defines.events.script_raised_built,
-- }, function(event)
--   local entity = event.created_entity or event.entity
--   if entity and entity.valid and entity.name == COMPOSTER_NAME then
--     add_composter(entity)
--   end
-- end, composter_filter)

-- script.on_event({
--   defines.events.on_player_mined_entity,
--   defines.events.on_robot_mined_entity,
--   defines.events.on_entity_died,
--   defines.events.script_raised_destroy
-- }, function(event)
--   local entity = event.entity
--   if entity and entity.valid and entity.name == COMPOSTER_NAME then
--     remove_composter(entity.unit_number)
--   end
-- end, composter_filter)

-- script.on_init(function()
--   storage.composters = {}
--   -- Find existing if added mid-game (though technically init only runs on new game or when adding mod to save that didn't have it?)
--   -- Actually on_init runs when mod is added. on_configuration_changed is better for upgrades.
--   -- But for now, let's just index on init/config changed.
-- end)

-- script.on_configuration_changed(function(data)
--   if not storage.composters then storage.composters = {} end
--   -- Re-scan surfaces for composters if necessary, but expensive.
--   -- Assuming this is a new mod addition, checking all surfaces:
--   for _, surface in pairs(game.surfaces) do
--     local composters = surface.find_entities_filtered({ name = COMPOSTER_NAME })
--     for _, entity in pairs(composters) do
--       add_composter(entity)
--     end
--   end
-- end)

-- -- Process Composters
-- script.on_nth_tick(60, function(event)
--   if not storage.composters then return end

--   for unit_number, entity in pairs(storage.composters) do
--     if entity.valid then
--       local inventory = entity.get_inventory(defines.inventory.chest)
--       if inventory and not inventory.is_empty() then
--         for i = 1, #inventory do
--           local stack = inventory[i]
--           if stack.valid_for_read and stack.spoil_percent then
--             -- Increase spoil percent by 5% per second (approx 20s to full rot from 0)
--             -- Normal spoil time is usually minutes, so this is much faster.
--             -- Need to handle if it goes over 1 (it should turn to spoilage automatically?)
--             -- LuaItemStack.spoil_percent is 0..1

--             local new_percent = stack.spoil_percent + 0.05
--             if new_percent >= 1 then
--               -- Factorio 2.0 handles spoiling automatically when it hits 1?
--               -- Or do we need to set it to 1?
--               -- Setting it to 1 might trigger the spoil result immediately.
--               stack.spoil_percent = 1
--             else
--               stack.spoil_percent = new_percent
--             end
--           end
--         end
--       end
--     else
--       storage.composters[unit_number] = nil
--     end
--   end
-- end)
