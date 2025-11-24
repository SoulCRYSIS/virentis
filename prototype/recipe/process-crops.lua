data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "process-rockmalt-fruit",
      category = "organic-or-hand-crafting",
      order = "a",
      ingredients = {
        { type = "item", name = "rockmalt-fruit", amount = 1 },
      },
      results = {
        { type = "item", name = "rockmalt-bulb",  amount = 2 },
        { type = "item", name = "rockmalt-scale", amount = 1 },
      },
    },
    {
      type = "recipe",
      name = "process-redbloom-fruit",
      category = "organic-or-hand-crafting",
      order = "a",
      ingredients = {
        { type = "item", name = "redbloom-fruit", amount = 1 },
      },
      results = {
        { type = "item", name = "redbloom-mashed",  amount = 2 },
        { type = "item", name = "redbloom-seed", amount = 1 },
      },
    },
    {
      type = "recipe",
      name = "nutrient-from-grass",
      category = "organic-or-hand-crafting",
      order = "a",
      ingredients = {
        { type = "item", name = "grass", amount = 1 },
      },
      results = {
        { type = "item", name = "nutrients",  amount = 1 },
      },
    },
  }
)
