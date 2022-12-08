local M = {}

M.moveLine = {
  n = {
    ["<A-j>"] = {"<cmd> MoveLine(1)<CR>", "Move line down"},
    ["<A-k>"] = {"<cmd> MoveLine(-1)<CR>", "Move line up"},
  },
  v = {
    ["<A-j>"] = {"<cmd> MoveLine(1)<CR>", "Move line down"},
    ["<A-k>"] = {"<cmd> MoveLine(-1)<CR>", "Move line up"},
  }
}
return M
