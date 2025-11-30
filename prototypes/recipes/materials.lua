data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "stone-from-rockmalt-scale",
      category = "organic-or-hand-crafting",
      order = "a",
      icon = "__base__/graphics/icons/stone.png",
      ingredients = {
        { type = "item", name = "rockmalt-scale", amount = 1 }
      },
      results = {
        { type = "item", name = "stone", amount = 5 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 8,
    },
    {
      type = "recipe",
      name = "heart-of-nature",
      category = "organic",
      order = "a",
      icon = "__virentis__/graphics/icons/items/materials/heart-of-nature.png",
      ingredients = {
        { type = "item", name = "resin",       amount = 1 },
        { type = "item", name = "siltcore",    amount = 1 },
        { type = "item", name = "living-wood", amount = 1 }
      },
      results = {
        { type = "item", name = "heart-of-nature", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.green,
      energy_required = 20,
    },
  }
)
