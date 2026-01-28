data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "mudland-research-data",
      category = "environment-research-data",
      subgroup = "virentis-research",
      order = "a",
      icon = "__virentis-graphics__/icons/items/environment-data/mudland-data.png",
      ingredients = {
        { type = "item", name = "heart-of-nature", amount = 1 },
        { type = "item", name = "mudland-medley",  amount = 1 },
        { type = "item", name = "firebrick",       amount = 4 },
        { type = "item", name = "graphene",        amount = 4 },
      },
      results = {
        { type = "item", name = "mudland-research-data", amount = 1 }
      },
      energy_required = 4,
      allow_productivity = true,
      enabled = false,
      auto_recycle = false,
    },
  }
)
