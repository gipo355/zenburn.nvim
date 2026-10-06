return function(c, opts)
  local ui, syn, d, g = c.ui, c.syn, c.diag, c.git
  local p = c.palette
  return {
    -- mini.files
    MiniFilesBorder = "FloatBorder",
    MiniFilesBorderModified = { fg = d.warn, bg = ui.bg_float },
    -- bg_cursorline equals bg_float, so a CursorLine link is invisible in floats
    MiniFilesCursorLine = { bg = ui.bg_visual },
    MiniFilesDirectory = "Directory",
    MiniFilesFile = { fg = ui.fg },
    MiniFilesNormal = "NormalFloat",
    MiniFilesTitle = "FloatTitle",
    MiniFilesTitleFocused = { fg = ui.fg_title, bg = ui.bg_float, bold = true },

    -- mini.icons
    MiniIconsAzure = { fg = syn.interface },
    MiniIconsBlue = { fg = syn.interface },
    MiniIconsCyan = { fg = syn.template },
    MiniIconsGreen = { fg = syn.todo },
    MiniIconsGrey = { fg = ui.fg_dim },
    MiniIconsOrange = { fg = p.field },
    MiniIconsPurple = { fg = p.magenta },
    MiniIconsRed = { fg = d.error },
    MiniIconsYellow = { fg = syn.keyword },

    -- mini.statusline
    MiniStatuslineModeNormal = { fg = p.bg, bg = p.fg, bold = true },
    MiniStatuslineModeInsert = { fg = p.bg, bg = syn.todo, bold = true },
    MiniStatuslineModeVisual = { fg = p.bg, bg = p.field, bold = true },
    MiniStatuslineModeReplace = { fg = p.bg, bg = syn.string, bold = true },
    MiniStatuslineModeCommand = { fg = p.bg, bg = syn.keyword, bold = true },
    MiniStatuslineModeOther = { fg = p.bg, bg = syn.interface, bold = true },
    MiniStatuslineDevinfo = "StatusLine",
    MiniStatuslineFilename = "StatusLineNC",
    MiniStatuslineFileinfo = "StatusLine",
    MiniStatuslineInactive = "StatusLineNC",

    -- mini.pick
    MiniPickBorder = "FloatBorder",
    MiniPickBorderBusy = { fg = d.warn, bg = ui.bg_float },
    MiniPickBorderText = "FloatTitle",
    MiniPickIconDirectory = "Directory",
    MiniPickIconFile = "MiniPickNormal",
    MiniPickHeader = { fg = syn.type, bold = true },
    MiniPickMatchCurrent = "Visual",
    MiniPickMatchMarked = { bg = ui.bg_ui_sel },
    MiniPickMatchRanges = { fg = syn.keyword },
    MiniPickNormal = "NormalFloat",
    MiniPickPreviewLine = { bg = ui.bg_visual },
    MiniPickPreviewRegion = "Search",
    MiniPickPrompt = { fg = ui.fg, bg = ui.bg_float },
    MiniPickPromptCaret = { fg = syn.keyword, bg = ui.bg_float },
    MiniPickPromptPrefix = { fg = syn.keyword, bg = ui.bg_float },

    -- mini.hipatterns
    MiniHipatternsFixme = { fg = d.error, bold = true },
    MiniHipatternsHack = { fg = d.warn, bold = true },
    MiniHipatternsTodo = { fg = syn.todo, bold = true },
    MiniHipatternsNote = { fg = syn.type, bold = true },

    -- mini.diff
    MiniDiffSignAdd = { fg = g.add },
    MiniDiffSignChange = { fg = g.change },
    MiniDiffSignDelete = { fg = g.delete },
    MiniDiffOverAdd = "DiffAdd",
    MiniDiffOverChange = "DiffText",
    MiniDiffOverChangeBuf = "MiniDiffOverChange",
    MiniDiffOverContext = "DiffChange",
    MiniDiffOverDelete = "DiffDelete",

    -- mini.cursorword
    MiniCursorword = "LspReferenceText",
    MiniCursorwordCurrent = "MiniCursorword",

    -- mini.indentscope
    MiniIndentscopeSymbol = { fg = ui.fg_indent_scope },
    MiniIndentscopeSymbolOff = "MiniIndentscopeSymbol",

    -- mini.clue
    MiniClueBorder = "FloatBorder",
    MiniClueDescGroup = { fg = syn.type },
    MiniClueDescSingle = { fg = ui.fg },
    MiniClueNextKey = { fg = syn.keyword, bold = true },
    MiniClueNextKeyWithPostkeys = { fg = syn.special, bold = true },
    MiniClueSeparator = { fg = ui.fg_faint },
    MiniClueTitle = "FloatTitle",

    -- mini.notify
    MiniNotifyBorder = "FloatBorder",
    MiniNotifyNormal = "NormalFloat",
    MiniNotifyTitle = "FloatTitle",
    MiniNotifyLspProgress = "MiniNotifyNormal",

    -- mini.surround, mini.jump, mini.jump2d
    MiniSurround = "Search",
    MiniJump = "Search",
    MiniJump2dSpot = { fg = syn.keyword, bold = true },
    MiniJump2dSpotAhead = { fg = ui.fg_dim },
    MiniJump2dSpotUnique = "MiniJump2dSpot",
    MiniJump2dDim = "Comment",

    -- mini.starter
    MiniStarterHeader = { fg = syn.type, bold = true },
    MiniStarterFooter = { fg = ui.fg_dim },
    MiniStarterItem = { fg = ui.fg },
    MiniStarterCurrent = "MiniStarterItem",
    MiniStarterInactive = { fg = ui.fg_faint },
    MiniStarterItemBullet = { fg = syn.keyword },
    MiniStarterItemPrefix = { fg = syn.keyword, bold = true },
    MiniStarterSection = { fg = syn.type, bold = true },
    MiniStarterQuery = { fg = syn.keyword },

    -- mini.tabline
    MiniTablineCurrent = "TabLineSel",
    MiniTablineVisible = "TabLine",
    MiniTablineHidden = { fg = ui.fg_faint, bg = ui.bg_gutter },
    MiniTablineModifiedCurrent = { fg = syn.keyword, bg = ui.bg },
    MiniTablineModifiedVisible = { fg = syn.keyword, bg = ui.bg_gutter },
    MiniTablineModifiedHidden = { fg = syn.keyword, bg = ui.bg_gutter },
    MiniTablineTabpagesection = { fg = syn.keyword, bg = ui.bg_dark },
    MiniTablineFill = "TabLineFill",
    MiniTablineTrunc = "MiniTablineHidden",
  }
end
