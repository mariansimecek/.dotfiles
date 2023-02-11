return {
    { "nvim-lua/plenary.nvim",  lazy = true },
    {
        -- "nyoom-engineering/oxocarbon.nvim",
        -- config = function()
        --  vim.cmd("colorscheme oxocarbon")
        -- end,

        'tomasiser/vim-code-dark',
        config = function()
            vim.cmd("colorscheme codedark")

        end,
    },

    -- Git plugins
    "tpope/vim-fugitive",
    { "sindrets/diffview.nvim", cmd = "DiffviewOpen" },

    {
        "numToStr/Comment.nvim",
        dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end,
    },

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
}
