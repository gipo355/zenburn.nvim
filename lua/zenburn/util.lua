local M = {}

local function rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

--- Mix `fg` into `bg`: alpha 1 = fg, 0 = bg.
---@param fg string
---@param alpha number
---@param bg string
---@return string
function M.blend(fg, alpha, bg)
  local fr, fg_, fb = rgb(fg)
  local br, bg_, bb = rgb(bg)
  local function ch(a, b)
    local v = alpha * a + (1 - alpha) * b
    return math.floor(math.min(math.max(0, v), 255) + 0.5)
  end
  return string.format("#%02x%02x%02x", ch(fr, br), ch(fg_, bg_), ch(fb, bb))
end

--- Turn `Group = "Other"` shorthands into links and drop `bold` when disabled.
---@param groups table<string, table|string>
---@param opts zenburn.Config
function M.finalize(groups, opts)
  for name, hl in pairs(groups) do
    if type(hl) == "string" then
      hl = { link = hl }
      groups[name] = hl
    end
    if not opts.bold then
      hl.bold = nil
    end
  end
  return groups
end

--- lazy.nvim plugin names, or nil when lazy is not the manager.
---@return table<string, boolean>|nil
function M.lazy_plugins()
  if not package.loaded.lazy then
    return nil
  end
  local ok, cfg = pcall(require, "lazy.core.config")
  if not ok then
    return nil
  end
  local names = {}
  for name in pairs(cfg.plugins) do
    names[name] = true
  end
  return names
end

return M
