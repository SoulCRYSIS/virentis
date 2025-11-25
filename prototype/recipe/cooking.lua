

data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "redbloom-salad",
      category = "organic-or-hand-crafting",
      order = "a",
      icon = "__virentis__/graphics/icons/items/foods/redbloom-salad.png",
      ingredients = {
        { type = "item", name = "redbloom-fruit", amount = 1 },
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
      icons = uncooked_icon("__virentis__/graphics/icons/items/foods/mudland-buns.png"),
      ingredients = {
        { type = "item", name = "rockmalt-bulb", amount = 2 },
        { type = "item", name = "redbloom-fruit", amount = 1 },
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
      icon = "__virentis__/graphics/icons/items/foods/mudland-buns.png",
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
      icon = "__virentis__/graphics/icons/items/foods/dough.png",
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
      icon = "__virentis__/graphics/icons/items/foods/red-sauce.png",
      ingredients = {
        { type = "item", name = "redbloom-fruit", amount = 2 },
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
      icons = uncooked_icon("__virentis__/graphics/icons/items/foods/mudland-pie.png"),
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
      icon = "__virentis__/graphics/icons/items/foods/mudland-pie.png",
      ingredients = {
        { type = "item", name = "raw-mudland-pie", amount = 1 },
      },
      results = {
        { type = "item", name = "cooked-mudland-pie", amount = 1 },
      },
    },
  }
)