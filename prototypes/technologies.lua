data:extend(
---@type data.TechnologyPrototype[]
  {
    -- {
    --   type = "technology",
    --   name = "virentis-windmill",
    --   icon = "__virentis__/graphic/icon/technology/windmill.png",
    --   effects = {
    --     {
    --       type = "unlock-recipe",
    --       recipe = "carriage"
    --     },
    --     {
    --       type = "unlock-recipe",
    --       recipe = "waypoint"
    --     },
    --   },
    --   icon_size = 256,
    --   prerequisites = { "planet-virentis" },
    --   unit = {
    --     count = 20,
    --     ingredients = {
    --       { "automation-science-pack", 1 },
    --     },
    --     time = 10
    --   },
    --   order = "c-g-a",
    -- },
    {
      type = "technology",
      name = "advanced-baking",
      icon = "__virentis__/graphics/icons/technologies/advanced-baking.png",
      icon_size = 256,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "oven"
        },
      },
      research_trigger = {
        type = "scripted",
        trigger_description = "technology-description.advanced-baking",
        icon = "__virentis__/graphics/icons/items/foods/berry-bliss-cookie.png",
      },
      order = "c-g-b",
    },
    {
      type = "technology",
      name = "environment-research-center",
      icon = "__virentis__/graphics/icons/technologies/environment-research-center.png",
      icon_size = 256,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "environment-research-center"
        },
      },
      research_trigger = {
        type = "scripted",
        trigger_description = "technology-description.environment-research-center",
        icon = "__virentis__/graphics/icons/items/foods/mudland-medley.png",
      },
      order = "c-g-b",
    },
  })
