return function(c, opts)
  local ui, syn, d = c.ui, c.syn, c.diag
  return {
    TroubleNormal = { fg = ui.fg, bg = ui.bg_gutter },
    TroubleNormalNC = "TroubleNormal",
    TroubleText = { fg = ui.fg },
    TroubleCount = { fg = syn.keyword },
    TroubleIndent = { fg = ui.fg_faint },
    TroubleIndentFoldOpen = { fg = ui.fg_faint },
    TroubleIndentFoldClosed = { fg = ui.fg_faint },
    TroubleIconDirectory = { fg = ui.fg_directory },
    TroubleIconFile = { fg = ui.fg },
    TroubleFilename = { fg = syn.type },
    TroubleDirectory = { fg = ui.fg_directory },
    TroublePos = { fg = ui.fg_faint },
    TroubleSource = { fg = ui.fg_dim },
    TroubleCode = { fg = ui.fg_dim },
    TroublePreview = { bg = ui.bg_sel },
    TroubleBasename = { fg = syn.type },
    TroubleIconError = "DiagnosticError",
    TroubleIconWarning = "DiagnosticWarn",
    TroubleIconInformation = "DiagnosticInfo",
    TroubleIconHint = "DiagnosticHint",
    TroubleError = "DiagnosticError",
    TroubleWarning = "DiagnosticWarn",
    TroubleInformation = "DiagnosticInfo",
    TroubleHint = "DiagnosticHint",
  }
end
