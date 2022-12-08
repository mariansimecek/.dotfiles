return {
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	["windwp/nvim-ts-autotag"] = {
		after = "nvim-treesitter",
		config = function()
			local present, autotag = pcall(require, "nvim-ts-autotag")

			if present then
				autotag.setup()
			end
		end,
	},
	["windwp/nvim-autopairs"] = {},

	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},
	["jose-elias-alvarez/typescript.nvim"] = {},

	["github/copilot.vim"] = {},

	-- Override plugin definition options
	["goolord/alpha-nvim"] = {
		disable = false,
	},

	["folke/which-key.nvim"] = {
		disable = false,
	},
	["JoosepAlviste/nvim-ts-context-commentstring"] = {},
	["numToStr/Comment.nvim"] = {
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},

	["tpope/vim-surround"] = {},
	["fedepujol/move.nvim"] = {},
}
