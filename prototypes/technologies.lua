local trading_recipes = {
  "trade-iron-plate",
  "trade-copper-plate",
  "trade-firebrick",
  "trade-siltcore",
  "trade-phosphorus",
  "trade-advanced-circuit",
  "trade-virta-neuron",
}

local trading_recipes_effects = {}
for i, recipe in ipairs(trading_recipes) do
  trading_recipes_effects[i] = {
    type = "change-recipe-productivity",
    recipe = recipe,
    change = 0.05
  }
end

data:extend(
---@type data.TechnologyPrototype[]
  {
    {
      type = "technology",
      name = "planet-discovery-virentis",
      order = "va",
      subgroup = "virentis-technologies",
      icons = util.technology_icon_constant_planet("__virentis-graphics__/icons/misc/virentis-icon.png"),
      icon_size = 256,
      essential = true,
      effects =
      {
        {
          type = "unlock-space-location",
          space_location = "virentis",
          use_icon_overlay_constant = true
        },
      },
      prerequisites = { "advanced-asteroid-processing", "heating-tower", "asteroid-reprocessing", "rocket-turret", "biolab" },
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
          { "agricultural-science-pack", 1 },
        },
        time = 60
      }
    },
    {
      type = "technology",
      name = "redbloom-processing",
      order = "vba",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/technologies/redbloom-processing.png",
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
        {
          type = "unlock-recipe",
          recipe = "sulfuric-acid-from-redbloom"
        }
      },
      research_trigger = {
        type = "mine-entity",
        entity = "redbloom-tree",
      },
      prerequisites = { "planet-discovery-virentis" },
    },
    {
      type = "technology",
      name = "rockmalt-processing",
      order = "vbb",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/technologies/rockmalt-processing.png",
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
        {
          type = "unlock-recipe",
          recipe = "basic-oven"
        },
        {
          type = "unlock-recipe",
          recipe = "stone-from-rockmalt-scale"
        },
        {
          type = "unlock-recipe",
          recipe = "virentis-concrete"
        }
      },
      research_trigger = {
        type = "mine-entity",
        entity = "rockmalt-tree",
      },
      prerequisites = { "planet-discovery-virentis" },
    },
    {
      type = "technology",
      name = "mangroove-processing",
      order = "vbc",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/technologies/mangroove-processing.png",
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
        entity = "mangroove-tree",
      },
      prerequisites = { "rockmalt-processing" },
    },
    {
      type = "technology",
      name = "advanced-baking",
      order = "vca",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/technologies/advanced-baking.png",
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
        icon = "__virentis-graphics__/icons/items/foods/berry-bliss-cookie.png",
      },
    },
    {
      type = "technology",
      name = "kheast-processing",
      order = "vcb",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/technologies/kheast-processing.png",
      icon_size = 256,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "kheast-cultivation"
        },
        {
          type = "unlock-recipe",
          recipe = "flatbread"
        },
      },
      prerequisites = { "advanced-baking" },
      research_trigger = {
        type = "mine-entity",
        entity = "virentis-behemoth-stomper-shell",
      },
    },
    {
      type = "technology",
      name = "nyxoleum-processing",
      order = "vcc",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/technologies/nyxoleum-processing.png",
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
          recipe = "nyxoleum-sapling"
        },
        {
          type = "unlock-recipe",
          recipe = "wild-taco"
        },
        {
          type = "unlock-recipe",
          recipe = "trade-advanced-circuit"
        },
        {
          type = "unlock-recipe",
          recipe = "sweat-chilli-sauce"
        },
        {
          type = "unlock-recipe",
          recipe = "housewarming-gift"
        },
      },
      prerequisites = { "kheast-processing" },
      research_trigger = {
        type = "mine-entity",
        entity = "nyxoleum-tree",
      },
    },
    {
      type = "technology",
      name = "frying",
      order = "vdb",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/technologies/frying.png",
      icon_size = 256,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "deep-fryer"
        },
        {
          type = "unlock-recipe",
          recipe = "pentapod-souffle-omelette"
        },
        {
          type = "unlock-recipe",
          recipe = "soft-cooked-pentapod-egg"
        },
      },
      prerequisites = { "nyxoleum-processing" },
      research_trigger = {
        type = "craft-item",
        item = "eternal-lantern",
        count = 10,
      },
    },
    {
      type = "technology",
      name = "tar-processing",
      order = "veaa",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/technologies/tar-processing.png",
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
          recipe = "explosive-from-methanol"
        },
        {
          type = "unlock-recipe",
          recipe = "graphene"
        },
        {
          type = "unlock-recipe",
          recipe = "give-explosive-rocket"
        },
      },
      prerequisites = { "frying" },
      research_trigger = {
        type = "scripted",
        icon = "__virentis-graphics__/icons/items/foods/pentapod-souffle-omelette.png",
      },
    },
    {
      type = "technology",
      name = "virentis-rocket-silo",
      order = "veab",
      subgroup = "virentis-technologies",
      essential = true,
      icons = {
        {
          icon = "__base__/graphics/technology/rocket-silo.png",
          icon_size = 256,
        },
        {
          icon = "__virentis-graphics__/icons/misc/virentis-icon.png",
          icon_size = 256,
          scale = 0.2,
          shift = { 35, 35 },
          floating = true,
        },
      },
      icon_size = 256,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "virentis-rocket-fuel"
        },
        {
          type = "unlock-recipe",
          recipe = "low-density-structure-from-graphene"
        },
      },
      prerequisites = { "tar-processing" },
      research_trigger = {
        type = "craft-item",
        item = "gived-explosive-rocket",
        count = 1000,
      },
    },
    {
      type = "technology",
      name = "cooking-fish",
      order = "veb",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/technologies/cooking-fish.png",
      icon_size = 256,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "fish-butchering"
        },
        {
          type = "unlock-recipe",
          recipe = "pentapod-bouillon"
        },
        {
          type = "unlock-recipe",
          recipe = "trade-siltcore"
        },
        {
          type = "unlock-recipe",
          recipe = "heart-of-nature"
        },
        {
          type = "unlock-recipe",
          recipe = "give-heart-of-nature"
        },
      },
      prerequisites = { "frying", "fishing-dock" },
      research_trigger = {
        type = "craft-item",
        item = "fishing-result-fish",
        count = 1,
      },
    },
    {
      type = "technology",
      name = "environment-research-center",
      order = "vfa",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/technologies/environment-research-center.png",
      icon_size = 256,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "environment-research-center"
        },
        {
          type = "unlock-recipe",
          recipe = "mudland-research-data"
        },
        {
          type = "unlock-recipe",
          recipe = "mudland-medley"
        },
      },
      prerequisites = { "tar-processing", "cooking-fish" },
      research_trigger = {
        type = "craft-item",
        item = "gived-heart-of-nature",
        count = 50,
      },
    },
    {
      type = "technology",
      name = "carbon-from-creosote",
      order = "vfb",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/technologies/carbon-from-creosote.png",
      icon_size = 256,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "carbon-from-creosote"
        },
      },
      prerequisites = { "environment-research-center" },
      unit = {
        count = 500,
        ingredients = {
          { "mudland-research-data", 1 },
        },
        time = 60
      },
    },
    {
      type = "technology",
      name = "nutrients-pulp",
      order = "vga",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/technologies/nutrients-pulp.png",
      icon_size = 256,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "nutrients-pulp"
        },
        {
          type = "unlock-recipe",
          recipe = "nutrients-bar"
        },
        {
          type = "unlock-recipe",
          recipe = "pentapod-from-nutrients-pulp"
        },
        {
          type = "unlock-recipe",
          recipe = "vegetable-oil-gleba"
        },
      },
      prerequisites = { "environment-research-center" },
      unit = {
        count = 500,
        ingredients =
        {
          { "mudland-research-data", 1 },
        },
        time = 60
      },
    },
    {
      type = "technology",
      name = "pentapus",
      order = "vgb",
      subgroup = "virentis-technologies", 
      icon = "__virentis__/graphics/icons/technologies/pentapus.png",
      icon_size = 256,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "fishing-pentapus"
        },
        {
          type = "unlock-recipe",
          recipe = "fishing-kraken"
        },
      },
      prerequisites = { "nutrients-pulp", "fishing-dock" },
      research_trigger = {
        type = "mine-entity",
        entity = "pentapus",
      },
    },
    {
      type = "technology",
      name = "nature-control",
      order = "vha",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/technologies/nature-control.png",
      icon_size = 256,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "sylva-core"
        },
        {
          type = "unlock-recipe",
          recipe = "citrus-sashimi"
        },
        {
          type = "unlock-recipe",
          recipe = "taiyaki-royale"
        },
        {
          type = "unlock-recipe",
          recipe = "trade-virta-neuron"
        },
        {
          type = "unlock-recipe",
          recipe = "fish-oil"
        },
      },
      prerequisites = { "nutrients-pulp" },
      unit = {
        count = 1000,
        ingredients =
        {
          { "mudland-research-data", 1 },
        },
        time = 60
      },
    },
    {
      type = "technology",
      name = "living-inserter",
      order = "vga",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/machines/living-inserter.png",
      icon_size = 64,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "living-inserter"
        },
      },
      prerequisites = { "nature-control", "stack-inserter" },
      unit = {
        count = 3000,
        ingredients =
        {
          { "mudland-research-data", 1 },
        },
        time = 60
      },
    },
    {
      type = "technology",
      name = "eternal-lantern",
      order = "vgb",
      subgroup = "virentis-technologies",
      icon = "__virentis-graphics__/icons/technologies/eternal-lantern.png",
      icon_size = 256,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "eternal-lantern"
        },
      },
      prerequisites = { "nature-control", "efficiency-module-3" },
      unit = {
        count = 3000,
        ingredients =
        {
          { "mudland-research-data", 1 },
        },
        time = 60
      },
    },
    {
      type = "technology",
      name = "tesla-weapons-speed",
      order = "vgc",
      subgroup = "virentis-technologies",
      icons = util.technology_icon_constant_speed("__space-age__/graphics/technology/electric-weapons-damage.png"),
      effects =
      {
        {
          type = "gun-speed",
          ammo_category = "tesla",
          icon = "__space-age__/graphics/icons/tesla-ammo.png",
          icon_size = 64,
          modifier = 0.05
        },
      },
      prerequisites = { "environment-research-center", "tesla-weapons" },
      unit =
      {
        count_formula = "1000 * 2 ^ (L - 1)",
        ingredients =
        {
          { "mudland-research-data", 1 },
        },
        time = 60
      },
      upgrade = true,
      max_level = "infinite"
    },
    {
      type = "technology",
      name = "trading-productivity",
      order = "vgd",
      subgroup = "virentis-technologies",
      icons = util.technology_icon_constant_recipe_productivity(
      "__virentis-graphics__/icons/technologies/trading-productivity.png"),
      icon_size = 256,
      effects = trading_recipes_effects,
      prerequisites = { "environment-research-center" },
      unit =
      {
        count_formula = "1000 * 2 ^ (L - 1)",
        ingredients =
        {
          { "mudland-research-data", 1 },
        },
        time = 60
      },
      max_level = "infinite",
      upgrade = true
    },
  })
