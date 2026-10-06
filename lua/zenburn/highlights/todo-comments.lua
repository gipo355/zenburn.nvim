return function(c, opts)
  local syn, d = c.syn, c.diag
  -- IntelliJ has a single TODO color; only FIX and WARN step out of it
  local colors = {
    FIX = d.error,
    WARN = d.warn,
    TODO = syn.todo,
    NOTE = syn.todo,
    TEST = syn.todo,
    PERF = syn.todo,
    HACK = syn.todo,
  }
  local groups = {}
  for kw, color in pairs(colors) do
    groups["TodoFg" .. kw] = { fg = color }
    groups["TodoSign" .. kw] = { fg = color }
    groups["TodoBg" .. kw] = { fg = color, bold = true } -- keyword in color, no block
  end
  return groups
end
