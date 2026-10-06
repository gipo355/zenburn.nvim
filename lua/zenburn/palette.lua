-- Hex values only. Source: reference/intellij/zenburn.xml (editor scheme) and
-- reference/intellij/zenburn.theme.json (UI). Entries marked `vim` keep the
-- original Vim Zenburn value where IntelliJ has no opinion.
return {
  -- surfaces
  bg = "#3f3f3f", -- TEXT
  bg_gutter = "#383838", -- GUTTER_BACKGROUND, VISUAL_INDENT_GUIDE
  bg_dark = "#303030", -- CARET_ROW_COLOR, CONSOLE_BACKGROUND_KEY
  bg_doc = "#2b2b2b", -- DOCUMENTATION_COLOR, RIGHT_MARGIN_COLOR
  bg_ui = "#3a3a3a", -- theme.json background, SEARCH_RESULT_ATTRIBUTES
  bg_sel = "#4f4f4f", -- SELECTION_BACKGROUND, TEARLINE_COLOR
  bg_hint = "#505050", -- INLINE_PARAMETER_HINT bg, WHITESPACES
  bg_ui_sel = "#545454", -- theme.json selectionBackground
  bg_tooltip = "#5f5f5f", -- TOOLTIP, NOTIFICATION_BACKGROUND, METHOD_SEPARATORS_COLOR
  bg_diff_sep = "#6f6f6f", -- DIFF_SEPARATORS_BACKGROUND, SELECTED_TEARLINE_COLOR

  -- text
  fg = "#dcdccc", -- TEXT
  fg_bright = "#efefef", -- vim: Title
  fg_ui = "#c6c6c6", -- theme.json foreground
  fg_breadcrumb = "#c7c4c4", -- BREADCRUMBS_DEFAULT
  fg_dim = "#aaa9a9", -- INLINE_PARAMETER_HINT fg
  fg_gray = "#999999", -- CONSOLE_GRAY_OUTPUT
  fg_delim = "#8f8f8f", -- vim: Delimiter (XML is silent on braces)
  fg_faint = "#656555", -- LINE_NUMBERS_COLOR, DOC_COMMENT_GUIDE

  -- syntax
  keyword = "#f0dfaf", -- DEFAULT_KEYWORD, WARNING_ATTRIBUTES
  string = "#cc9393", -- DEFAULT_STRING, errorForeground
  escape = "#ac7373", -- DEFAULT_VALID_STRING_ESCAPE, CONSOLE_ERROR_OUTPUT
  escape_bad = "#cc867e", -- DEFAULT_INVALID_STRING_ESCAPE
  number = "#94bff3", -- DEFAULT_NUMBER, CTRL_CLICKABLE, DOC_COMMENT_LINK
  comment = "#5f7f5f", -- DEFAULT_LINE_COMMENT, IDENTIFIER_UNDER_CARET sp
  green = "#7f9f7f", -- TODO_DEFAULT_ATTRIBUTES, ADDED_LINES_COLOR, QUESTION_HINT
  type = "#6ca0a3", -- DEFAULT_CLASS_NAME, DEFAULT_METADATA, DEFAULT_DOC_COMMENT_TAG
  type_ref = "#366060", -- DEFAULT_CLASS_REFERENCE (unused: too dark, see SPEC)
  interface = "#7cb8bb", -- DEFAULT_INTERFACE_NAME
  static_fn = "#8acdd0", -- DEFAULT_STATIC_METHOD
  constant = "#d6d6ae", -- DEFAULT_CONSTANT, DEFAULT_GLOBAL_VARIABLE
  field = "#dfaf8f", -- DEFAULT_INSTANCE_FIELD, DEFAULT_ATTRIBUTE
  doc_value = "#bfebbf", -- DEFAULT_DOC_COMMENT_TAG_VALUE, CONSOLE_GREEN_BRIGHT
  doc_markup = "#9fc59f", -- DEFAULT_DOC_MARKUP
  template = "#93e0e3", -- DEFAULT_TEMPLATE_LANGUAGE_COLOR, CONSOLE_CYAN
  tag = "#b6b6a7", -- DEFAULT_TAG
  tag_match = "#5c888b", -- MATCHED_TAG_NAME, XML_TAG_NAME
  info = "#d0bf8f", -- INFO_ATTRIBUTES, CONSOLE_YELLOW
  magenta = "#dc8cc3", -- CONSOLE_MAGENTA, rainbow 4
  cyan = "#8cd0d3", -- CONSOLE_BLUE_BRIGHT
  red_bright = "#dca3a3", -- CONSOLE_RED_BRIGHT, BAD_CHARACTER

  -- state
  error = "#e81a1a", -- ERRORS_ATTRIBUTES (undercurl only, never as fill)
  error_fg = "#bc8383", -- LOG_ERROR_OUTPUT, rainbow 1
  error_bg = "#8c5353", -- BREAKPOINT_ATTRIBUTES, DIFF_DELETED, WRONG_REFERENCES
  add_bg = "#364936", -- DIFF_INSERTED
  change = "#415f69", -- MODIFIED_LINES_COLOR
  search = "#425f44", -- TEXT_SEARCH_RESULT_ATTRIBUTES
  search_sp = "#56ac48", -- TEXT_SEARCH_RESULT_ATTRIBUTES sp
  write_ref = "#835353", -- WRITE_SEARCH_RESULT_ATTRIBUTES
  match_paren = "#3b514d", -- MATCHED_BRACE_ATTRIBUTES
  folded = "#93b3a3", -- vim: Folded fg
  folded_bg = "#3f4040", -- vim: Folded bg

  -- ANGLE_BRACKETS_RAINBOW_COLOR0..4
  rainbow = { "#709080", "#bc8383", "#f0dfaf", "#93e0e3", "#dc8cc3" },
}
