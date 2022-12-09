local M = {}

M.general = {
	i = {
		["<C-s>"] = { "<Esc> <cmd> w <CR>" },
	},
	v = {
		["<C-s>"] = { "<Esc> <cmd> w <CR>gv" },
	},
}

M.moveLine = {
	n = {
		["<A-j>"] = { "<cmd> MoveLine(1)<CR>", "Move line down" },
		["<A-k>"] = { "<cmd> MoveLine(-1)<CR>", "Move line up" },
	},
}
return M
