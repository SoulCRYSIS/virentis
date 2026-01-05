local research_check_list = {
  ["berry-bliss-cookie"] = "advanced-baking",
  ["pentapod-souffle-omelette"] = "tar-processing",
}

script.on_event(defines.events.on_player_used_capsule, function(event)
  if research_check_list[event.item.name] then
    local player = game.get_player(event.player_index)
    if not player then return end

    player.force.script_trigger_research(research_check_list[event.item.name])
  end
end)
