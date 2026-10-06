-- Render a range of a file with the theme and treesitter to HTML.
-- usage: nvim --headless --clean --cmd "set rtp+=.,<nvim-treesitter>,<nvim-treesitter>/runtime" -l scripts/render.lua <file> <out.html> <first> <last>
local file, out, first, last = _G.arg[1], _G.arg[2], tonumber(_G.arg[3]), tonumber(_G.arg[4])
vim.cmd.colorscheme("zenburn")
vim.cmd.edit(file)
vim.treesitter.start()
local function hex(n) return n and string.format("#%06x", n) or nil end
local function style(name)
  local h = vim.api.nvim_get_hl(0, { name = name, link = false })
  local s = {}
  if h.fg then s[#s + 1] = "color:" .. hex(h.fg) end
  if h.bg then s[#s + 1] = "background:" .. hex(h.bg) end
  if h.bold then s[#s + 1] = "font-weight:bold" end
  if h.italic then s[#s + 1] = "font-style:italic" end
  if h.underline then s[#s + 1] = "text-decoration:underline" end
  return table.concat(s, ";")
end
local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
local lnr = style("LineNr")
local lines = vim.api.nvim_buf_get_lines(0, first - 1, last, false)
local html = { "<html><body style='margin:0;padding:12px;background:" .. hex(normal.bg) .. ";color:" .. hex(normal.fg) .. ";font:15px/1.4 monospace;white-space:pre'>" }
for i, line in ipairs(lines) do
  local row = first - 2 + i
  local parts = { string.format("<span style='%s'>%4d </span>", lnr, row + 1) }
  local col = 0
  while col < #line do
    local caps = vim.treesitter.get_captures_at_pos(0, row, col)
    local group = #caps > 0 and ("@" .. caps[#caps].capture .. "." .. caps[#caps].lang) or nil
    if group and vim.api.nvim_get_hl(0, { name = group }).link == nil and vim.tbl_isempty(vim.api.nvim_get_hl(0, { name = group })) then
      group = "@" .. caps[#caps].capture
    end
    -- extend run while capture is identical
    local run = col
    repeat
      run = run + 1
      local c2 = vim.treesitter.get_captures_at_pos(0, row, run)
      local g2 = #c2 > 0 and c2[#c2].capture or nil
      local g1 = #caps > 0 and caps[#caps].capture or nil
    until run >= #line or g2 ~= g1
    local text = line:sub(col + 1, run):gsub("&", "&amp;"):gsub("<", "&lt;")
    parts[#parts + 1] = group and string.format("<span style='%s'>%s</span>", style(group), text) or text
    col = run
  end
  html[#html + 1] = table.concat(parts)
end
html[#html + 1] = "</body></html>"
vim.fn.writefile(html, out)
vim.cmd("qa!")
