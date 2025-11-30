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
    -- {
    --   type = "recipe",
    --   name = "composter",
    --   energy_required = 0.5,
    --   ingredients =
    --   {
    --     { type = "item", name = "wood", amount = 10 },
    --   },
    --   results = { { type = "item", name = "composter", amount = 1 } },
    --   enabled = true
    -- },
    -- {
    --   type = "recipe",
    --   name = "windmill",
    --   surface_conditions = virentis_surface,
    --   energy_required = 2,
    --   ingredients =
    --   {
    --     { type = "item", name = "iron-plate", amount = 5 },
    --   },
    --   results = { { type = "item", name = "windmill", amount = 1 } },
    --   enabled = false
    -- },
    -- {
    --   type = "recipe",
    --   name = "lumbermill",
    --   surface_conditions = virentis_surface,
    --   energy_required = 2,
    --   ingredients =
    --   {
    --     { type = "item", name = "iron-plate", amount = 5 },
    --   },
    --   results = { { type = "item", name = "lumbermill", amount = 1 } },
    --   enabled = false
    -- },
    {
      type = "recipe",
      name = "environment-research-center",
      category = "crafting",
      order = "a",
      icon = "__virentis__/graphics/icons/items/machines/environment-research-center.png",
      ingredients = {
        { type = "item", name = "firebrick",             amount = 4 },
        { type = "item", name = "steel-plate",           amount = 8 },
        { type = "item", name = "heart-of-nature",       amount = 1 },
        { type = "item", name = "processing-unit",       amount = 2 },
        { type = "item", name = "low-density-structure", amount = 2 }
      },
      results = {
        { type = "item", name = "environment-research-center", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 1,
      enabled = false,
      surface_conditions = virentis_surface,
    },
    {
      type = "recipe",
      name = "advance-food-processer",
      category = "crafting",
      order = "a",
      icon = "__virentis__/graphics/icons/items/machines/advance-food-processer.png",
      ingredients = {
        { type = "item", name = "steel-plate",        amount = 8 },
        { type = "item", name = "resin",              amount = 2 },
        { type = "item", name = "heart-of-nature",    amount = 1 },
        { type = "item", name = "electronic-circuit", amount = 4 }
      },
      results = {
        { type = "item", name = "advance-food-processor", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 1,
      enabled = false,
      surface_conditions = virentis_surface,
    },
    {
      type = "recipe",
      name = "deep-fryer",
      category = "crafting",
      order = "a",
      icon = "__virentis__/graphics/icons/items/machines/deep-fryer.png",
      ingredients = {
        { type = "item", name = "steel-plate", amount = 8 },
        { type = "item", name = "pipe",        amount = 4 },
        { type = "item", name = "heat-pipe",   amount = 2 },
        { type = "item", name = "resin",       amount = 2 },
        { type = "item", name = "firebrick",   amount = 4 }
      },
      results = {
        { type = "item", name = "deep-fryer", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 1,
      enabled = false,
      surface_conditions = virentis_surface,
    },
    {
      type = "recipe",
      name = "oven",
      category = "crafting",
      order = "a",
      icon = "__virentis__/graphics/icons/items/machines/oven.png",
      ingredients = {
        { type = "item", name = "steel-plate", amount = 8 },
        { type = "item", name = "firebrick",   amount = 8 },
        { type = "item", name = "heat-pipe",   amount = 2 }
      },
      results = {
        { type = "item", name = "oven", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.red,
      energy_required = 1,
      enabled = false,
      surface_conditions = virentis_surface,
    },
    {
      type = "recipe",
      name = "living-inserter",
      category = "crafting",
      order = "a",
      icon = "__virentis__/graphics/icons/items/machines/living-inserter.png",
      ingredients = {
        { type = "item", name = "bulk-inserter",   amount = 1 },
        { type = "item", name = "heart-of-nature", amount = 1 }
      },
      results = {
        { type = "item", name = "living-inserter", amount = 1 }
      },
      crafting_machine_tint = recipe_tints.green,
      energy_required = 1,
    },
  }
)
