-- Not installed here; names from vim-visual-multi's docs.
return function(c, opts)
  local ui, syn = c.ui, c.syn
  return {
    VM_Mono = { fg = c.palette.bg, bg = syn.keyword },
    VM_Extend = "Visual",
    VM_Cursor = "Cursor",
    VM_Insert = { fg = c.palette.bg, bg = syn.todo },
    VM_Theme_Default = "Visual",
  }
end
