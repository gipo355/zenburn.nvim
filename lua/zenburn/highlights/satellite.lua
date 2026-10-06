-- Not installed here; names from satellite.nvim's README.
return function(c, opts)
  local ui, d, g = c.ui, c.diag, c.git
  return {
    SatelliteBar = { bg = ui.bg_sel },
    SatelliteBackground = { bg = ui.bg_gutter },
    SatelliteCursor = { fg = ui.fg_dim },
    SatelliteMark = { fg = c.syn.keyword },
    SatelliteQuickfix = { fg = c.syn.keyword },
    SatelliteSearch = { fg = c.syn.todo },
    SatelliteSearchCurrent = { fg = c.syn.keyword },
    SatelliteDiagnosticError = { fg = d.error },
    SatelliteDiagnosticWarn = { fg = d.warn },
    SatelliteDiagnosticInfo = { fg = d.info },
    SatelliteDiagnosticHint = { fg = d.hint },
    SatelliteGitSignsAdd = { fg = g.add },
    SatelliteGitSignsChange = { fg = g.change_fg },
    SatelliteGitSignsDelete = { fg = g.delete },
  }
end
