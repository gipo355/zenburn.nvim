return function(c, opts)
  local ui, syn, g = c.ui, c.syn, c.git
  return {
    TelescopeNormal = "NormalFloat",
    TelescopeBorder = "FloatBorder",
    TelescopeTitle = "FloatTitle",
    TelescopePromptPrefix = { fg = syn.keyword },
    TelescopeSelection = { bg = ui.bg_visual },
    TelescopeSelectionCaret = { fg = syn.keyword, bg = ui.bg_visual },
    TelescopeMatching = { fg = syn.keyword },
    TelescopeMultiSelection = { fg = syn.type },
    TelescopeResultsDiffAdd = { fg = g.add },
    TelescopeResultsDiffChange = { fg = g.change_fg },
    TelescopeResultsDiffDelete = { fg = g.delete },
    TelescopePreviewLine = "CursorLine",
    TelescopeResultsComment = { fg = ui.fg_dim },
  }
end
