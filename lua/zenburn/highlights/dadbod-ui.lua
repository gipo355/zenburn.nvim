return function(c, opts)
  local d = c.diag
  return {
    dbui_connection_source = "Comment",
    dbui_help = "Comment",
    dbui_help_key = "@keyword",
    dbui_add_connection = "Directory",
    dbui_new_query = "@keyword",
    dbui_saved_query = "Directory",
    dbui_buffers = "Directory",
    dbui_tables = "Directory",
    dbui_connection_ok = { fg = d.ok },
    dbui_connection_error = { fg = d.error },
  }
end
