local virentis_surface = {
  {
    property = "pressure",
    min = 2000,
    max = 2000
  }
}

data:extend(
---@type data.RecipePrototype[]
  {
    {
      type = "recipe",
      name = "composter",
      energy_required = 0.5,
      ingredients =
      {
        { type = "item", name = "wood", amount = 10 },
      },
      results = { { type = "item", name = "composter", amount = 1 } },
      enabled = true
    },
    {
      type = "recipe",
      name = "windmill",
      surface_conditions = virentis_surface,
      energy_required = 2,
      ingredients =
      {
        { type = "item", name = "iron-plate", amount = 5 },
      },
      results = { { type = "item", name = "windmill", amount = 1 } },
      enabled = false
    },
    {
      type = "recipe",
      name = "lumbermill",
      surface_conditions = virentis_surface,
      energy_required = 2,
      ingredients =
      {
        { type = "item", name = "iron-plate", amount = 5 },
      },
      results = { { type = "item", name = "lumbermill", amount = 1 } },
      enabled = false
    },
    {
      type = "recipe",
      name = "oven",
      surface_conditions = virentis_surface,
      energy_required = 2,
      ingredients =
      {
        { type = "item", name = "stone-brick", amount = 10 },
        { type = "item", name = "iron-plate", amount = 5 },
      },
      results = { { type = "item", name = "oven", amount = 1 } },
      enabled = false
    },
  })
