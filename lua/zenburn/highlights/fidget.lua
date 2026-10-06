-- Current fidget only uses stock groups (Comment, Title, Question, Constant, ...)
-- chosen in its setup options; these are the legacy-branch groups.
return function(c, opts)
  local ui, syn = c.ui, c.syn
  return {
    FidgetTitle = { fg = syn.type, bold = true },
    FidgetTask = { fg = ui.fg_dim },
  }
end
