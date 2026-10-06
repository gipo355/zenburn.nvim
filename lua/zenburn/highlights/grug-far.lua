return function(c, opts)
  local ui, syn, g = c.ui, c.syn, c.git
  return {
    GrugFarHelpHeader = { fg = ui.fg_dim },
    GrugFarHelpHeaderKey = { fg = syn.keyword, bold = true },
    GrugFarHelpWinHeader = "FloatTitle",
    GrugFarHelpWinActionKey = { fg = syn.keyword, bold = true },
    GrugFarInputLabel = { fg = syn.type, bold = true },
    GrugFarInputPlaceholder = { fg = ui.fg_dim },
    GrugFarResultsHeader = { fg = ui.fg_dim },
    GrugFarResultsStats = { fg = ui.fg_dim },
    GrugFarResultsLongLineStr = { fg = ui.fg_dim },
    GrugFarResultsMatch = "Search",
    GrugFarCurrentMatch = "CurSearch",
    GrugFarResultsMatchAdded = { fg = g.add },
    GrugFarResultsMatchRemoved = { fg = g.delete, strikethrough = true },
    GrugFarResultsAddIndicator = { fg = g.add },
    GrugFarResultsChangeIndicator = { fg = g.change_fg },
    GrugFarResultsRemoveIndicator = { fg = g.delete },
    GrugFarResultsPath = { fg = syn.type },
    GrugFarResultsCmdHeader = { fg = syn.type },
    GrugFarResultsLineNr = { fg = ui.fg_faint },
    GrugFarResultsCursorLineNo = "CursorLineNr",
  }
end
