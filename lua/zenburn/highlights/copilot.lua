return function(c, opts)
  local ui = c.ui
  return {
    CopilotSuggestion = { fg = ui.fg_faint },
    CopilotAnnotation = { fg = ui.fg_faint },
  }
end
