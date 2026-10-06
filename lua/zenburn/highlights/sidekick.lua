return function(c, opts)
  local ui, syn, d, g = c.ui, c.syn, c.diag, c.git
  return {
    SidekickDiffContext = "DiffChange",
    SidekickDiffAdd = { fg = g.add, bg = c.diff.add },
    SidekickDiffDelete = { fg = g.delete, bg = c.diff.delete },
    SidekickSign = { fg = syn.keyword },
    SidekickChat = "NormalFloat",
    SidekickCliInstalled = { fg = ui.fg_dim },
    SidekickCliStarted = { fg = d.warn },
    SidekickCliAttached = { fg = syn.todo },
    SidekickCliMissing = { fg = d.error },
    SidekickCliUnavailable = { fg = d.error },
    SidekickLocDelim = { fg = ui.fg_faint },
    SidekickLocFile = { fg = syn.interface },
    SidekickLocNum = { fg = ui.fg_dim },
    SidekickLocRow = "SidekickLocDelim",
    SidekickLocCol = "SidekickLocDelim",
  }
end
