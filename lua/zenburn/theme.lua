-- Semantic roles built from the palette. Highlight files reference roles,
-- never hex, so a decision changes in one place.
local p = require("zenburn.palette")
local U = require("zenburn.util")

local M = {}

---@param opts zenburn.Config
function M.setup(opts)
  local t = opts.transparent_background
  local none = "NONE"

  local c = {
    palette = p,
    none = none,

    ui = {
      bg = t and none or p.bg,
      bg_gutter = t and none or p.bg_gutter,
      bg_dark = p.bg_dark,
      bg_inactive = p.bg_gutter,
      bg_float = p.bg_dark,
      bg_doc = p.bg_doc,
      bg_statusline = t and none or p.bg_gutter,
      bg_visual = p.bg_sel,
      bg_cursorline = p.bg_dark,
      bg_pmenu = p.bg_dark,
      bg_pmenu_sel = p.bg_sel,
      bg_sel = p.bg_sel,
      bg_ui_sel = p.bg_ui_sel,
      bg_hint = p.bg_hint,
      bg_search = p.search,
      bg_cursearch = p.search,
      sp_cursearch = p.search_sp,
      bg_match = p.match_paren,
      bg_ref_write = p.write_ref,
      bg_breakpoint = p.error_bg,

      fg = p.fg,
      fg_bright = p.fg_bright,
      fg_dim = p.fg_dim,
      fg_gray = p.fg_gray,
      fg_faint = p.fg_faint,
      fg_inlay = p.fg_dim,
      fg_line_nr = p.fg_faint,
      fg_line_nr_cur = p.fg,
      fg_nontext = p.bg_hint,
      fg_whitespace = p.bg_hint,
      fg_indent = p.bg_sel,
      fg_indent_scope = p.fg_faint,
      fg_border = p.bg_tooltip,
      fg_separator = p.bg_tooltip,
      fg_title = p.keyword,
      fg_directory = p.interface,
      fg_link = p.number,
      fg_folded = p.folded,
      bg_folded = p.folded_bg,
      sp_ref = p.comment,
      sp_spell = p.fg,
      cursor_fg = p.bg,
      cursor_bg = p.fg,
    },

    syn = {
      fg = p.fg,
      keyword = p.keyword,
      string = p.string,
      escape = p.escape,
      escape_bad = p.escape_bad,
      number = p.number,
      comment = p.comment,
      doc_tag = p.type,
      doc_value = p.doc_value,
      doc_markup = p.doc_markup,
      todo = p.green,
      type = p.type,
      interface = p.interface,
      static_fn = p.static_fn,
      constant = p.constant,
      field = p.fg, -- IJ renders fields as plain text (SPEC 5, screenshot)
      attribute = p.type,
      tag = p.tag,
      tag_attr = p.field,
      tag_match = p.tag_match,
      template = p.template,
      operator = p.fg,
      bracket = p.fg_delim,
      delimiter = p.fg,
      special = p.field,
    },

    diag = {
      error = p.error_fg,
      warn = p.keyword,
      info = p.info,
      hint = p.green,
      ok = p.green,
      sp_error = p.error,
      sp_warn = p.keyword,
      sp_info = p.info,
      sp_hint = p.comment,
      -- virtual text: same hue, pulled toward the background
      vt_error = U.blend(p.error_fg, 0.7, p.bg),
      vt_warn = U.blend(p.keyword, 0.7, p.bg),
      vt_info = U.blend(p.info, 0.7, p.bg),
      vt_hint = U.blend(p.green, 0.7, p.bg),
      unnecessary = p.fg_dim,
    },

    git = {
      add = p.green,
      change = p.change,
      change_fg = U.blend(p.change, 0.6, p.fg),
      delete = p.error_fg,
      conflict = p.red_bright,
    },

    diff = {
      add = p.add_bg,
      change = U.blend(p.change, 0.5, p.bg),
      delete = U.blend(p.error_bg, 0.3, p.bg),
      text = p.change,
    },

    -- warm hues only (SPEC phase 2); p.rainbow keeps the IJ set for reference
    rainbow = { p.field, p.type, p.constant, p.keyword, p.green },

    terminal = {
      black = p.bg,
      black_bright = p.fg_faint,
      red = p.string,
      red_bright = p.red_bright,
      green = p.comment,
      green_bright = p.doc_value,
      yellow = p.info,
      yellow_bright = p.keyword,
      blue = p.number,
      blue_bright = p.cyan,
      magenta = p.magenta,
      magenta_bright = p.magenta,
      cyan = p.template,
      cyan_bright = p.template,
      white = p.fg,
      white_bright = p.fg_bright,
    },
  }

  if opts.dim_inactive then
    c.ui.bg_nc = c.ui.bg_inactive
  else
    c.ui.bg_nc = c.ui.bg
  end

  return c
end

return M
