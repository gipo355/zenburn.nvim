return function(c, opts)
  local ui = c.ui
  return {
    MatchWord = "MatchParen",
    MatchParenCur = "MatchParen",
    MatchWordCur = "MatchParen",
    MatchBackground = { bg = ui.bg_match },
    MatchupVirtualText = { fg = ui.fg_faint },
  }
end
