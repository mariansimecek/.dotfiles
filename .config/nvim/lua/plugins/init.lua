return {
    "nvim-lua/plenary.nvim", -- Common utilities
    "pogyomo/submode.nvim",
    -- Colors
    "nyoom-engineering/oxocarbon.nvim",
    -- "SiddharthShyniben/pitch",
    -- use({
    --     'rose-pine/neovim',
    --     as = 'rose-pine',
    --     config = function()
    --         vim.cmd('colorscheme rose-pine')
    --     end
    -- })
    "nvim-lualine/lualine.nvim", -- Statusline


    -- Git plugins
    "lewis6991/gitsigns.nvim", -- show line modifications on left hand side
    "tpope/vim-fugitive",
    "sindrets/diffview.nvim",



    --LSP
    "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
    "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
    "neovim/nvim-lspconfig",

    "jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)

    "jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
    "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
    "onsails/lspkind-nvim",
    { "glepnir/lspsaga.nvim", branch = "main" }, -- enhanced lsp uis
    { "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end,
    },


    -- Telescope
    "nvim-telescope/telescope.nvim",
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        sag = "nightly", -- optional, updated every week. (see issue #1193)
    },


    -- Autocomplete
    {
        "zbirenbaum/copilot.lua",
        event = "VimEnter",
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()
            end, 100)
        end,
        dependencies = {
            {
                "zbirenbaum/copilot-cmp",
                config = function()
                    require("copilot_cmp").setup()
                end
            },
        }
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "rambhosale/cmp-bootstrap.nvim",
        }
    }, -- Completion
    "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
    { "L3MON4D3/LuaSnip", config = function() require("luasnip.loaders.from_vscode").lazy_load() end, },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets",


    --Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "windwp/nvim-ts-autotag"
        }
    },



    -- Other plugins
    "mbbill/undotree",
    { "numToStr/Comment.nvim",
        dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end,
    },

    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    "machakann/vim-sandwich", -- add, delete, change surroundings (it's awesome)
    "otavioschwanck/cool-substitute.nvim",
    "eandrju/cellular-automaton.nvim",

    { "echasnovski/mini.move",
        config = function()
            require("mini.move").setup()
        end,
    },
    -- use {
    --     "AckslD/nvim-neoclip.lua",
    --     dependencies = {
    --         { 'nvim-telescope/telescope.nvim' },
    --     },
    --     config = function()
    --         require('neoclip').setup()
    --     end,
    -- }
}
