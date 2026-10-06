return function(c, opts)
  local ui, syn, d = c.ui, c.syn, c.diag
  local blend = require("zenburn.util").blend
  local groups = {
    RenderMarkdownCode = { bg = ui.bg_dark },
    RenderMarkdownCodeInline = { fg = syn.doc_markup, bg = ui.bg_dark },
    RenderMarkdownBullet = { fg = syn.keyword },
    RenderMarkdownChecked = { fg = syn.todo },
    RenderMarkdownUnchecked = { fg = ui.fg_dim },
    RenderMarkdownTodo = { fg = ui.fg_dim },
    RenderMarkdownQuote = { fg = ui.fg_dim },
    RenderMarkdownDash = { fg = ui.fg_faint },
    RenderMarkdownLink = { fg = syn.type },
    RenderMarkdownTableHead = { fg = ui.fg_faint, bold = true },
    RenderMarkdownTableRow = { fg = ui.fg_faint },
    RenderMarkdownInfo = { fg = syn.type },
    RenderMarkdownSuccess = { fg = syn.todo },
    RenderMarkdownHint = { fg = syn.interface },
    RenderMarkdownWarn = "DiagnosticWarn",
    RenderMarkdownError = "DiagnosticError",
    RenderMarkdownMath = { fg = syn.number },
    RenderMarkdownHtmlComment = "Comment",
  }
  for i = 1, 6 do
    local color = c.rainbow[(i - 1) % #c.rainbow + 1]
    groups["RenderMarkdownH" .. i] = { fg = color, bold = true }
    groups["RenderMarkdownH" .. i .. "Bg"] = { bg = blend(color, 0.12, c.palette.bg) }
  end
  return groups
end
