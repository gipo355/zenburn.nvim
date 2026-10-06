return function(c, opts)
  local ui, syn = c.ui, c.syn
  return {
    BqfPreviewFloat = "NormalFloat",
    BqfPreviewBorder = "FloatBorder",
    BqfPreviewTitle = "FloatTitle",
    BqfPreviewThumb = "PmenuThumb",
    BqfPreviewSbar = "PmenuSbar",
    BqfPreviewCursor = "Cursor",
    -- CursorLine shares bg_float's color and would vanish in the preview
    BqfPreviewCursorLine = { bg = ui.bg_sel },
    BqfPreviewRange = "Search",
    BqfPreviewBufLabel = { fg = ui.fg_dim },
    BqfSign = { fg = syn.keyword },
  }
end
