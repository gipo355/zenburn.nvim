-- Treesitter captures, Neovim 0.10+ names. One keyword color, functions are
-- bold text, fields orange bold, types teal. Markup and docs carry cues by
-- color only: no italic anywhere.
return function(c, opts)
  local ui, syn, d = c.ui, c.syn, c.diag

  -- stylua: ignore
  local ret = {
    ["@variable"]                   = { fg = syn.fg },
    ["@variable.builtin"]           = "Keyword",   -- this, self, super
    ["@variable.parameter"]         = { fg = syn.fg },
    ["@variable.parameter.builtin"] = { fg = syn.fg },
    ["@variable.member"]            = { fg = syn.field, bold = true },

    ["@constant"]                   = "Constant",
    ["@constant.builtin"]           = "Keyword",   -- nil, null, undefined
    ["@constant.macro"]             = "Constant",

    ["@module"]                     = { fg = syn.fg },
    ["@module.builtin"]             = { fg = syn.fg },
    ["@label"]                      = { fg = syn.fg },

    ["@string"]                     = "String",
    ["@string.documentation"]       = "Comment",
    ["@string.regexp"]              = "String",
    ["@string.escape"]              = "SpecialChar",
    ["@string.special"]             = "String",
    ["@string.special.symbol"]      = "String",
    ["@string.special.path"]        = "String",
    ["@string.special.url"]         = { fg = ui.fg_link, underline = true },
    ["@character"]                  = "Character",
    ["@character.special"]          = "SpecialChar",
    ["@character.printf"]           = "SpecialChar",
    ["@boolean"]                    = "Keyword",
    ["@number"]                     = "Number",
    ["@number.float"]               = "Number",

    ["@type"]                       = "Type",
    ["@type.builtin"]               = "Keyword",   -- int, string: keywords in IJ
    ["@type.definition"]            = "Type",
    ["@type.qualifier"]             = "Keyword",
    ["@attribute"]                  = { fg = syn.attribute },
    ["@attribute.builtin"]          = { fg = syn.attribute },
    ["@property"]                   = { fg = syn.field, bold = true },
    ["@property.json"]              = { fg = syn.fg, bold = true },   -- JSON.PROPERTY_KEY
    ["@property.jsonc"]             = { fg = syn.fg, bold = true },
    ["@property.yaml"]              = { fg = syn.fg, bold = true },
    ["@property.toml"]              = { fg = syn.fg, bold = true },
    ["@property.css"]               = { fg = syn.fg },
    ["@property.scss"]              = { fg = syn.fg },

    ["@function"]                   = "Function",
    ["@function.builtin"]           = "Function",
    ["@function.call"]              = "Function",
    ["@function.macro"]             = "Function",
    ["@function.method"]            = "Function",
    ["@function.method.call"]       = "Function",
    ["@constructor"]                = "Function",
    ["@constructor.lua"]            = "@punctuation.bracket",
    ["@operator"]                   = "Operator",

    ["@keyword"]                    = "Keyword",
    ["@keyword.coroutine"]          = "Keyword",
    ["@keyword.function"]           = "Keyword",
    ["@keyword.operator"]           = "Keyword",
    ["@keyword.import"]             = "Keyword",
    ["@keyword.type"]               = "Keyword",
    ["@keyword.modifier"]           = "Keyword",
    ["@keyword.repeat"]             = "Keyword",
    ["@keyword.return"]             = "Keyword",
    ["@keyword.debug"]              = "Keyword",
    ["@keyword.exception"]          = "Keyword",
    ["@keyword.conditional"]        = "Keyword",
    ["@keyword.conditional.ternary"] = "Operator",
    ["@keyword.directive"]          = "Keyword",
    ["@keyword.directive.define"]   = "Keyword",
    ["@keyword.storage"]            = "Keyword",
    ["@keyword.export"]             = "Keyword",

    ["@punctuation.delimiter"]      = { fg = syn.delimiter },
    ["@punctuation.bracket"]        = { fg = syn.bracket },
    ["@punctuation.special"]        = { fg = syn.template },   -- ${} in templates

    ["@comment"]                    = "Comment",
    ["@comment.documentation"]      = { fg = syn.comment, bold = true },   -- DEFAULT_DOC_COMMENT
    ["@comment.error"]              = "Todo",
    ["@comment.warning"]            = "Todo",
    ["@comment.todo"]               = "Todo",
    ["@comment.note"]               = "Todo",

    -- doc comment tags (luadoc, jsdoc, phpdoc injections)
    ["@keyword.luadoc"]             = { fg = syn.doc_tag, bold = true },
    ["@keyword.jsdoc"]              = { fg = syn.doc_tag, bold = true },
    ["@keyword.phpdoc"]             = { fg = syn.doc_tag, bold = true },
    ["@keyword.return.luadoc"]      = { fg = syn.doc_tag, bold = true },
    ["@variable.parameter.luadoc"]  = { fg = syn.doc_value },
    ["@variable.parameter.jsdoc"]   = { fg = syn.doc_value },
    ["@variable.parameter.phpdoc"]  = { fg = syn.doc_value },
    ["@type.luadoc"]                = { fg = syn.type },
    ["@type.jsdoc"]                 = { fg = syn.type },
    ["@punctuation.bracket.luadoc"] = { fg = syn.comment },
    ["@punctuation.bracket.jsdoc"]  = { fg = syn.comment },
    ["@punctuation.delimiter.luadoc"] = { fg = syn.comment },
    ["@punctuation.delimiter.jsdoc"] = { fg = syn.comment },
    ["@markup.raw.jsdoc"]           = { fg = syn.doc_markup },

    -- markup (markdown, help, rst)
    ["@markup"]                     = { fg = syn.fg },
    ["@markup.strong"]              = { bold = true },
    ["@markup.italic"]              = { fg = syn.doc_value },   -- color carries the cue
    ["@markup.strikethrough"]       = { strikethrough = true },
    ["@markup.underline"]           = { underline = true },
    ["@markup.heading"]             = "Title",
    ["@markup.quote"]               = { fg = ui.fg_dim },
    ["@markup.math"]                = "Number",
    ["@markup.environment"]         = "Keyword",
    ["@markup.environment.name"]    = "Type",
    ["@markup.link"]                = { fg = syn.type },
    ["@markup.link.label"]          = { fg = syn.type },
    ["@markup.link.label.symbol"]   = { fg = syn.type },
    ["@markup.link.url"]            = { fg = ui.fg_link, underline = true },
    ["@markup.raw"]                 = { fg = syn.doc_markup },
    ["@markup.raw.block"]           = { fg = syn.fg },
    ["@markup.list"]                = { fg = syn.keyword },
    ["@markup.list.checked"]        = { fg = d.ok },
    ["@markup.list.unchecked"]      = { fg = ui.fg_dim },
    ["@punctuation.special.markdown"] = { fg = syn.keyword },

    ["@tag"]                        = "Tag",
    ["@tag.builtin"]                = "Tag",
    ["@tag.attribute"]              = { fg = syn.tag_attr, bold = true },
    ["@tag.delimiter"]              = { fg = syn.tag },

    ["@diff.plus"]                  = "Added",
    ["@diff.minus"]                 = "Removed",
    ["@diff.delta"]                 = "Changed",

    ["@none"]                       = {},
    ["@spell"]                      = {},
    ["@nospell"]                    = {},
  }

  for i, color in ipairs(c.rainbow) do
    ret["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
  end

  return ret
end
