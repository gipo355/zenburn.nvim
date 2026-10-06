return function(c, opts)
  local ui, syn, d = c.ui, c.syn, c.diag
  return {
    NeotestAdapterName = { fg = syn.type },
    NeotestBorder = "FloatBorder",
    NeotestDir = { fg = ui.fg_directory },
    NeotestExpandMarker = { fg = ui.fg_faint },
    NeotestFailed = { fg = d.error },
    NeotestFile = { fg = ui.fg },
    NeotestFocused = { fg = ui.fg, bold = true },
    NeotestIndent = { fg = ui.fg_faint },
    NeotestMarked = { fg = syn.keyword, bold = true },
    NeotestNamespace = { fg = syn.type },
    NeotestPassed = { fg = d.ok },
    NeotestRunning = { fg = d.warn },
    NeotestSkipped = { fg = ui.fg_dim },
    NeotestTarget = { fg = syn.keyword },
    NeotestTest = { fg = ui.fg },
    NeotestUnknown = { fg = ui.fg_dim },
    NeotestWatching = { fg = d.info },
    NeotestWinSelect = { fg = syn.keyword, bold = true },
  }
end
