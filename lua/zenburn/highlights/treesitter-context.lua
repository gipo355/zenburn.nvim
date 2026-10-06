return function(c, opts)
  local ui = c.ui
  return {
    TreesitterContext = { bg = ui.bg_gutter },
    TreesitterContextLineNumber = { fg = ui.fg_line_nr, bg = ui.bg_gutter },
    TreesitterContextBottom = { underline = true, sp = ui.fg_border },
    -- default links to Bottom, which has no fg
    TreesitterContextLineNumberBottom = { fg = ui.fg_line_nr, bg = ui.bg_gutter, underline = true, sp = ui.fg_border },
    TreesitterContextSeparator = { fg = ui.fg_border },
  }
end
