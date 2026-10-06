return function(c, opts)
  local ui, syn = c.ui, c.syn
  return {
    WhichKey = { fg = syn.keyword, bold = true },
    WhichKeyGroup = { fg = syn.type },
    WhichKeyDesc = { fg = ui.fg },
    WhichKeySeparator = { fg = ui.fg_faint },
    WhichKeyValue = { fg = ui.fg_dim },
    WhichKeyNormal = "NormalFloat",
    WhichKeyBorder = "FloatBorder",
    WhichKeyTitle = "FloatTitle",
    WhichKeyIcon = { fg = syn.interface },
    WhichKeyIconAzure = { fg = syn.interface },
    WhichKeyIconBlue = { fg = syn.interface },
    WhichKeyIconCyan = { fg = syn.template },
    WhichKeyIconGreen = { fg = syn.todo },
    WhichKeyIconGrey = { fg = ui.fg_dim },
    WhichKeyIconOrange = { fg = syn.field },
    WhichKeyIconPurple = { fg = c.palette.magenta },
    WhichKeyIconRed = { fg = c.diag.error },
    WhichKeyIconYellow = { fg = syn.keyword },
  }
end
