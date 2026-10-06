return function(c, opts)
  local U = require("zenburn.util")
  local g, bg = c.git, c.palette.bg
  return {
    GitConflictCurrent = { bg = c.diff.add },
    GitConflictIncoming = { bg = c.diff.change },
    GitConflictAncestor = { bg = c.diff.delete },
    GitConflictCurrentLabel = { bg = U.blend(g.add, 0.5, bg) },
    GitConflictIncomingLabel = { bg = U.blend(g.change, 0.8, bg) },
    GitConflictAncestorLabel = { bg = U.blend(g.delete, 0.5, bg) },
  }
end
