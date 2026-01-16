local item_tints = require("__base__.prototypes.item-tints")

data:extend(
  ---@type data.ToolPrototype[]
  {
    {
      type = "tool",
      name = "mudland-research-data",
      icon = "__virentis__/graphics/icons/items/environment-data/mudland-data.png",
      subgroup = "virentis-research",
      order = "a",
      stack_size = 200,
      weight = 1 * kg,
      durability = 1,
      default_import_location = "virentis",
      durability_description_key = "description.science-pack-remaining-amount-key",
      durability_description_value = "description.science-pack-remaining-amount-value",
      random_tint_color = item_tints.bluish_science,
    },
  }
)