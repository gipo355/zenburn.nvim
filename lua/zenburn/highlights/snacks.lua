return function(c, opts)
  local ui, syn, d, g = c.ui, c.syn, c.diag, c.git
  local blend = require("zenburn.util").blend
  local groups = {
    -- win
    SnacksNormal = "NormalFloat",
    SnacksNormalNC = "NormalFloat",
    SnacksTitle = "FloatTitle",
    SnacksFooter = "FloatFooter",
    SnacksFooterKey = { fg = syn.keyword, bg = ui.bg_float, bold = true },
    SnacksFooterDesc = { fg = ui.fg_dim, bg = ui.bg_float },
    SnacksWinBar = "Title",
    SnacksWinBarNC = { fg = ui.fg_dim },
    SnacksWinKey = { fg = syn.keyword, bold = true },
    SnacksWinKeySep = { fg = ui.fg_faint },
    SnacksWinKeyDesc = { fg = ui.fg },
    SnacksWinSeparator = "WinSeparator",
    SnacksBackdrop = { bg = ui.bg_dark },

    -- picker windows
    SnacksPicker = "NormalFloat",
    SnacksPickerBorder = "FloatBorder",
    SnacksPickerTitle = "FloatTitle",
    SnacksPickerFooter = "FloatFooter",
    SnacksPickerCursorLine = "CursorLine",
    SnacksPickerInputBorder = { fg = syn.keyword, bg = ui.bg_float },
    SnacksPickerInputTitle = "FloatTitle",
    SnacksPickerListTitle = "FloatTitle",
    SnacksPickerPreviewTitle = "FloatTitle",
    SnacksPickerListCursorLine = "Visual",
    SnacksPickerPickWin = { fg = c.palette.bg, bg = syn.keyword, bold = true },
    SnacksPickerPickWinCurrent = { fg = c.palette.bg, bg = syn.special, bold = true },

    -- picker content
    SnacksPickerMatch = { fg = syn.keyword },
    SnacksPickerSearch = "Search",
    SnacksPickerPrompt = { fg = syn.keyword },
    SnacksPickerInputSearch = { fg = syn.keyword },
    SnacksPickerLabel = { fg = syn.keyword, bold = true },
    SnacksPickerTotals = { fg = ui.fg_faint },
    SnacksPickerFile = { fg = ui.fg },
    SnacksPickerDirectory = "Directory",
    SnacksPickerDir = { fg = ui.fg_dim },
    SnacksPickerPathHidden = { fg = ui.fg_dim },
    SnacksPickerPathIgnored = { fg = ui.fg_faint },
    SnacksPickerLink = { fg = syn.interface },
    SnacksPickerLinkBroken = "DiagnosticError",
    SnacksPickerRow = { fg = ui.fg_dim },
    SnacksPickerCol = { fg = ui.fg_faint },
    SnacksPickerDesc = { fg = ui.fg_dim },
    SnacksPickerSpinner = { fg = syn.keyword },
    SnacksPickerSelected = { fg = syn.keyword },
    SnacksPickerUnselected = { fg = ui.fg_faint },
    SnacksPickerIdx = { fg = ui.fg_dim },
    SnacksPickerCmd = { fg = ui.fg },
    SnacksPickerCmdBuiltin = { fg = syn.type },
    SnacksPickerBold = "Bold",
    SnacksPickerItalic = { fg = ui.fg_dim },
    SnacksPickerTree = { fg = ui.fg_indent },
    SnacksPickerTime = { fg = ui.fg_dim },
    SnacksPickerAuEvent = { fg = syn.constant },
    SnacksPickerDiagnosticCode = { fg = ui.fg_dim },
    SnacksPickerKeymapLhs = { fg = syn.keyword },
    SnacksPickerKeymapRhs = { fg = ui.fg_dim },
    SnacksPickerKeymapNowait = { fg = syn.special },
    SnacksPickerBufNr = { fg = ui.fg_dim },
    SnacksPickerBufFlags = { fg = ui.fg_faint },
    SnacksPickerBufType = { fg = syn.type },
    SnacksPickerUndoCurrent = { fg = syn.keyword },
    SnacksPickerGitCommit = { fg = syn.number },
    SnacksPickerGitDate = { fg = ui.fg_dim },
    SnacksPickerGitBranch = { fg = syn.type },
    SnacksPickerGitBranchCurrent = { fg = syn.keyword, bold = true },
    SnacksPickerGitAuthor = { fg = syn.type },
    SnacksPickerGitType = { fg = syn.keyword },
    SnacksPickerGitScope = { fg = ui.fg_dim },
    SnacksPickerGitMsg = { fg = ui.fg },
    SnacksPickerGitStatusModified = "Changed",
    SnacksPickerGitStatusUntracked = { fg = ui.fg_dim },
    SnacksPickerGitStatusIgnored = { fg = ui.fg_faint },
    SnacksPickerGitStatusUnmerged = { fg = g.conflict },
    SnacksPickerManDesc = { fg = ui.fg_dim },
    SnacksPickerNotificationMessage = { fg = ui.fg },
    SnacksPickerIconSource = { fg = syn.constant },
    SnacksPickerIconName = { fg = syn.keyword },

    -- picker diff
    SnacksDiffHeader = { fg = syn.type, bold = true },
    SnacksDiffHunkHeader = { fg = ui.fg_dim },

    -- notifier
    SnacksNotifierMinimal = "NormalFloat",
    SnacksNotifierHistory = "NormalFloat",
    SnacksNotifierHistoryTitle = "Title",
    SnacksNotifierHistoryDateTime = { fg = ui.fg_dim },

    -- indent
    SnacksIndent = { fg = ui.fg_indent },
    SnacksIndentScope = { fg = ui.fg_indent_scope },

    -- dashboard
    SnacksDashboardHeader = "Title",
    SnacksDashboardFooter = { fg = ui.fg_dim },
    SnacksDashboardIcon = { fg = syn.type },
    SnacksDashboardKey = { fg = syn.keyword, bold = true },
    SnacksDashboardDesc = { fg = ui.fg },
    SnacksDashboardFile = { fg = ui.fg },
    SnacksDashboardDir = { fg = ui.fg_dim },

    -- input
    SnacksInputNormal = "NormalFloat",
    SnacksInputBorder = { fg = syn.keyword, bg = ui.bg_float },
    SnacksInputTitle = "FloatTitle",
    SnacksInputIcon = { fg = syn.keyword },
  }

  local levels = {
    Error = d.error,
    Warn = d.warn,
    Info = d.info,
    Debug = ui.fg_dim,
    Trace = ui.fg_dim,
  }
  for level, fg in pairs(levels) do
    groups["SnacksNotifier" .. level] = "NormalFloat"
    groups["SnacksNotifierIcon" .. level] = { fg = fg, bg = ui.bg_float }
    groups["SnacksNotifierBorder" .. level] = { fg = fg, bg = ui.bg_float }
    groups["SnacksNotifierTitle" .. level] = { fg = fg, bg = ui.bg_float, bold = true }
    groups["SnacksNotifierFooter" .. level] = { fg = fg, bg = ui.bg_float }
  end

  for i = 1, 8 do
    local hue = c.rainbow[(i - 1) % #c.rainbow + 1]
    groups["SnacksIndent" .. i] = { fg = blend(hue, 0.5, c.palette.bg) }
  end

  return require("zenburn.highlights.kinds").apply(groups, "SnacksPickerIcon%s")
end
