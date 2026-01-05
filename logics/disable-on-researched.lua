local recipe_to_disable = {
  ["frying"] = "housewarming-gift",
  ["environment-research-center"] = "give-explosive-rocket",
}

script.on_event(defines.events.on_research_finished, function(event)
  local technology_name = event.research.name
  if recipe_to_disable[technology_name] then
    local recipe_name = recipe_to_disable[technology_name]
    local force = event.research.force
    
    if force.recipes[recipe_name] then
      force.recipes[recipe_name].enabled = false
    end
  end
end)

script.on_event(defines.events.on_research_reversed, function(event)
  local technology_name = event.research.name
  if recipe_to_disable[technology_name] then
    local recipe_name = recipe_to_disable[technology_name]
    local force = event.research.force
    
    if force.recipes[recipe_name] then
      force.recipes[recipe_name].enabled = true
    end
  end
end)
