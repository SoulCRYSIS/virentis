local biolab = table.deepcopy(data.raw["lab"]["biolab"])
biolab.name = "virentis-biolab"
biolab.inputs = { "mudland-research-data" }
biolab.energy_source = {
  type = "burner",
  fuel_categories = { "nutrients" },
  effectivity = 1,
  burner_usage = "nutrients",
  fuel_inventory_size = 1,
}
biolab.energy_usage = "5MW"

data:extend({ biolab })