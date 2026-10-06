return function(c, opts)
  local ui, syn = c.ui, c.syn
  return {
    OutlineCurrent = { fg = ui.fg, bg = ui.bg_visual, bold = true },
    OutlineGuides = { fg = ui.fg_faint },
    OutlineFoldMarker = { fg = ui.fg_dim },
    OutlineDetails = { fg = ui.fg_dim },
    OutlineLineno = { fg = ui.fg_faint },
    OutlineKeymapHelpKey = { fg = syn.keyword, bold = true },
    OutlineKeymapHelpDisabled = { fg = ui.fg_dim },
  }
end
