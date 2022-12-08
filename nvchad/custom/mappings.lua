local M = {}

M.moveLine = {
  n = {
    ["<A-j>"] = {"<cmd> MoveLine(1)<CR>", "Move line down"},
    ["<A-k>"] = {"<cmd> MoveLine(-1)<CR>", "Move line up"},
  },
  v = {
    ["<A-j>"] = {"<cmd> MoveBlock(1)<CR>", "Move line down"},
    ["<A-k>"] = {"<cmd> MoveBlock(-1)<CR>", "Move line up"},
  }
}
return M
