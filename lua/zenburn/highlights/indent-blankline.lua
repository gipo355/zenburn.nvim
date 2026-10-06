return function(c, opts)
  local ui = c.ui
  return {
    IblIndent = { fg = ui.fg_indent },
    IblWhitespace = { fg = ui.fg_whitespace },
    IblScope = { fg = ui.fg_indent_scope },
  }
end
