return function(c, opts)
  local r = c.rainbow
  local groups = {}
  for i, name in ipairs({ "Red", "Yellow", "Blue", "Orange", "Green", "Violet", "Cyan" }) do
    groups["RainbowDelimiter" .. name] = { fg = r[(i - 1) % #r + 1] }
  end
  return groups
end
