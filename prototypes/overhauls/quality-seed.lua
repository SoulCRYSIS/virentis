local allow_plants = {
  "rockmalt-tree",
  "redbloom-tree",
  "nyxoleum-tree",
  "mangroove-tree",
  "yumako-tree",
  "jellystem",
  "tree-plant",
}

for _, plant in ipairs(allow_plants) do
  table.insert(quality_seeds.allow_plants, plant)
end