return function(c, opts)
  local ui = c.ui
  return {
    IndentLine = { fg = ui.fg_indent },
    IndentLineCurrent = { fg = ui.fg_indent_scope },
  }
end
