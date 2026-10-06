return function(c, opts)
  local ui, r = c.ui, c.rainbow
  local groups = {
    BlinkIndent = { fg = ui.fg_indent },
    BlinkIndentScope = { fg = ui.fg_indent_scope },
  }
  -- rainbow guides stay in the warm set, pulled toward the background
  local names = { "Red", "Orange", "Yellow", "Green", "Cyan", "Blue", "Violet" }
  for i, name in ipairs(names) do
    local color = require("zenburn.util").blend(r[(i - 1) % #r + 1], 0.5, c.palette.bg)
    groups["BlinkIndent" .. name] = { fg = color }
    groups["BlinkIndent" .. name .. "Underline"] = { sp = color, underline = true }
  end
  return groups
end
