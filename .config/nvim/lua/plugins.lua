local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim") -- Common utilities
	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side  use 'norcalli/nvim-colorizer.lua'

	-- Appearance
	use("marko-cerovac/material.nvim") -- Theme
	use("nvim-lualine/lualine.nvim") -- Statusline
	use("kyazdani42/nvim-web-devicons") -- File icon

	-- Controls & behavior
	use("fedepujol/move.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	})
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("akinsho/nvim-bufferline.lua")
	use("folke/which-key.nvim")
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "/home/mariansimecek/dev/", "~/home/mariansimecek/", "/" },
			})
		end,
	})
	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")

	-- Autocomplete
	use("hrsh7th/nvim-cmp") -- Completion
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-path") -- source for file system paths

	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	--LSP
	use("neovim/nvim-lspconfig") -- LSP
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind-nvim")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- Copilot
	use("github/copilot.vim")
end)
