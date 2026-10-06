-- Not installed here; names from nvim-spectre's README.
return function(c, opts)
  local ui, syn, g = c.ui, c.syn, c.git
  return {
    SpectreHeader = { fg = syn.type, bold = true },
    SpectreBody = { fg = ui.fg },
    SpectreFile = { fg = syn.type },
    SpectreDir = { fg = ui.fg_dim },
    SpectreSearch = { fg = g.delete, bg = c.diff.delete },
    SpectreReplace = { fg = g.add, bg = c.diff.add },
    SpectreBorder = "FloatBorder",
  }
end
