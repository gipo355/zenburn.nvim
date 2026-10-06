return function(c, opts)
  return {
    NvimDapVirtualText = { fg = c.ui.fg_faint },
    NvimDapVirtualTextChanged = "DiagnosticVirtualTextWarn",
    NvimDapVirtualTextError = "DiagnosticVirtualTextError",
    NvimDapVirtualTextInfo = "DiagnosticVirtualTextInfo",
  }
end
