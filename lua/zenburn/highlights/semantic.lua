-- LSP semantic tokens. These carry the IntelliJ distinctions treesitter
-- cannot see: static methods, constants, interfaces, annotations.
--
-- Neovim sets one @lsp.typemod.<type>.<mod> mark per modifier at equal
-- priority, so "static readonly" is not addressable as one group. `static`
-- maps to the constant color because `static final` is the common case in
-- Java; a non-final static field also shows as a constant.
return function(c, opts)
  local syn = c.syn

  -- stylua: ignore
  return {
    ["@lsp.type.class"]          = "Type",
    ["@lsp.type.struct"]         = "Type",
    ["@lsp.type.enum"]           = "Type",
    ["@lsp.type.record"]         = "Type",
    ["@lsp.type.type"]           = "Type",
    ["@lsp.type.typeAlias"]      = "Type",
    ["@lsp.type.builtinType"]    = "Keyword",
    ["@lsp.type.interface"]      = { fg = syn.interface },
    ["@lsp.type.typeParameter"]  = { fg = syn.interface },
    ["@lsp.type.enumMember"]     = "Constant",
    ["@lsp.type.annotation"]     = { fg = syn.attribute },   -- jdtls
    ["@lsp.type.annotationMember"] = { fg = syn.fg },
    ["@lsp.type.decorator"]      = { fg = syn.attribute },
    ["@lsp.type.namespace"]      = { fg = syn.fg },
    ["@lsp.type.function"]       = "Function",
    ["@lsp.type.method"]         = "Function",
    ["@lsp.type.member"]         = "Function",           -- tsserver
    ["@lsp.type.macro"]          = "Function",
    ["@lsp.type.property"]       = { fg = syn.field, bold = true },
    ["@lsp.type.recordComponent"] = { fg = syn.field, bold = true },
    ["@lsp.type.variable"]       = {},                   -- treesitter decides
    ["@lsp.type.parameter"]      = {},
    ["@lsp.type.keyword"]        = "Keyword",
    ["@lsp.type.modifier"]       = "Keyword",
    ["@lsp.type.selfKeyword"]    = "Keyword",
    ["@lsp.type.selfTypeKeyword"] = "Keyword",
    ["@lsp.type.operator"]       = "Operator",
    ["@lsp.type.comment"]        = "Comment",
    ["@lsp.type.string"]         = "String",
    ["@lsp.type.regexp"]         = "String",
    ["@lsp.type.number"]         = "Number",
    ["@lsp.type.boolean"]        = "Keyword",
    ["@lsp.type.escapeSequence"] = "SpecialChar",
    ["@lsp.type.formatSpecifier"] = "SpecialChar",
    ["@lsp.type.event"]          = { fg = syn.fg },
    ["@lsp.type.lifetime"]       = "Keyword",
    ["@lsp.type.unresolvedReference"] = {},

    ["@lsp.typemod.method.static"]    = { fg = syn.static_fn },
    ["@lsp.typemod.function.static"]  = { fg = syn.static_fn },
    ["@lsp.typemod.member.static"]    = { fg = syn.static_fn },
    ["@lsp.typemod.method.constructor"] = "Function",
    ["@lsp.typemod.property.static"]  = "Constant",
    ["@lsp.typemod.variable.static"]  = "Constant",
    ["@lsp.typemod.variable.global"]  = "Constant",          -- lua_ls
    ["@lsp.typemod.variable.defaultLibrary"] = "Constant",   -- console, Math
    ["@lsp.typemod.variable.readonly"] = {},
    ["@lsp.typemod.variable.callable"] = "Function",
    ["@lsp.typemod.variable.injected"] = {},
    ["@lsp.typemod.keyword.injected"] = "Keyword",
    ["@lsp.typemod.string.injected"]  = "String",
    ["@lsp.typemod.operator.injected"] = "Operator",
    ["@lsp.typemod.class.defaultLibrary"] = "Type",
    ["@lsp.typemod.enum.defaultLibrary"] = "Type",
    ["@lsp.typemod.function.defaultLibrary"] = "Function",
    ["@lsp.typemod.method.defaultLibrary"] = "Function",
    ["@lsp.typemod.type.defaultLibrary"] = "Type",
    ["@lsp.mod.deprecated"]           = { strikethrough = true },
    ["@lsp.mod.documentation"]        = {},
  }
end
