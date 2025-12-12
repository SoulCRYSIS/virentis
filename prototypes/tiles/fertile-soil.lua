data:extend({
  {
    type = "tile",
    name = "natural-jellynut-soil",
    order = "e[jellynut]-b[natural-jellynut-soil]",
    subgroup = "gleba-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "gleba_fertile_solid * 50000 - 40000 - gleba_biome_mask_red * 1000000"},
    layer_group = "ground-natural",
    layer = gleba_tile_offset + 21,
    searchable = true,

    transitions = lava_stone_transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    --[[variants =
    {
      transition = tile_graphics.generic_masked_tile_transitions1,

      material_background =
      {
        picture = "__space-age__/graphics/terrain/natural-jellynut-soil.png",
        count = 8,
        scale = 0.5
      }
    },]]
    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions_and_effect_map(
      "__space-age__/graphics/terrain/natural-jellynut-soil.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = tile_sounds.walking.semi_wet,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    build_sound = base_tile_sounds.building.landfill,
    map_color={185, 5, 166},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  }
})