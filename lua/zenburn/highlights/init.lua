local U = require("zenburn.util")

local M = {}

-- lazy.nvim plugin name -> highlight file. Files not listed here are always
-- applied (base, treesitter, semantic, kinds).
-- stylua: ignore
M.plugins = {
  ["gitsigns.nvim"] = "gitsigns",
  ["leap.nvim"] = "leap",
  ["neotest"] = "neotest",
  ["nvim-cmp"] = "cmp",
  ["nvim-tree.lua"] = "nvim-tree",
  ["trouble.nvim"] = "trouble",
  ["which-key.nvim"] = "which-key",
}

M.always = { "base", "treesitter", "semantic", "kinds" }

---@param name string
---@return fun(c: table, opts: zenburn.Config): table
function M.get(name)
  return require("zenburn.highlights." .. name)
end

--- Which highlight files to apply for this config.
---@param opts zenburn.Config
---@return string[]
function M.enabled(opts)
  local files = {}
  for _, f in ipairs(M.always) do
    files[f] = true
  end

  local installed = opts.plugins.auto and U.lazy_plugins() or nil
  for plugin, file in pairs(M.plugins) do
    if opts.plugins.all or installed == nil or installed[plugin] then
      files[file] = true
    end
  end

  -- explicit per-plugin switches win, keyed by file or by plugin name
  for plugin, file in pairs(M.plugins) do
    local use = opts.plugins[file]
    if use == nil then
      use = opts.plugins[plugin]
    end
    if use ~= nil then
      files[file] = use or nil
    end
  end

  local names = vim.tbl_keys(files)
  table.sort(names)
  return names
end

---@param colors table
---@param opts zenburn.Config
---@return table<string, table>
function M.setup(colors, opts)
  local groups = {}
  for _, name in ipairs(M.enabled(opts)) do
    for group, hl in pairs(M.get(name)(colors, opts)) do
      groups[group] = hl
    end
  end

  if type(opts.overrides) == "function" then
    opts.overrides(groups, colors)
  else
    for group, hl in pairs(opts.overrides) do
      groups[group] = hl
    end
  end

  return U.finalize(groups, opts)
end

return M
