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
    BlinkCmpDoc = { fg = ui.fg, bg = ui.bg_pmenu }, -- part of the popup, usually borderless
    BlinkCmpDocBorder = { fg = ui.fg_border, bg = ui.bg_pmenu },
    BlinkCmpDocSeparator = { fg = ui.fg_border, bg = ui.bg_pmenu },
    -- bg_cursorline equals bg_float, so a CursorLine link is invisible here
    BlinkCmpDocCursorLine = { bg = ui.bg_visual },
    BlinkCmpSignatureHelp = { fg = ui.fg, bg = ui.bg_pmenu },
    BlinkCmpSignatureHelpBorder = { fg = ui.fg_border, bg = ui.bg_pmenu },
    BlinkCmpSignatureHelpActiveParameter = "LspSignatureActiveParameter",
  }
  return require("zenburn.highlights.kinds").apply(groups, "BlinkCmpKind%s")
end
