return function(c, opts)
  local p = c.palette
  return {
    LeapMatch = { fg = p.bg, bg = p.keyword },
    LeapLabelPrimary = { fg = p.bg, bg = p.keyword, bold = true },
    LeapLabelSecondary = { fg = p.bg, bg = p.field },
    LeapBackdrop = { fg = c.ui.fg_dim },
  }
end
