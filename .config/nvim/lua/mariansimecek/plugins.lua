local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed")
    return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim") -- Common utilities


    -- Colors
    use("nyoom-engineering/oxocarbon.nvim")
    -- use({
    --     'rose-pine/neovim',
    --     as = 'rose-pine',
    --     config = function()
    --         vim.cmd('colorscheme rose-pine')
    --     end
    -- })
    use("nvim-lualine/lualine.nvim") -- Statusline
    use("kyazdani42/nvim-web-devicons") -- File icon



    -- Git plugins
    use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
    use("tpope/vim-fugitive")
    use("sindrets/diffview.nvim")



    --LSP
    use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
    use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
    use("neovim/nvim-lspconfig")

    use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

    use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
    use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
    use("onsails/lspkind-nvim")
    use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
    use({ "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end,
    })


    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    })


    -- Autocomplete
    use {
        "zbirenbaum/copilot.lua",
        event = "VimEnter",
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()
            end, 100)
        end,
    }
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
    }
    use("hrsh7th/nvim-cmp") -- Completion
    use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
    use("hrsh7th/cmp-path") -- source for file system paths
    use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
    use({ "L3MON4D3/LuaSnip", config = function() require("luasnip.loaders.from_vscode").lazy_load() end, })
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion
    use {
        "rambhosale/cmp-bootstrap.nvim",
        after = "nvim-cmp",
    }
    use("rafamadriz/friendly-snippets")


    --Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })
    use { -- Additional text objects via treesitter
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
    }



    -- Other plugins
    use("mbbill/undotree")
    use({ "numToStr/Comment.nvim",
        requires = "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end,
    })

    use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically
    -- use("folke/which-key.nvim")
    use("machakann/vim-sandwich") -- add, delete, change surroundings (it's awesome)
    use { "akinsho/toggleterm.nvim", tag = "*", config = function()
        require("toggleterm").setup()
    end }
    -- auto closing
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
    use("otavioschwanck/cool-substitute.nvim")
end)
