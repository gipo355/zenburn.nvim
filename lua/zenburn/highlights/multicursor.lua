return function(c, opts)
  local ui, syn = c.ui, c.syn
  return {
    MultiCursorCursor = "Cursor",
    MultiCursorVisual = "Visual",
    MultiCursorSign = { fg = syn.keyword },
    MultiCursorMatchPreview = "Search",
    MultiCursorDisabledCursor = { fg = ui.fg_dim, bg = ui.bg_sel },
    MultiCursorDisabledVisual = { fg = ui.fg_dim, bg = ui.bg_sel },
    MultiCursorDisabledSign = { fg = ui.fg_dim },
  }
end
