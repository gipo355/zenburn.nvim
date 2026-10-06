return function(c, opts)
  local U = require("zenburn.util")
  local ui, syn, d, g = c.ui, c.syn, c.diag, c.git
  local r, bg = c.rainbow, c.palette.bg

  local groups = {
    NeogitNormalFloat = "NormalFloat",
    NeogitFloatBorder = "FloatBorder",
    NeogitCursorLine = "CursorLine",
    NeogitCursorLineNr = "CursorLineNr",
    NeogitSubtleText = { fg = ui.fg_dim },

    NeogitBranch = { fg = syn.keyword },
    NeogitBranchHead = { fg = syn.keyword, bold = true },
    NeogitRemote = { fg = syn.interface },
    NeogitObjectId = "NeogitSubtleText",
    NeogitTagName = { fg = syn.constant },
    NeogitTagDistance = { fg = ui.fg_dim },
    NeogitActiveItem = { bg = ui.bg_visual },

    NeogitSectionHeader = { fg = syn.type, bold = true },
    NeogitSectionHeaderCount = { fg = ui.fg_dim },
    NeogitUnmergedInto = "NeogitSectionHeader",
    NeogitUnpushedTo = "NeogitSectionHeader",
    NeogitUnpulledFrom = "NeogitSectionHeader",

    NeogitChangeModified = { fg = g.change_fg },
    NeogitChangeAdded = { fg = g.add },
    NeogitChangeNewFile = { fg = g.add },
    NeogitChangeDeleted = { fg = g.delete },
    NeogitChangeRenamed = { fg = syn.interface },
    NeogitChangeCopied = { fg = syn.interface },
    NeogitChangeUpdated = { fg = g.change_fg },
    NeogitChangeUnmerged = { fg = g.conflict },

    NeogitHunkHeader = { fg = ui.fg_dim, bg = ui.bg_gutter },
    NeogitHunkHeaderHighlight = { fg = syn.keyword, bg = ui.bg_gutter },
    NeogitHunkHeaderCursor = { fg = syn.keyword, bg = ui.bg_cursorline },
    NeogitHunkMergeHeader = { fg = g.conflict, bg = ui.bg_gutter },
    NeogitHunkMergeHeaderHighlight = { fg = g.conflict, bg = ui.bg_gutter },
    NeogitHunkMergeHeaderCursor = { fg = g.conflict, bg = ui.bg_cursorline },

    NeogitDiffContext = { fg = ui.fg },
    NeogitDiffContextHighlight = "NeogitDiffContext",
    NeogitDiffContextCursor = "CursorLine",
    NeogitDiffAdd = { fg = g.add, bg = c.diff.add },
    NeogitDiffAddHighlight = "NeogitDiffAdd",
    NeogitDiffAddCursor = { fg = g.add, bg = ui.bg_cursorline },
    NeogitDiffDelete = { fg = g.delete, bg = c.diff.delete },
    NeogitDiffDeleteHighlight = "NeogitDiffDelete",
    NeogitDiffDeleteCursor = { fg = g.delete, bg = ui.bg_cursorline },
    NeogitDiffAddInline = { fg = g.add, bg = U.blend(g.add, 0.3, bg) },
    NeogitDiffDeleteInline = { fg = g.delete, bg = U.blend(g.delete, 0.3, bg) },
    NeogitDiffHeader = { fg = syn.type, bg = ui.bg_gutter, bold = true },
    NeogitDiffHeaderHighlight = { fg = syn.keyword, bg = ui.bg_gutter, bold = true },
    NeogitDiffAdditions = "Added",
    NeogitDiffDeletions = "Removed",

    NeogitFilePath = { fg = syn.type },
    NeogitCommitViewHeader = { fg = syn.type, bold = true },
    NeogitCommitViewDescription = { fg = ui.fg },
    NeogitGraphAuthor = { fg = syn.special },

    NeogitPopupSectionTitle = { fg = syn.type, bold = true },
    NeogitPopupBranchName = { fg = syn.keyword },
    NeogitPopupBold = { fg = ui.fg_bright },
    NeogitPopupSwitchKey = { fg = syn.keyword, bold = true },
    NeogitPopupOptionKey = { fg = syn.keyword, bold = true },
    NeogitPopupConfigKey = { fg = syn.keyword, bold = true },
    NeogitPopupActionKey = { fg = syn.keyword, bold = true },
    NeogitPopupSwitchEnabled = { fg = syn.todo },
    NeogitPopupOptionEnabled = { fg = syn.todo },
    NeogitPopupConfigEnabled = { fg = syn.todo },
    NeogitPopupSwitchDisabled = "NeogitSubtleText",
    NeogitPopupOptionDisabled = "NeogitSubtleText",
    NeogitPopupConfigDisabled = "NeogitSubtleText",
    NeogitPopupActionDisabled = "NeogitSubtleText",

    NeogitCommandCodeNormal = { fg = d.ok },

    NeogitFloatHeader = { fg = syn.type, bg = ui.bg_float, bold = true },
    NeogitFloatHeaderHighlight = { fg = syn.keyword, bg = ui.bg_float, bold = true },
  }

  -- git --color graph; Red keeps its meaning for bad signatures
  local graph = {
    Red = g.delete,
    Orange = r[1],
    Cyan = r[2],
    Blue = syn.interface,
    Purple = r[3],
    Yellow = r[4],
    Green = r[5],
    White = ui.fg,
    Gray = ui.fg_dim,
  }
  for name, fg in pairs(graph) do
    groups["NeogitGraph" .. name] = { fg = fg }
    -- bold is reserved for headers and keys, so the bold variants match
    groups["NeogitGraphBold" .. name] = "NeogitGraph" .. name
  end

  return groups
end
