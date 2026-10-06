-- Symbol / completion kinds shared by LspKind*, BlinkCmpKind*, CmpItemKind*
-- and pickers. Each kind links to the syntax group it represents.
local M = {}

-- stylua: ignore
M.kinds = {
  Array         = "@punctuation.bracket",
  Boolean       = "@boolean",
  Class         = "@type",
  Color         = "Special",
  Constant      = "@constant",
  Constructor   = "@constructor",
  Enum          = "@lsp.type.enum",
  EnumMember    = "@lsp.type.enumMember",
  Event         = "Special",
  Field         = "@variable.member",
  File          = "Normal",
  Folder        = "Directory",
  Function      = "@function",
  Interface     = "@lsp.type.interface",
  Key           = "@variable.member",
  Keyword       = "@keyword",
  Method        = "@function.method",
  Module        = "@module",
  Namespace     = "@module",
  Null          = "@constant.builtin",
  Number        = "@number",
  Object        = "@constant",
  Operator      = "@operator",
  Package       = "@module",
  Property      = "@property",
  Reference     = "@markup.link",
  Snippet       = "Special",
  String        = "@string",
  Struct        = "@lsp.type.struct",
  Text          = "@markup",
  TypeParameter = "@lsp.type.typeParameter",
  Unit          = "@lsp.type.struct",
  Value         = "@string",
  Variable      = "@variable",
  Copilot       = "@attribute",
  Codeium       = "@attribute",
  Supermaven    = "@attribute",
  TabNine       = "@attribute",
}

--- Add `pattern:format(kind)` groups linking to LspKind<kind>.
---@param groups table
---@param pattern string e.g. "BlinkCmpKind%s"
function M.apply(groups, pattern)
  for kind in pairs(M.kinds) do
    groups[pattern:format(kind)] = "LspKind" .. kind
  end
  return groups
end

setmetatable(M, {
  __call = function(_, _c, _opts)
    local groups = {}
    for kind, link in pairs(M.kinds) do
      groups["LspKind" .. kind] = link
    end
    return groups
  end,
})

return M
