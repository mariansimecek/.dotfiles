return {

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"rambhosale/cmp-bootstrap.nvim",
			"hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
			"hrsh7th/cmp-path", -- source for file system paths
			"hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
			{
				"L3MON4D3/LuaSnip",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
			"rafamadriz/friendly-snippets",
			"zbirenbaum/copilot.lua"

		},
		config = function()
			vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
			local kind_icons = {
				Text = "",
				Method = "",
				Function = "",
				Constructor = "",
				Field = "ﰠ",
				Variable = "",
				Class = "",
				Interface = "",
				Module = "",
				Property = "",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "פּ",
				Event = "",
				Operator = "",
				TypeParameter = "",
				Copilot = "",
			}
			local lspkind = require("lspkind")

			vim.o.completeopt = "menu,menuone,noselect"

			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "text_symbol", -- show only symbol annotations
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						-- The function below will be called before any actual modifications from lspkind
						-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
						before = function(entry, vim_item)
							local shorten_abbr = string.sub(vim_item.abbr, 1, 30)
							if shorten_abbr ~= vim_item.abbr then
								vim_item.abbr = shorten_abbr .. "..."
							end
							-- Kind icons
							vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
							-- Source
							vim_item.menu = ({
								buffer = "[Buf]",
								nvim_lsp = "[LSP]",
								luasnip = "[LuaSnip]",
								nvim_lua = "[API]",
								cmp_tabnine = "[Tabnine]",
								path = "[Path]",
							})[entry.source.name]
							return vim_item
						end,
					}),
				},
				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif require("luasnip").expand_or_jumpable() then
							vim.fn.feedkeys(
								vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
								""
							)
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif require("luasnip").jumpable(-1) then
							vim.fn.feedkeys(
								vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
								""
							)
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
				},
				sources = {
					{ name = "copilot" },
					{ name = "nvim_lsp" },
					-- { name = 'cmp_bootstrap' },
					{ name = "luasnip" },
					-- { name = "buffer" },
					{ name = "nvim_lua" },
					{ name = "path" },
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("copilot").setup()
			end, 100)
		end,
		dependencies = {
			"onsails/lspkind-nvim",
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
	},

}
