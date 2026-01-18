local virentis = require("prototypes.utils")

local gleba_plants = {
  ["yumako-tree"] = true,
  ["jellystem"] = true,
  ["tree-plant"] = true,
}

local virentis_plants = {
  ["redbloom-tree"] = true,
  ["nyxoleum-tree"] = true,
  ["mangroove-tree"] = true,
  ["rockmalt-tree"] = true,
}

local ignore_set = {}
for _, name in pairs(quality_seeds.ignore_plants or {}) do
  ignore_set[name] = true
end

-- Change cultivator ingredients to sylva core
for _, plant in pairs(data.raw["plant"]) do
  if not ignore_set[plant.name] and data.raw["recipe-category"]["cultivation-" .. plant.name] then
    local recipe_category = data.raw["recipe-category"]["cultivation-" .. plant.name]
    recipe_category.subgroup = "virentis-cultivation"

    local cultivator = data.raw["assembling-machine"][plant.name .. "-greenhouse"]
    cultivator.energy_source.effectivity = 1
    cultivator.energy_usage = "200kW"
    cultivator.fluid_boxes = {
      {
        production_type = "output",
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = { 0, 1 }
          }
        }
      },
      table.unpack(virentis.pass_middle_fluid_box),
    }
    cultivator.subgroup = "virentis-cultivation"
    cultivator.order = "b"

    local cultivator_item = data.raw["item"][cultivator.name]
    cultivator_item.subgroup = "virentis-cultivation"
    cultivator_item.order = "b"

    local cultivator_recipe = data.raw["recipe"][cultivator.name]
    cultivator_recipe.ingredients[4] = { type = "item", name = "sylva-core", amount = 1 }
    cultivator_recipe.ingredients[5] = { type = "item", name = "landfill", amount = 8 }
    table.insert(cultivator_recipe.ingredients, { type = "item", name = "firebrick", amount = 4 })
    cultivator_recipe.surface_conditions = nil
    cultivator_recipe.subgroup = "virentis-cultivation"
    cultivator_recipe.order = "b"
    cultivator_recipe.energy_required = 10

    local cultivate_recipe = data.raw["recipe"]["cultivate-" .. plant.name]
    cultivate_recipe.subgroup = "virentis-cultivation"
    cultivate_recipe.energy_required = plant.growth_ticks / 60
    cultivate_recipe.order = "ca"
    if plant.name == "nyxoleum-tree" then
      cultivate_recipe.ingredients[2] = { type = "fluid", name = "tar", amount = 50 }
    end
    local plant_harvest_results = table.deepcopy(plant.minable.results)
    local spore_emmisions = 0
    if plant.harvest_emissions and plant.harvest_emissions.spores then
      spore_emmisions = plant.harvest_emissions.spores
    end
    if spore_emmisions > 0 then
      table.insert(plant_harvest_results, { type = "fluid", name = "spores", amount = spore_emmisions * 60 })
    end
    cultivate_recipe.results = plant_harvest_results


    local cultivate_space_recipe = data.raw["recipe"]["cultivate-space-" .. plant.name]
    cultivate_space_recipe.subgroup = "virentis-cultivation"
    cultivate_space_recipe.order = "cb"
    if plant.name == "nyxoleum-tree" then
      cultivate_space_recipe.ingredients[2] = { type = "fluid", name = "tar", amount = 50 }
    end

    data.raw["recipe"]["gmo-" .. plant.name] = nil

    if gleba_plants[plant.name] then
      cultivator_recipe.ingredients[1] = { type = "item", name = "gleba-fertilizer", amount = 5 }
      table.insert(cultivate_recipe.ingredients, { type = "item", name = "gleba-fertilizer", amount = 1 })
      table.insert(cultivate_space_recipe.ingredients, { type = "item", name = "gleba-fertilizer", amount = 1 })
      if plant.name == "tree-plant" then
        cultivator.surface_conditions = {
          {
            property = "pressure",
            min = 1000,
            max = 1000
          }
        }
      end
      cultivator.surface_conditions = {
        {
          property = "pressure",
          min = 2000,
          max = 2000
        }
      }
    elseif virentis_plants[plant.name] then
      cultivator_recipe.ingredients[1] = { type = "item", name = "virentis-fertilizer", amount = 5 }
      table.insert(cultivate_recipe.ingredients, { type = "item", name = "virentis-fertilizer", amount = 1 })
      table.insert(cultivate_space_recipe.ingredients, { type = "item", name = "virentis-fertilizer", amount = 1 })
      cultivator.surface_conditions = {
        {
          property = "pressure",
          min = 1200,
          max = 1200
        }
      }
    end
  end
end

local cultivation_tech = data.raw["technology"]["fruit-cultivation"]
cultivation_tech.prerequisites = { "nature-control" }
cultivation_tech.unit = {
  count = 2000,
  ingredients = {
    { "mudland-research-data", 1 },
  },
  time = 60,
}
local unlocks = {}
for _, effect in pairs(cultivation_tech.effects) do
  if effect.recipe:sub(1, 4) ~= "gmo-" then
    table.insert(unlocks, effect)
  end
end
table.insert(unlocks, {
  type = "unlock-recipe",
  recipe = "virentis-fertilizer"
})
table.insert(unlocks, {
  type = "unlock-recipe",
  recipe = "gleba-fertilizer"
})
cultivation_tech.effects = unlocks

local space_cultivator = data.raw["assembling-machine"]["space-cultivator"]
space_cultivator.subgroup = "virentis-cultivation"
space_cultivator.order = "c"
space_cultivator.energy_source.effectivity = 1
space_cultivator.energy_usage = "100kW"
space_cultivator.effect_receiver.base_effect = {
  productivity = 1,
}

local space_cultivator_item = data.raw["item"][space_cultivator.name]
space_cultivator_item.subgroup = "virentis-cultivation"
space_cultivator_item.order = "c"

local spore_tower = data.raw["furnace"]["spore-tower"]
spore_tower.subgroup = "virentis-cultivation"
spore_tower.order = "ac"
spore_tower.allowed_effects = { "speed" }
spore_tower.module_slots = 2

local spore_tower_item = data.raw["item"][spore_tower.name]
spore_tower_item.subgroup = "virentis-cultivation"
spore_tower_item.order = "ac"

local spores = data.raw["fluid"]["spores"]
spores.subgroup = "virentis-fluids"
spores.order = "c"
