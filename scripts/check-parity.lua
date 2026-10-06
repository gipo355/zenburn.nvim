-- Headless parity check against SPEC.md section 5. Run from the repo root:
--   nvim --headless --clean -u NONE --cmd 'set rtp+=.' -l scripts/check-parity.lua
-- Only listed attributes are compared; `false` asserts absence.
-- Exits non-zero on any mismatch, any italic group, or any group that keeps
-- `bold` when loaded with bold = false.

local function hex(n)
  return n and string.format("#%06x", n) or nil
end

local function get(name)
  local h = vim.api.nvim_get_hl(0, { name = name, link = false })
  return {
    fg = hex(h.fg), bg = hex(h.bg), sp = hex(h.sp),
    bold = h.bold or nil, italic = h.italic or nil,
    underline = h.underline or nil, undercurl = h.undercurl or nil,
  }
end

-- stylua: ignore
local expected = {
  -- editor chrome
  Normal                  = { fg = "#dcdccc", bg = "#3f3f3f" },
  CursorLine              = { bg = "#303030" },
  Visual                  = { bg = "#4f4f4f" },
  LineNr                  = { fg = "#656555", bg = "#383838" },
  SignColumn              = { bg = "#383838" },
  WinSeparator            = { fg = "#5f5f5f" },
  CursorLineNr            = { fg = "#dcdccc", bg = "#303030" },
  Comment                 = { fg = "#5f7f5f", bold = false },
  Search                  = { bg = "#425f44" },
  CurSearch               = { bg = "#425f44", underline = true, sp = "#56ac48" },
  MatchParen              = { bg = "#3b514d", bold = true },
  LspReferenceText        = { underline = true, sp = "#5f7f5f" },
  LspReferenceWrite       = { underline = true, sp = "#5f7f5f" },
  LspInlayHint            = { fg = "#aaa9a9", bg = "#505050" },
  DiagnosticUnderlineError = { undercurl = true, sp = "#e81a1a" },
  DiagnosticUnderlineWarn = { undercurl = true, sp = "#f0dfaf" },
  DiagnosticUnderlineInfo = { undercurl = true, sp = "#d0bf8f" },
  SpellBad                = { undercurl = true, sp = "#dcdccc" },
  -- syntax
  Keyword                 = { fg = "#f0dfaf", bold = true },
  ["@keyword.conditional"] = { fg = "#f0dfaf", bold = true },
  ["@keyword.import"]     = { fg = "#f0dfaf", bold = true },
  ["@boolean"]            = { fg = "#f0dfaf", bold = true },
  String                  = { fg = "#cc9393" },
  ["@string.escape"]      = { fg = "#ac7373", bold = true },
  Number                  = { fg = "#94bff3" },
  ["@comment.documentation"] = { fg = "#5f7f5f", bold = true },
  ["@keyword.luadoc"]     = { fg = "#6ca0a3", bold = true },
  Todo                    = { fg = "#7f9f7f" },
  Identifier              = { fg = "#dcdccc" },
  ["@variable"]           = { fg = "#dcdccc" },
  ["@variable.parameter"] = { fg = "#dcdccc" },
  Function                = { fg = "#dcdccc", bold = true },
  ["@function.call"]      = { fg = "#dcdccc", bold = true },
  ["@function.method.call"] = { fg = "#dcdccc", bold = true },
  ["@lsp.typemod.method.static"] = { fg = "#8acdd0" },
  Type                    = { fg = "#6ca0a3" },
  ["@lsp.type.class"]     = { fg = "#6ca0a3" },
  ["@lsp.type.interface"] = { fg = "#7cb8bb" },
  Constant                = { fg = "#d6d6ae", bold = true },
  ["@lsp.type.enumMember"] = { fg = "#d6d6ae", bold = true },
  ["@lsp.typemod.property.static"] = { fg = "#d6d6ae", bold = true },
  ["@variable.member"]    = { fg = "#dcdccc", bold = false },
  ["@lsp.type.property"]  = { fg = "#dcdccc", bold = false },
  BlinkIndentScope        = { fg = "#656555" },
  BlinkIndent             = { fg = "#4f4f4f" },
  ["@attribute"]          = { fg = "#6ca0a3" },
  ["@lsp.type.decorator"] = { fg = "#6ca0a3" },
  ["@tag"]                = { fg = "#b6b6a7" },
  ["@tag.attribute"]      = { fg = "#dfaf8f", bold = true },
  ["@punctuation.special"] = { fg = "#93e0e3" },
  Operator                = { fg = "#dcdccc" },
  ["@punctuation.bracket"] = { fg = "#8f8f8f" },
  ["@punctuation.delimiter"] = { fg = "#dcdccc" },
}

local keys = { "fg", "bg", "sp", "bold", "italic", "underline", "undercurl" }
local fails = 0

local function fail(msg)
  fails = fails + 1
  io.stderr:write("FAIL " .. msg .. "\n")
end

vim.cmd.colorscheme("zenburn")

local names = vim.tbl_keys(expected)
table.sort(names)
for _, name in ipairs(names) do
  local want, got = expected[name], get(name)
  for _, k in ipairs(keys) do
    local w = want[k]
    if w ~= nil and (w == false and got[k] ~= nil or w ~= false and w ~= got[k]) then
      fail(string.format("%-32s %-9s want %-8s got %s", name, k, tostring(w), tostring(got[k])))
    end
  end
end

local italic = {}
for name, h in pairs(vim.api.nvim_get_hl(0, {})) do
  if h.italic then
    italic[#italic + 1] = name
  end
end
if #italic > 0 then
  table.sort(italic)
  fail("italic groups: " .. table.concat(italic, " "))
end

vim.g.zenburn = { bold = false }
vim.cmd.colorscheme("zenburn")
local bold = {}
for name, h in pairs(vim.api.nvim_get_hl(0, {})) do
  if h.bold then
    bold[#bold + 1] = name
  end
end
if #bold > 0 then
  table.sort(bold)
  fail("bold groups with bold = false: " .. table.concat(bold, " "))
end

if fails > 0 then
  io.stderr:write(fails .. " mismatch(es)\n")
  os.exit(1)
end
print("parity OK")
