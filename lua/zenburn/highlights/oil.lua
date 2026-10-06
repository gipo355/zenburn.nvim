return function(c, opts)
  local ui, syn = c.ui, c.syn
  return {
    OilDir = "Directory",
    OilDirIcon = "Directory",
    OilLink = { fg = syn.interface },
    OilLinkTarget = { fg = ui.fg_dim },
    OilFile = { fg = ui.fg },
    OilHidden = { fg = ui.fg_faint },
    OilCreate = { fg = syn.todo },
    OilDelete = "DiagnosticError",
    OilMove = { fg = syn.keyword },
    OilCopy = { fg = syn.type },
    OilChange = "DiagnosticWarn",
    OilRestore = { fg = syn.todo },
    OilTrash = { fg = ui.fg_dim },
  }
end
