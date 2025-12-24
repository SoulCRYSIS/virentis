data:extend(
{
  {
    type = "noise-expression",
    name = "virentis_water_frequency",
    expression = "slider_rescale(control:virentis_water:frequency, 2)"
  },
  {
    type = "noise-expression",
    name = "virentis_water_size",
    expression = "slider_rescale(control:virentis_water:size, 1 / 4)"
  },
  {
    type = "noise-expression",
    name = "virentis_moisture",
    --intended_property = "moisture",
    -- moisture follows elevation but makes the biome progression more linear. in elevation lowland is a small elevation range (20) compared to the 200+ total range.
    -- for moisture 1-0.75 is water, 0.75-0.5 is lowland, 0.5-0.25 is midland, 0.25- is highland
    -- this range is moer useful for gradual decorative blending
    -- Don't use virentis_elevation as it has a compressed low-mid transition, virentis_elevation_common is smoother
    expression = "lerp(clamp(1 - min(0.25 + (virentis_elevation_common / 80), 0.5 + (virentis_elevation_common - 20) / 400), 0, 1), 0.35, min(1, virentis_rockpools_pitrock * 5))"
  },
  {
    type = "noise-expression",
    name = "virentis_water_plant_ramp",
    expression = "clamp((0.8 - virentis_moisture) * 20, 0, 1)" -- 0 near deep water, 1 at coast edge
  },
})