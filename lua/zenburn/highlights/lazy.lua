return function(c, opts)
  local ui, syn = c.ui, c.syn
  return {
    LazyNormal = "NormalFloat",
    LazyBackdrop = { bg = ui.bg_dark },
    LazyH1 = { fg = syn.keyword, bg = ui.bg_sel, bold = true },
    LazyH2 = "Title",
    LazyCommit = { fg = syn.number },
    LazyCommitType = { fg = syn.keyword },
    LazyCommitScope = { fg = ui.fg_dim },
    LazyDimmed = { fg = ui.fg_faint },
    LazyProp = { fg = ui.fg_dim },
    LazyLocal = { fg = syn.constant },
    LazyProgressDone = { fg = syn.todo },
    LazyProgressTodo = { fg = ui.fg_faint },
    LazySpecial = { fg = syn.keyword },
    LazyReasonEvent = { fg = syn.constant },
    LazyReasonKeys = { fg = syn.keyword },
    LazyButton = { fg = ui.fg, bg = ui.bg_visual },
    LazyButtonActive = { fg = syn.keyword, bg = ui.bg_sel, bold = true },
    LazyDir = "Directory",
    LazyBold = "Bold",
    LazyItalic = { fg = ui.fg_dim },
  }
end
