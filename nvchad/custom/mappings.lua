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

M.lspconfig = {
	n = {
		["gi"] = { "<cmd> Telescope lsp_implementations <CR>", "lsp implementation" },
		["<leader>D"] = { "<cmd> Telescope lsp_type_definitions <CR>", "lsp definition type" },
		["gr"] = { "<cmd> Telescope lsp_references <CR>", "lsp references" },
	},
}
M.telescope = {
  n = {
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },
  }
}
return M
