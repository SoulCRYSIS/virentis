-- local fulgora_ruin_small = table.deepcopy(data.raw["simple-entity"]["fulgoran-ruin-small"])
-- fulgora_ruin_small.minable.results = {
--   { type = "item", name = "stone", amount_min = 1, amount_max = 3 },
--   { type = "item", name = "steel-plate", amount_min = 1, amount_max = 3 },
--   { type = "item", name = "iron-gear-wheel", amount_min = 1, amount_max = 3 },
--   { type = "item", name = "copper-cable", amount_min = 1, amount_max = 3 },
-- }
-- fulgora_ruin_small.subgroup = "virentis-decoratives"
-- fulgora_ruin_small.name = "virentis-fulgoran-ruin-small"
-- fulgora_ruin_small.minable = nil
-- fulgora_ruin_small.max_health = 300
-- fulgora_ruin_small.autoplace = { probability_expression = "virentis_town_rural * 0.01" }

local fulgora_ruin_medium = table.deepcopy(data.raw["simple-entity"]["fulgoran-ruin-medium"])
fulgora_ruin_medium.subgroup = "virentis-decoratives"
fulgora_ruin_medium.name = "virentis-fulgoran-ruin-medium"
fulgora_ruin_medium.minable = {
  mining_time = 0.5,
  results = {
    { type = "item", name = "stone-brick",        amount_min = 1, amount_max = 3 },
    { type = "item", name = "electronic-circuit", amount_min = 1, amount_max = 3 },
    { type = "item", name = "steel-plate",        amount_min = 2, amount_max = 5 },
    { type = "item", name = "iron-plate",         amount_min = 2, amount_max = 5 },
    { type = "item", name = "copper-plate",       amount_min = 2, amount_max = 5 },
  }
}
fulgora_ruin_medium.autoplace = { probability_expression = "virentis_town_edge * 0.01", force = "player" }

local fulgora_ruin_stonehenge = table.deepcopy(data.raw["simple-entity"]["fulgoran-ruin-stonehenge"])
fulgora_ruin_stonehenge.subgroup = "virentis-decoratives"
fulgora_ruin_stonehenge.name = "virentis-fulgoran-ruin-stonehenge"
fulgora_ruin_stonehenge.minable = {
  mining_time = 1,
  results = {
    { type = "item", name = "stone-brick",        amount_min = 2, amount_max = 5 },
    { type = "item", name = "electronic-circuit", amount_min = 2, amount_max = 5 },
    { type = "item", name = "steel-plate",        amount_min = 4, amount_max = 8 },
    { type = "item", name = "iron-plate",         amount_min = 4, amount_max = 8 },
    { type = "item", name = "copper-plate",       amount_min = 4, amount_max = 8 },
  }
}
fulgora_ruin_stonehenge.autoplace = { probability_expression = "virentis_town_border * 0.01", force = "player" }

data:extend({
  fulgora_ruin_medium,
  fulgora_ruin_stonehenge,
})
