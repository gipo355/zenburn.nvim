local opts = require("zenburn.config").get()
local c = require("zenburn.theme").setup(opts)
local p = c.palette

local bold = opts.bold and "bold" or nil

local function mode(color)
  return {
    a = { fg = p.bg, bg = color, gui = bold },
    b = { fg = c.ui.fg, bg = p.bg_sel },
    c = { fg = c.ui.fg_dim, bg = c.ui.bg_statusline },
  }
end

return {
  normal = mode(p.fg),
  insert = mode(p.green),
  visual = mode(p.field),
  replace = mode(p.string),
  command = mode(p.keyword),
  terminal = mode(p.interface),
  inactive = {
    a = { fg = c.ui.fg_faint, bg = c.ui.bg_statusline },
    b = { fg = c.ui.fg_faint, bg = c.ui.bg_statusline },
    c = { fg = c.ui.fg_faint, bg = c.ui.bg_statusline },
  },
}
