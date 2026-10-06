return function(c, opts)
  local ui, syn = c.ui, c.syn
  return {
    MasonNormal = "NormalFloat",
    MasonBackdrop = { bg = ui.bg_dark },
    MasonHeader = { fg = syn.keyword, bg = ui.bg_sel, bold = true },
    MasonHeaderSecondary = { fg = syn.type, bg = ui.bg_sel, bold = true },
    MasonHighlight = { fg = syn.keyword },
    MasonHighlightSecondary = { fg = syn.type },
    MasonHighlightBlock = { fg = syn.keyword, bg = ui.bg_sel },
    MasonHighlightBlockBold = { fg = syn.keyword, bg = ui.bg_sel, bold = true },
    MasonHighlightBlockSecondary = { fg = syn.type, bg = ui.bg_sel },
    MasonHighlightBlockBoldSecondary = { fg = syn.type, bg = ui.bg_sel, bold = true },
    MasonMuted = { fg = ui.fg_dim },
    MasonMutedBlock = { fg = ui.fg_dim, bg = ui.bg_visual },
    MasonMutedBlockBold = { fg = ui.fg_dim, bg = ui.bg_visual },
    MasonHeading = "Title",
  }
end
