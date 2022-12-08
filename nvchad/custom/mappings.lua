local M = {}

M.move = {
  n = {
    ["<A-j>"] = {"<cmd> MoveLine(1)<CR>", "Move line down"},
    ["<A-k>"] = {"<cmd> MoveLine(-1)<CR>", "Move line up"},
    ["<A-h>"] = {"<cmd> MoveBlock(-1)<CR>", "Move block left"},
    ["<A-l>"] = {"<cmd> MoveBlock(1)<CR>", "Move block right"},
  },
  v = {
    ["<A-j>"] = {"<cmd> MoveLine(1)<CR>", "Move line down"},
    ["<A-k>"] = {"<cmd> MoveLine(-1)<CR>", "Move line up"},
    ["<A-h>"] = {"<cmd> MoveBlock(-1)<CR>", "Move block left"},
    ["<A-l>"] = {"<cmd> MoveBlock(1)<CR>", "Move block right"},
  }
}
return M
