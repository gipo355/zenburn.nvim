return function(c, opts)
  local U = require("zenburn.util")
  local ui, syn, d = c.ui, c.syn, c.diag
  return {
    DapBreakpoint = { fg = d.error },
    DapBreakpointCondition = { fg = d.warn },
    DapBreakpointRejected = { fg = ui.fg_faint },
    DapLogPoint = { fg = syn.type },
    DapStopped = { fg = syn.todo },
    DapStoppedLine = { bg = U.blend(syn.todo, 0.2, c.palette.bg) },
    DapBreakpointLine = { bg = c.diff.delete }, -- BREAKPOINT_ATTRIBUTES, toned down
  }
end
