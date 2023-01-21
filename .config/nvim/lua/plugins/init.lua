return {
	"nvim-lua/plenary.nvim", -- Common utilities

	{
		"nyoom-engineering/oxocarbon.nvim",
		config = function()
			vim.cmd("colorscheme oxocarbon")
		end,
	},

	-- Git plugins
	"tpope/vim-fugitive",
	"sindrets/diffview.nvim",

	-- Other plugins
	{ "mbbill/undotree" },
	{
		"numToStr/Comment.nvim",
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},

	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	"machakann/vim-sandwich", -- add, delete, change surroundings (it's awesome)
	{
		"otavioschwanck/cool-substitute.nvim",
		config = function()
			require("cool-substitute").setup({
				setup_keybindings = true,
			})
		end,
	},
	"eandrju/cellular-automaton.nvim",

	{
		"echasnovski/mini.move",
		config = function()
			require("mini.move").setup()
		end,
	},
}
