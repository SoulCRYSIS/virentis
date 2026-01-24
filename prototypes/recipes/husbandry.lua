local virentis = require("prototypes.utils")
local recipe_tints = virentis.recipe_tints

data.raw.recipe["pentapod-egg"].surface_conditions = {
  {
    property = "pressure",
    min = 1200,
    max = 2000
  }
}

data:extend(
  {
    {
      type = "recipe",
      name = "pentapod-from-nutrients-pulp",
      category = "organic",
      subgroup = "virentis-chemicals",
      order = "cb",
      icon = "__virentis-graphics__/icons/recipes/pentapod-from-nutrients-pulp.png",
      ingredients = {
        { type = "item",  name = "pentapod-egg",   amount = 1, ignored_by_stats = 1 },
        { type = "fluid", name = "nutrients-pulp", amount = 30 },
      },
      results = {
        { type = "item", name = "pentapod-egg", amount = 2, ignored_by_stats = 1 }
      },
      crafting_machine_tint = data.raw["recipe"]["pentapod-egg"].crafting_machine_tint,
      energy_required = 6,
      auto_recycle = false,
      allow_productivity = true,
      enabled = false,
      result_is_always_fresh = true,
    },
  }
)