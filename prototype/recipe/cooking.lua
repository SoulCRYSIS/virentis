data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "redbloom-salad",
      category = "organic-or-hand-crafting",
      order = "a",
      ingredients = {
        { type = "item", name = "redbloom-mashed", amount = 1 },
        { type = "item", name = "grass", amount = 2 },
      },
      results = {
        { type = "item", name = "redbloom-salad", amount = 1 },
      },
    },
    {
      type = "recipe",
      name = "raw-mudland-buns",
      category = "organic-or-hand-crafting",
      order = "a",
      ingredients = {
        { type = "item", name = "rockmalt-bulb", amount = 2 },
        { type = "item", name = "redbloom-mashed", amount = 1 },
      },
      results = {
        { type = "item", name = "raw-mudland-buns", amount = 1 },
      },
    },
    {
      type = "recipe",
      name = "cook-mudland-buns",
      category = "baking",
      order = "a",
      ingredients = {
        { type = "item", name = "raw-mudland-buns", amount = 1 },
      },
      results = {
        { type = "item", name = "cooked-mudland-buns", amount = 1 },
      },
    },
    {
      type = "recipe",
      name = "dough",
      category = "organic-or-hand-crafting",
      order = "a",
      ingredients = {
        { type = "item", name = "rockmalt-bulb", amount = 2 },
        { type = "fluid", name = "water", amount = 10 },
      },
      results = {
        { type = "item", name = "dough", amount = 3 },
      },
    },
    {
      type = "recipe",
      name = "red-sauce",
      category = "baking",
      order = "a",
      ingredients = {
        { type = "item", name = "redbloom-mashed", amount = 2 },
      },
      results = {
        { type = "item", name = "red-sauce", amount = 1 },
      },
    },
    {
      type = "recipe",
      name = "raw-mudland-pie",
      category = "organic-or-hand-crafting",
      order = "a",
      ingredients = {
        { type = "item", name = "dough", amount = 9 },
        { type = "item", name = "red-sauce", amount = 2 },
      },
      results = {
        { type = "item", name = "raw-mudland-pie", amount = 1 },
      },
    },
    {
      type = "recipe",
      name = "cook-mudland-pie",
      category = "baking",
      order = "a",
      ingredients = {
        { type = "item", name = "raw-mudland-pie", amount = 1 },
      },
      results = {
        { type = "item", name = "cooked-mudland-pie", amount = 1 },
      },
    },
  }
)