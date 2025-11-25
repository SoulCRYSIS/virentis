data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "grind-rockmalt-scale-hand-crafting",
      category = "basic-crafting",
      additional_categories = { "grinding" },
      subgroup = "virentis-materials",
      order = "a",
      icon = "__base__/graphics/icons/stone.png",
      ingredients = {
        { type = "item", name = "rockmalt-scale", amount = 1 },
      },
      results = {
        { type = "item", name = "stone", amount = 5 },
      },
      crafting_machine_tint = recipe_tints.yellow,
      energy_required = 10,
    },
  }
)
