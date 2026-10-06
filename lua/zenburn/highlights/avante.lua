-- Not installed here; names from avante.nvim's highlights.lua.
return function(c, opts)
  local ui, syn, d, g = c.ui, c.syn, c.diag, c.git
  local U = require("zenburn.util")
  local bg = c.palette.bg
  return {
    AvanteTitle = { fg = bg, bg = syn.keyword, bold = true },
    AvanteReversedTitle = { fg = syn.keyword },
    AvanteSubtitle = { fg = bg, bg = syn.type, bold = true },
    AvanteReversedSubtitle = { fg = syn.type },
    AvanteThirdTitle = { fg = ui.fg, bg = ui.bg_sel, bold = true },
    AvanteReversedThirdTitle = { fg = ui.bg_sel },
    AvanteConflictCurrent = { bg = c.diff.add },
    AvanteConflictIncoming = { bg = c.diff.change },
    AvanteConflictCurrentLabel = { bg = U.blend(g.add, 0.5, bg) },
    AvanteConflictIncomingLabel = { bg = U.blend(g.change, 0.8, bg) },
    AvanteToBeDeleted = { bg = c.diff.delete, strikethrough = true },
    AvanteToBeDeletedWOStrikethrough = { bg = c.diff.delete },
    AvanteSuggestion = { fg = ui.fg_faint },
    AvanteAnnotation = { fg = ui.fg_faint },
    AvantePopupHint = { fg = ui.fg_dim },
    AvanteInlineHint = { fg = ui.fg_faint },
    AvanteSidebarNormal = { fg = ui.fg, bg = ui.bg_gutter },
    AvanteSidebarWinSeparator = { fg = ui.fg_separator, bg = ui.bg_gutter },
    AvanteSidebarWinHorizontalSeparator = { fg = ui.fg_separator, bg = ui.bg_gutter },
    AvantePromptInput = { fg = ui.fg, bg = ui.bg_gutter },
    AvantePromptInputBorder = { fg = ui.fg_border, bg = ui.bg_gutter },
    AvanteButtonDefault = { fg = ui.fg, bg = ui.bg_sel },
    AvanteButtonDefaultHover = { fg = ui.fg, bg = ui.bg_ui_sel },
    AvanteButtonPrimary = { fg = bg, bg = syn.todo },
    AvanteButtonPrimaryHover = { fg = bg, bg = syn.doc_value },
    AvanteButtonDanger = { fg = bg, bg = d.error },
    AvanteButtonDangerHover = { fg = bg, bg = c.palette.red_bright },
    AvanteThinking = { fg = ui.fg_dim },
  }
end
