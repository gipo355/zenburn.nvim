return function(c, opts)
  local bg = require("zenburn.util").blend(c.syn.keyword, 0.15, c.palette.bg)
  return {
    YankyPut = { bg = bg },
    YankyYanked = { bg = bg },
  }
end
