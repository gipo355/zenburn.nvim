return function(c, opts)
  local ui, syn = c.ui, c.syn
  local groups = {
    CmpItemAbbr = { fg = ui.fg },
    CmpItemAbbrDeprecated = { fg = ui.fg_dim, strikethrough = true },
    CmpItemAbbrMatch = { fg = syn.keyword },
    CmpItemAbbrMatchFuzzy = { fg = syn.keyword },
    CmpItemMenu = { fg = ui.fg_dim },
    CmpItemKindDefault = { fg = ui.fg_dim },
    CmpGhostText = { fg = ui.fg_faint },
    CmpDocumentation = "NormalFloat",
    CmpDocumentationBorder = "FloatBorder",
  }
  return require("zenburn.highlights.kinds").apply(groups, "CmpItemKind%s")
end
