data:extend(
---@type data.TechnologyPrototype[]
  {
    {
      type = "technology",
      name = "planet-discovery-virentis",
      icons = util.technology_icon_constant_planet("__virentis__/graphics/icons/misc/virentis-icon.png"),
      icon_size = 256,
      essential = true,
      effects =
      {
        {
          type = "unlock-space-location",
          space_location = "virentis",
          use_icon_overlay_constant = true
        },
        {
          type = "unlock-recipe",
          recipe = "trade-iron-plate"
        },
      },
      prerequisites = { "advanced-asteroid-processing", "heating-tower", "asteroid-reprocessing", "rocket-turret" },
      unit =
      {
        count = 3000,
        ingredients =
        {
          { "automation-science-pack",   1 },
          { "logistic-science-pack",     1 },
          { "chemical-science-pack",     1 },
          { "production-science-pack",   1 },
          { "utility-science-pack",      1 },
          { "space-science-pack",        1 },
          { "metallurgic-science-pack",  1 },
          { "agricultural-science-pack", 1 },
        },
        time = 60
      }
    },
    {
      type = "technology",
      name = "redbloom-processing",
      icon = "__virentis__/graphics/icons/technologies/redbloom-processing.png",
      icon_size = 256,
      essential = true,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "nutrient-from-herb"
        },
        {
          type = "unlock-recipe",
          recipe = "red-sauce"
        },
        {
          type = "unlock-recipe",
          recipe = "redbloom-buns"
        },
        {
          type = "unlock-recipe",
          recipe = "trade-copper-plate"
        },
      },
      research_trigger = {
        type = "mine-entity",
        entity_name = "redbloom-tree",
      },
    },
    {
      type = "technology",
      name = "rockmalt-processing",
      icon = "__virentis__/graphics/icons/technologies/rockmalt-processing.png",
      icon_size = 256,
      essential = true,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "rockmalt-processing"
        },
        {
          type = "unlock-recipe",
          recipe = "dough"
        },
        {
          type = "unlock-recipe",
          recipe = "rockmalt-pudding"
        },
        {
          type = "unlock-recipe",
          recipe = "trade-iron-plate"
        },
      },
      research_trigger = {
        type = "mine-entity",
        entity_name = "rockmalt-tree",
      },
    },
    {
      type = "technology",
      name = "mangroove-processing",
      icon = "__virentis__/graphics/icons/technologies/mangroove-processing.png",
      icon_size = 256,
      essential = true,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "mangroove-mashed"
        },
        {
          type = "unlock-recipe",
          recipe = "mangroove-syrup"
        },
        {
          type = "unlock-recipe",
          recipe = "berry-bliss-cookie"
        },
      },
      research_trigger = {
        type = "mine-entity",
        entity_name = "mangroove-tree",
      },
    },
    {
      type = "technology",
      name = "advanced-baking",
      icon = "__virentis__/graphics/icons/technologies/advanced-baking.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "oven"
        },
        {
          type = "unlock-recipe",
          recipe = "trade-firebrick"
        },
      },
      prerequisites = { "mangroove-processing", "rockmalt-processing", "redbloom-processing" },
      research_trigger = {
        type = "scripted",
        trigger_description = "technology-description.advanced-baking",
        icon = "__virentis__/graphics/icons/items/foods/berry-bliss-cookie.png",
      },
    },
    {
      type = "technology",
      name = "nyxoleum-processing",
      icon = "__virentis__/graphics/icons/technologies/rockmalt-processing.png",
      icon_size = 256,
      essential = true,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "solid-fuel-from-nyxoleum-seed"
        },
        {
          type = "unlock-recipe",
          recipe = "vegetable-oil"
        },
        {
          type = "unlock-recipe",
          recipe = "deep-fryer"
        },
        {
          type = "unlock-recipe",
          recipe = "wild-taco"
        },
        {
          type = "unlock-recipe",
          recipe = "trade-processing-unit"
        },
        {
          type = "unlock-recipe",
          recipe = "sweat-chilli-sauce"
        },
        {
          type = "unlock-recipe",
          recipe = "sweet-doughnut"
        },
        {
          type = "unlock-recipe",
          recipe = "fried-dumpling-set"
        },
      },
      prerequisites = { "advanced-baking" },
      research_trigger = {
        type = "mine-entity",
        entity_name = "nyxoleum-tree",
      },
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
    },
    {
      type = "technology",
      name = "tar-processing",
      icon = "__virentis__/graphics/icons/technologies/tar-processing.png",
      icon_size = 256,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "trade-phosphorus"
        },
        {
          type = "unlock-recipe",
          recipe = "tar-processing"
        },
        {
          type = "unlock-recipe",
          recipe = "solid-fuel-from-methanol"
        },
        {
          type = "unlock-recipe",
          recipe = "solid-fuel-from-creosote"
        },
        {
          type = "unlock-recipe",
          recipe = "nutrients-pulp"
        },
        {
          type = "unlock-recipe",
          recipe = "virentis-rocket-fuel"
        },
      },
      research_trigger = {
        type = "scripted",
        trigger_description = "technology-description.tar-processing",
        icon = "__virentis__/graphics/icons/items/foods/pentapod-souffle-omelette.png",
      },
    },
  })
