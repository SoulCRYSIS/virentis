---@param path string
---@return data.IconData[]
function uncooked_icon(path)
  return {
    {
      icon = path,
      tint = { r = 0.3, g = 0.3, b = 0.3, a = 1 },
    },
  }
end