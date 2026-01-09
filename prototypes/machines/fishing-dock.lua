local virentis = require("prototypes.utils")

local dock_width = 512
local dock_height = 512
local boat_width = 224
local boat_height = 224

data:extend({
  -- Item
  virentis.default_machine_item_prototype("fishing-dock"),

  -- Recipe
  {
    type = "recipe",
    name = "fishing-dock",
    category = "crafting",
    enabled = true,
    ingredients = {
      { type = "item", name = "wood",       amount = 20 },
      { type = "item", name = "iron-plate", amount = 10 }
    },
    results = { { type = "item", name = "fishing-dock", amount = 1 } }
  },

  -- Dock Entity
  ---@type data.ContainerPrototype
  {
    type = "container",
    name = "fishing-dock",
    icon = "__virentis__/graphics/icons/machines/trader-t1.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.5, result = "fishing-dock" },
    max_health = 200,
    collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    inventory_size = 20,
    -- Allow placement on water (remove water_tile layer check by setting it false)
    -- Collision mask in 2.0: layers table.
    -- Default layers usually include water_tile. Setting it to false removes it.
    collision_mask = { layers = { item = true, object = true, player = true } },
    picture = {
      filename = "__virentis__/graphics/entities/machines/trader-t1/trader-t1.png",
      width = dock_width,
      height = dock_height,
      scale = 0.5,
      shift = util.by_pixel(0, -10)
    },
    circuit_connector = virentis.default_machine_circuit_connector,
    circuit_wire_max_distance = 9,
    radius_visualisation_specification = {
      sprite = {
        filename = "__virentis__/graphics/entities/machines/dock-radius-visualization.png",
        priority = "extra-high-no-scale",
        width = 256,
        height = 256,
      },
      distance = 16,
    }
  },

  -- Boat Entity
  {
    type = "unit",
    name = "fishing-boat",
    icon = "__virentis__/graphics/icons/machines/eternal-lantern.png",
    flags = { "placeable-neutral", "placeable-off-grid", "not-repairable", "not-on-map" },
    max_health = 100,
    subgroup = "creatures",
    order = "z",
    collision_box = { { -0.3, -0.3 }, { 0.3, 0.3 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    attack_parameters = {
      type = "projectile",
      range = 0.5,
      cooldown = 100,
      ammo_category = "melee",
      ammo_type = {
        category = "melee",
        action = { type = "direct", action_delivery = { type = "instant", target_effects = { type = "damage", damage = { amount = 0, type = "physical" } } } }
      },
      animation = {
        filename = "__virentis__/graphics/entities/machines/eternal-lantern/eternal-lantern.png",
        width = boat_width,
        height = boat_height,
        scale = 0.3,
        frame_count = 1,
        direction_count = 1
      }
    },
    vision_distance = 0,
    movement_speed = 0.1,
    distance_per_frame = 0.1,
    -- pollution_to_join_attack = 0,
    distraction_cooldown = 0,
    dying_explosion = "explosion",
    run_animation = {
      filename = "__virentis__/graphics/entities/machines/eternal-lantern/eternal-lantern.png",
      width = boat_width,
      height = boat_height,
      scale = 0.3,
      frame_count = 1,
      direction_count = 1
    },
    collision_mask = { layers = { object = true, train = true } }, -- Can move on water
    -- energy_source = {
    --   type = "burner",
    --   fuel_category = "chemical",
    --   fuel_inventory_size = 0,
    --   effectivity = 1000,
    --   initial_fuel = "infinite-fuel",
    --   smoke =
    --   {
    --     {
    --       name = "ironclad-splash",
    --       deviation = {0.5, 0.5},
    --       frequency = 40,
    --       position = {0, 2},
    --       starting_frame = 6,
    --       starting_frame_deviation = 6,
    --       height = -0.1,
    --       height_deviation = 0.2
    --     },
    --     {
    --       name = "ironclad-ripple",
    --       deviation = {1, 1},
    --       frequency = 20,
    --       position = {0, 1},
    --       height = -0.1,
    --     }
    --   }
    -- },
    -- weight = 100 * kg,
  },
  {
    type = "item",
    name = "infinite-fuel",
    icon = "__virentis__/graphics/icons/machines/eternal-lantern.png",
    stack_size = 1,
    fuel_value = "999QJ",
    fuel_category = "chemical",
    hidden = true,
  }
})
