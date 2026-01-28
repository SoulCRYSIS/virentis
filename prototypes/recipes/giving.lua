local function gived_mock_item(item_name, type_name)
  local type_name = type_name or "item"
  local item = data.raw[type_name][item_name]
  return {
    type = "item",
    name = "gived-" .. item.name,
    localised_name = { "virentis-misc.gived", { "item-name." .. item_name } },
    flags = { "ignore-spoil-time-modifier" },
    icon = item.icon,
    icon_size = item.icon_size,
    subgroup = "virentis-mock",
    order = "z",
    stack_size = 100,
    weight = 10000 * kg,
    spoil_ticks = 2,
    spoil_result = nil,
    hidden = true,
    hidden_in_factoriopedia = true,
    auto_recycle = false,
  }
end

local function give_icon(path)
  return {
    {
      icon = path,
      icon_size = 64,
    },
    {
      icon = "__virentis-graphics__/icons/misc/gift.png",
      icon_size = 64,
      draw_background = true,
    }
  }
end

local function give_recipe_localised(item_name)
  return {
    "virentis-misc.give",
    { "item-name." .. item_name },
  }
end

data:extend(
  {
    {
      type = "recipe",
      name = "housewarming-gift",
      category = "trading-t1",
      subgroup = "virentis-giving",
      order = "a",
      icons = give_icon("__virentis-graphics__/icons/recipes/housewarming-gift.png"),
      ingredients = {
        { type = "item", name = "sweet-chili-sauce", amount = 50 },
        { type = "item", name = "wild-taco",         amount = 50 }
      },
      results = {
        { type = "item", name = "eternal-lantern", amount = 1 }
      },
      hide_from_player_crafting = true,
      hide_from_signal_gui = true,
      energy_required = 1,
      enabled = false,
    },
    {
      type = "recipe",
      name = "weapons-supply",
      category = "trading-t1",
      subgroup = "virentis-giving",
      order = "b",
      icons = give_icon("__virentis-graphics__/icons/recipes/weapons-supply.png"),
      ingredients = {
        { type = "item", name = "explosive-rocket", amount = 10 },
        { type = "item", name = "siltcore",         amount = 1 },
      },
      results = {
        { type = "item", name = "gived-weapons-supply", amount = 1 }
      },
      hide_from_player_crafting = true,
      hide_from_signal_gui = true,
      energy_required = 1,
      enabled = false,
    },
    {
      type = "item",
      name = "gived-weapons-supply",
      localised_name = { "virentis-misc.gived", { "item-name.weapons-supply" } },
      flags = { "ignore-spoil-time-modifier" },
      icon = "__virentis-graphics__/icons/recipes/weapons-supply.png",
      subgroup = "virentis-mock",
      order = "z",
      stack_size = 100,
      weight = 10000 * kg,
      spoil_ticks = 2,
      spoil_result = nil,
      hidden = true,
      hidden_in_factoriopedia = true,
      auto_recycle = false,
    },
  }
)
