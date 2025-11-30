---@param path string
---@return data.IconData[]
function uncooked_icon(path)
  return {
    {
      icon = path,
      tint = { r = 0.7, g = 0.7, b = 0.7, a = 1 },
    },
  }
end

---@type table<string, data.RecipeTints>
recipe_tints = {
  red =  { primary = { r = 1, g = 0, b = 0, a = 1 } },
  green = { primary = { r = 0, g = 1, b = 0, a = 1 } },
  blue = { primary = { r = 0, g = 0, b = 1, a = 1 } },
  yellow = { primary = { r = 1, g = 1, b = 0, a = 1 } },
  purple = { primary = { r = 1, g = 0, b = 1, a = 1 } },
  orange = { primary = { r = 1, g = 0.5, b = 0, a = 1 } },
  brown = { primary = { r = 0.5, g = 0.25, b = 0, a = 1 } },
  gray = { primary = { r = 0.5, g = 0.5, b = 0.5, a = 1 } },
  black = { primary = { r = 0, g = 0, b = 0, a = 1 } },
  white = { primary = { r = 1, g = 1, b = 1, a = 1 } },
}