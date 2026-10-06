return function(c, opts)
  local ui, syn = c.ui, c.syn
  return {
    FlashBackdrop = { fg = ui.fg_dim },
    FlashMatch = "Search",
    FlashCurrent = "CurSearch",
    FlashLabel = { fg = c.palette.bg, bg = syn.keyword, bold = true },
    FlashPrompt = "NormalFloat",
    FlashPromptIcon = { fg = syn.keyword, bg = ui.bg_float },
    FlashCursor = "Cursor",
  }
end
