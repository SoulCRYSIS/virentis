local virentis = require("prototypes.utils")
local recipe_tints = virentis.recipe_tints

local function butchering_icon(path)
  return {
    {
      icon = path,
      icon_size = 64,
    },
    {
      icon = "__virentis-graphics__/icons/recipes/butchering.png",
      icon_size = 64,
      draw_background = true,
    }
  }
end

data:extend(
  {
    {
      type = "recipe",
      name = "fish-butchering",
      localised_name = {"recipe-name.butchering", { "item-name.raw-fish" } },
      category = "organic",
      subgroup = "virentis-butching",
      order = "aa",
      icons = butchering_icon("__base__/graphics/icons/fish.png"),
      ingredients = {
        { type = "item", name = "raw-fish", amount = 1 },
      },
      results = {
        { type = "item", name = "fish-bones", amount = 1 },
        { type = "item", name = "fish-fillet",  amount = 5 },
      },
      crafting_machine_tint = recipe_tints.orange,
      energy_required = 8,
      result_is_always_fresh = false,
      allow_productivity = true,
      enabled = false,
    }
  }
)
