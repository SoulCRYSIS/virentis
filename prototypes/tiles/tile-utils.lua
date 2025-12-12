local virentis_tile = {}

virentis_tile.tile_lightening = 28
virentis_tile.tile_offset = 150
virentis_tile.lowland_tile_offset = 100

virentis_tile.grass_transitions = data.raw.tile["grass-1"].transitions
virentis_tile.grass_transitions_between_transitions = data.raw.tile["grass-1"].transitions_between_transitions
virentis_tile.marsh_transitions = data.raw.tile["wetland-green-slime"].transitions
virentis_tile.water_transition = data.raw.tile["water"].transitions_between_transitions

virentis_tile.lava_to_out_of_map_transition = space_age_tiles_util.lava_to_out_of_map_transition
virentis_tile.lava_stone_transitions_between_transitions = space_age_tiles_util
.lava_stone_transitions_between_transitions

virentis_tile.tile_variations_template = tile_variations_template
virentis_tile.tile_variations_template_with_transitions = tile_variations_template_with_transitions
virentis_tile.tile_variations_template_with_transitions_and_effect_map =
tile_variations_template_with_transitions_and_effect_map

virentis_tile.sound_variations = sound_variations

virentis_tile.lowland_tile_variations_template_with_transitions_and_puddle_transitions = function(high_res_picture,
                                                                                                  options)
  local result = virentis_tile.tile_variations_template_with_transitions(high_res_picture, options)

  if result.transition then
    result.transition.auxiliary_effect_mask_layout =
    {
      spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
      scale = 0.5,
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 1,
      o_transition_count = 1,
      u_transition_line_length = 1,
      o_transition_line_length = 2,
      inner_corner_x = 0,
      outer_corner_x = 576,
      side_x = 1152,
      u_transition_x = 1728,
      o_transition_x = 2304
    }
    result.transition.effect_map_layout =
    {
      spritesheet              = "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      scale                    = 0.5,
      x                        = 0,
      inner_corner_count       = 8,
      outer_corner_count       = 8,
      side_count               = 8,
      u_transition_count       = 1,
      o_transition_count       = 1,
      inner_corner_y           = 0,
      outer_corner_y           = 576,
      side_y                   = 1152,
      u_transition_y           = 1728,
      o_transition_y           = 2304,
      inner_corner_tile_height = 2,
      outer_corner_tile_height = 2,
      side_tile_height         = 2,
      u_transition_tile_height = 2,
    }
  end

  return result
end

virentis_tile.pollution_absorption = {
  land = { spores = 0.000010 },
  water = { spores = 0.000030 },
}

return virentis_tile
