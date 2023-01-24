return {
	{ "nvim-lua/plenary.nvim", lazy = true },
	-- {
	-- 	"folke/persistence.nvim",
	-- 	event = "BufReadPre",
	-- 	opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
	-- 	keys = {
	-- 		{ "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
	-- 		{ "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
	-- 		{ "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
	-- 	},
	-- },
	{
		"nyoom-engineering/oxocarbon.nvim",
		config = function()
			vim.cmd("colorscheme oxocarbon")
		end,
	},

	-- Git plugins
	"tpope/vim-fugitive",
	{ "sindrets/diffview.nvim", cmd = "DiffviewOpen" },

	-- Other plugins
	{ "mbbill/undotree", cmd = "UndotreeToggle" },

	{
		"numToStr/Comment.nvim",
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},

	"tpope/vim-sleuth",
	"machakann/vim-sandwich",
	{
		"otavioschwanck/cool-substitute.nvim",
		config = function()
			require("cool-substitute").setup({
				setup_keybindings = true,
			})
		end,
	},
	{ "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
	{
		"echasnovski/mini.move",
		config = function()
			require("mini.move").setup()
		end,
	},
	{
		"windwp/nvim-spectre",
		keys = {
			{ "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
		},
	},
	{
"brenoprata10/nvim-highlight-colors", 
		config = function()
			 require("nvim-highlight-colors").setup {
				render = 'background', -- or 'foreground' or 'first_column'
				enable_named_colors = true,
				enable_tailwind = false
			}
		end,

	},
	-- { "kevinhwang91/nvim-hlslens", config = function()
	-- 	require('hlslens').setup()
	--
	-- 	local kopts = { noremap = true, silent = true }
	--
	-- 	vim.api.nvim_set_keymap('n', 'n',
	-- 		[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
	-- 		kopts)
	-- 	vim.api.nvim_set_keymap('n', 'N',
	-- 		[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
	-- 		kopts)
	-- 	vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
	-- 	vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
	-- 	vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
	-- 	vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
	--
	-- end }
}
