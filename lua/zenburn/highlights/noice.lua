return function(c, opts)
  local ui, syn = c.ui, c.syn
  local groups = {
    NoiceCmdlineIcon = { fg = syn.keyword },
    NoiceCmdlineIconSearch = { fg = syn.special },
    NoiceCmdlinePopup = "NormalFloat",
    NoiceCmdlinePopupBorder = "FloatBorder",
    NoiceCmdlinePopupTitle = "FloatTitle",
    NoiceCmdlinePopupBorderSearch = "FloatBorder",
    NoiceConfirm = "NormalFloat",
    NoiceConfirmBorder = { fg = syn.type, bg = ui.bg_float },
    NoiceMini = "NormalFloat",
    NoicePopup = "NormalFloat",
    NoicePopupBorder = "FloatBorder",
    NoicePopupmenuMatch = { fg = syn.keyword },
    NoiceFormatProgressDone = { bg = ui.bg_sel },
    NoiceFormatProgressTodo = "CursorLine",
    NoiceFormatEvent = { fg = ui.fg_faint },
    NoiceFormatKind = { fg = ui.fg_faint },
    NoiceFormatDate = { fg = ui.fg_dim },
    NoiceFormatLevelDebug = { fg = ui.fg_faint },
    NoiceFormatLevelTrace = { fg = ui.fg_faint },
    NoiceFormatLevelOff = { fg = ui.fg_faint },
    NoiceLspProgressSpinner = { fg = syn.keyword },
    NoiceLspProgressTitle = { fg = ui.fg_dim },
    NoiceLspProgressClient = { fg = syn.type },
    NoiceCompletionItemMenu = { fg = ui.fg_dim },
    NoiceCompletionItemWord = { fg = ui.fg },
    NoiceCompletionItemKindDefault = { fg = syn.special },
  }
  -- noice links per-kind titles to the per-kind border, so titles would take the border color
  for _, kind in ipairs({ "Cmdline", "Search", "Filter", "Lua", "Help", "Calculator", "Input", "IncRename" }) do
    groups["NoiceCmdlinePopupTitle" .. kind] = "FloatTitle"
  end
  return require("zenburn.highlights.kinds").apply(groups, "NoiceCompletionItemKind%s")
end
