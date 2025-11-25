data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "process-rockmalt-fruit",
      category = "organic-or-hand-crafting",
      subgroup = "virentis-crops",
      order = "a",
      icon = "__virentis__/graphics/icons/items/crops/rockmalt-scale.png",
      ingredients = {
        { type = "item", name = "rockmalt-fruit", amount = 1 },
      },
      results = {
        { type = "item", name = "rockmalt-bulb",  amount = 5 },
        { type = "item", name = "rockmalt-scale", amount = 1 },
      },
      crafting_machine_tint = recipe_tints.yellow,
      energy_required = 2,
    },
    {
      type = "recipe",
      name = "nutrient-from-grass",
      category = "organic-or-hand-crafting",
      subgroup = "virentis-materials",
      order = "a",
      icon = "__virentis__/graphics/icons/items/crops/grass.png",
      ingredients = {
        { type = "item", name = "grass", amount = 1 },
      },
      results = {
        { type = "item", name = "nutrients",  amount = 1 },
      },
      crafting_machine_tint = recipe_tints.green,
    },
  }
)
