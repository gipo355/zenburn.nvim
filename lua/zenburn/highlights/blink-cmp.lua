return function(c, opts)
  local ui, syn = c.ui, c.syn
  local groups = {
    BlinkCmpMenu = "Pmenu",
    BlinkCmpMenuBorder = { fg = ui.fg_border, bg = ui.bg_pmenu },
    BlinkCmpMenuSelection = "PmenuSel",
    BlinkCmpScrollBarThumb = "PmenuThumb",
    BlinkCmpScrollBarGutter = "PmenuSbar",
    BlinkCmpLabel = { fg = ui.fg },
    BlinkCmpLabelDeprecated = { fg = ui.fg_dim, strikethrough = true },
    BlinkCmpLabelMatch = { fg = syn.keyword },
    BlinkCmpLabelDetail = { fg = ui.fg_dim },
    BlinkCmpLabelDescription = { fg = ui.fg_dim },
    BlinkCmpSource = { fg = ui.fg_faint },
    BlinkCmpGhostText = { fg = ui.fg_faint },
    BlinkCmpKind = { fg = ui.fg_dim },
    BlinkCmpDoc = "NormalFloat",
    BlinkCmpDocBorder = "FloatBorder",
    BlinkCmpDocSeparator = "FloatBorder",
    -- bg_cursorline equals bg_float, so a CursorLine link is invisible here
    BlinkCmpDocCursorLine = { bg = ui.bg_visual },
    BlinkCmpSignatureHelp = "NormalFloat",
    BlinkCmpSignatureHelpBorder = "FloatBorder",
    BlinkCmpSignatureHelpActiveParameter = "LspSignatureActiveParameter",
  }
  return require("zenburn.highlights.kinds").apply(groups, "BlinkCmpKind%s")
end
