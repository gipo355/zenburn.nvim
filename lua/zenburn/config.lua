local M = {}

---@class zenburn.Config
---@field transparent_background boolean
---@field bold boolean strip `bold` from every group when false
---@field dim_inactive boolean darker background in inactive windows
---@field terminal_colors boolean set vim.g.terminal_color_*
---@field plugins table<string, boolean> `auto` detects lazy.nvim plugins, `all` enables every file, `<name> = false` disables one
---@field overrides table<string, table>|fun(groups: table, colors: table) merged last
M.defaults = {
  transparent_background = false,
  bold = true,
  dim_inactive = false,
  terminal_colors = true,
  plugins = { auto = true, all = false },
  overrides = {},
}

---@type zenburn.Config|nil
M.options = nil

---@param opts? table
function M.setup(opts)
  M.options = opts or {}
end

--- defaults < vim.g.zenburn < setup(opts)
---@return zenburn.Config
function M.get()
  local g = vim.g.zenburn
  if type(g) == "function" then
    g = g()
  end
  return vim.tbl_deep_extend("force", {}, M.defaults, g or {}, M.options or {})
end

return M
