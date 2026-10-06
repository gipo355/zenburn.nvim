return function(c, opts)
  local r = c.rainbow
  return {
    BlinkPairsOrange = { fg = r[1] },
    BlinkPairsPurple = { fg = r[2] },
    BlinkPairsBlue = { fg = r[3] },
    BlinkPairsUnmatched = { fg = c.diag.error },
    BlinkPairsMatchParen = "MatchParen",
    BlinkPairs = { fg = c.syn.bracket },
  }
end
