local research_check_list = {
  ["berry-bliss-cookie"] = "virentis-baking",
  ["medland-medley"] = "environment-research-center",
}

script.on_event(defines.events.on_player_used_capsule, function(event)
  for item_name, tech_name in pairs(research_check_list) do
    if event.item.name == item_name then
      local player = game.get_player(event.player_index)
      if not player then return end

      local tech = player.force.technologies[tech_name]
      if not tech or tech.researched then return end

      local new_progress = tech.saved_progress + 1 / tech.research_unit_count

      if new_progress >= 1 then
        player.force.script_trigger_research(tech_name)
      else
        tech.saved_progress = new_progress
      end
    end
  end
end)