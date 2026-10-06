return function(c, opts)
  local g = c.git
  return {
    GitSignsAdd = { fg = g.add },
    GitSignsChange = { fg = g.change },
    GitSignsDelete = { fg = g.delete },
    GitSignsChangedelete = { fg = g.change },
    GitSignsTopdelete = { fg = g.delete },
    GitSignsUntracked = { fg = g.add },
    GitSignsAddNr = { fg = g.add },
    GitSignsChangeNr = { fg = g.change },
    GitSignsDeleteNr = { fg = g.delete },
    GitSignsAddLn = { bg = c.diff.add },
    GitSignsChangeLn = { bg = c.diff.change },
    GitSignsDeleteLn = { bg = c.diff.delete },
    GitSignsAddInline = { bg = c.diff.add },
    GitSignsChangeInline = { bg = c.diff.text },
    GitSignsDeleteInline = { bg = c.diff.delete },
    GitSignsAddPreview = { bg = c.diff.add },
    GitSignsDeletePreview = { bg = c.diff.delete },
    GitSignsCurrentLineBlame = { fg = c.ui.fg_faint },
    GitSignsStagedAdd = { fg = c.palette.comment },
    GitSignsStagedChange = { fg = c.palette.change },
    GitSignsStagedDelete = { fg = c.palette.error_bg },
  }
end
