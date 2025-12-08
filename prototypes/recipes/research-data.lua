data:extend(
  ---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "mudland-research-data",
      category = "environment-research-data",
      subgroup = "virentis-research",
      order = "a",
      icon = "__virentis__/graphics/icons/items/environment-data/mudland-data.png",
      ingredients = {
        { type = "item", name = "heart-of-nature",     amount = 1 },
        { type = "item", name = "firebrick", amount = 2 },
        { type = "item", name = "mudland-medley",         amount = 1 },
        { type = "item", name = "berry-bliss-cookie", amount = 1 }
      },
      results = {
        { type = "item", name = "mudland-research-data", amount = 1 }
      },
      energy_required = 4,
    },
  }
)