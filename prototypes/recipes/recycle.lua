local no_recycle_recipe_subgroups = {
  "virentis-crops",
  "virentis-cultivation",
  "virentis-foods-basic",
  "virentis-foods-trade-item",
  "virentis-microorganism",
  "virentis-trades",
  "virentis-fluids",
  "virentis-chemicals-organic",
  "virentis-butching",
  "virentis-giving",
}

for _, subgroup in pairs(no_recycle_recipe_subgroups) do
  for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.subgroup == subgroup then
      recipe.auto_recycle = false
    end
  end
end