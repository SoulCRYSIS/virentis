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
      name = "virentis-oven",
      icon = "__virentis__/graphics/icons/machines/oven.png",
      icon_size = 64,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "oven"
        },
      },
      unit = {
        count = 10,
        ingredients = {},
        time = 1
      },
      research_trigger = {
        type = "scripted",
        trigger_description = "Eat cooked mudland pies",
        icon = "__virentis__/graphics/icons/items/foods/mudland-pie.png",
      },
      order = "c-g-b",
    },
  })
