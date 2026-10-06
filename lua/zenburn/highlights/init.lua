local U = require("zenburn.util")

local M = {}

-- lazy.nvim plugin name -> highlight file. Files not listed here are always
-- applied (base, treesitter, semantic, kinds).
-- stylua: ignore
M.plugins = {
  ["blink.cmp"]              = "blink-cmp",
  ["blink.indent"]           = "blink-indent",
  ["blink.pairs"]            = "blink-pairs",
  ["codecompanion.nvim"]     = "codecompanion",
  ["copilot.lua"]            = "copilot",
  ["diffview.nvim"]          = "diffview",
  ["fidget.nvim"]            = "fidget",
  ["flash.nvim"]             = "flash",
  ["git-conflict.nvim"]      = "git-conflict",
  ["gitsigns.nvim"]          = "gitsigns",
  ["grug-far.nvim"]          = "grug-far",
  ["indent-blankline.nvim"]  = "indent-blankline",
  ["indentmini.nvim"]        = "indentmini",
  ["lazy.nvim"]              = "lazy",
  ["leap.nvim"]              = "leap",
  ["lspsaga.nvim"]           = "lspsaga",
  ["mason.nvim"]             = "mason",
  ["mini.nvim"]              = "mini",
  ["multicursor.nvim"]       = "multicursor",
  ["neogit"]                 = "neogit",
  ["neotest"]                = "neotest",
  ["noice.nvim"]             = "noice",
  ["nui.nvim"]               = "nui",
  ["nvim-bqf"]               = "bqf",
  ["nvim-cmp"]               = "cmp",
  ["nvim-dap"]               = "dap",
  ["nvim-dap-ui"]            = "dap-ui",
  ["nvim-dap-virtual-text"]  = "dap-virtual-text",
  ["nvim-tree.lua"]          = "nvim-tree",
  ["nvim-treesitter-context"]= "treesitter-context",
  ["oil.nvim"]               = "oil",
  ["outline.nvim"]           = "outline",
  ["rainbow-delimiters.nvim"]= "rainbow-delimiters",
  ["render-markdown.nvim"]   = "render-markdown",
  ["sidekick.nvim"]          = "sidekick",
  ["snacks.nvim"]            = "snacks",
  ["telescope.nvim"]         = "telescope",
  ["todo-comments.nvim"]     = "todo-comments",
  ["trouble.nvim"]           = "trouble",
  ["vim-dadbod-ui"]          = "dadbod-ui",
  ["vim-matchup"]            = "matchup",
  ["which-key.nvim"]         = "which-key",
  ["yanky.nvim"]             = "yanky",
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
