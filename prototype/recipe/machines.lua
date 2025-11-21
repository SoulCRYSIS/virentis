data:extend(
---@type data.RecipePrototype
  {
    {
      type = "recipe",
      name = "windmill",
      surface_conditions =
      {
        {
          property = "pressure",
          min = 2000,
          max = 2000
        }
      },
      energy_required = 2,
      ingredients =
      {
        { type = "item", name = "iron-plate", amount = 5 },
      },
      results = { { type = "item", name = "windmill", amount = 1 } },
      enabled = false
    },
  })
