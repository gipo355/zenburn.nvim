-- Zenburn for Neovim, retargeted at the IntelliJ Zenburn plugin.
local M = {}

---@param opts? table see zenburn.Config
function M.setup(opts)
  require("zenburn.config").setup(opts)
end

--- Apply the colorscheme. `colors/zenburn.lua` calls this.
---@return table colors, table groups, zenburn.Config opts
function M.load()
  local opts = require("zenburn.config").get()
  local colors = require("zenburn.theme").setup(opts)
  local groups = require("zenburn.highlights").setup(colors, opts)

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "zenburn"

  for name, hl in pairs(groups) do
    vim.api.nvim_set_hl(0, name, hl)
  end

  if opts.terminal_colors then
    M.terminal(colors)
  end

  return colors, groups, opts
end

function M.terminal(c)
  local t = c.terminal
  vim.g.terminal_color_0 = t.black
  vim.g.terminal_color_8 = t.black_bright
  vim.g.terminal_color_1 = t.red
  vim.g.terminal_color_9 = t.red_bright
  vim.g.terminal_color_2 = t.green
  vim.g.terminal_color_10 = t.green_bright
  vim.g.terminal_color_3 = t.yellow
  vim.g.terminal_color_11 = t.yellow_bright
  vim.g.terminal_color_4 = t.blue
  vim.g.terminal_color_12 = t.blue_bright
  vim.g.terminal_color_5 = t.magenta
  vim.g.terminal_color_13 = t.magenta_bright
  vim.g.terminal_color_6 = t.cyan
  vim.g.terminal_color_14 = t.cyan_bright
  vim.g.terminal_color_7 = t.white
  vim.g.terminal_color_15 = t.white_bright
end

return M
