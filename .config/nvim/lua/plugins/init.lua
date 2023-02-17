return {
    { "nvim-lua/plenary.nvim",           lazy = true },
    -- "nyoom-engineering/oxocarbon.nvim",
    -- {
    --     "Mofiqul/vscode.nvim",
    --     config = function()
    --         -- vim.cmd("colorscheme oxocarbon")
    --         local c = require('vscode.colors').get_colors()
    --         require('vscode').setup({
    --             -- Enable transparent background
    --             transparent = true,
    --             -- Enable italic comment
    --             italic_comments = true,
    --             -- Disable nvim-tree background color
    --             disable_nvimtree_bg = true,
    --             -- Override colors (see ./lua/vscode/colors.lua)
    --             -- color_overrides = {
    --             --     vscLineNumber = '#FFFFFF',
    --             -- },
    --             -- Override highlight groups (see ./lua/vscode/theme.lua)
    --             group_overrides = {
    --                 -- this supports the same val table as vim.api.nvim_set_hl
    --                 -- use colors from this colorscheme by requiring vscode.colors!
    --                 Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
    --             }
    --         })
    --     end,
    --
    -- },
    --
    {
        { "projekt0n/github-nvim-theme", config = function()
            require('github-theme').setup({
                theme_style = "dark_default",
                function_style = "italic",
            })
        end }
    },
    -- Git plugins
    "tpope/vim-fugitive",
    { "sindrets/diffview.nvim", cmd = "DiffviewOpen",
        opts = {
            view = {
                merge_tool = {
                    layout = "diff3_mixed",
                }
            }
        }
    },

    {
        "numToStr/Comment.nvim",
        dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end,
    },

    { 'echasnovski/mini.surround', version = false, config = function()
        require('mini.surround').setup({
            mappings = {
                add = 'ms', -- Add surrounding in Normal and Visual modes
                delete = 'md', -- Delete surrounding
                find = 'mf', -- Find surrounding (to the right)
                replace = 'mr', -- Replace surrounding
                -- find_left = 'mF', -- Find surrounding (to the left)
                -- highlight = 'mh', -- Highlight surrounding
                -- update_n_lines = 'mn', -- Update `n_lines`
                --
                -- suffix_last = 'l', -- Suffix to search with "prev" method
                -- suffix_next = 'n', -- Suffix to search with "next" method
            },
        })
    end },
    {
        "otavioschwanck/cool-substitute.nvim",
        config = function()
            require 'cool-substitute'.setup({
                setup_keybindings = true,
                mappings = {
                    start = '<leader>gm', -- Mark word / region
                    start_and_edit = '<leader>gM', -- Mark word / region and also edit
                    start_and_edit_word = '<leader>g!M', -- Mark word / region and also edit.  Edit only full word.
                    start_word = '<leader>g!m', -- Mark word / region. Edit only full word
                    apply_substitute_and_next = '<leader>M', -- Start substitution / Go to next substitution
                    apply_substitute_and_prev = '<leader><C-b>', -- same as M but backwards
                    apply_substitute_all = '<leader>ga', -- Substitute all
                    force_terminate_substitute = '<leader>g!!', -- Terminate macro (if some bug happens)
                    terminate_substitute = '<esc>', -- Terminate macro
                    skip_substitute = 'n', -- Skip this occurrence
                    goto_next = '<C-j>', -- Go to next occurence
                    goto_previous = '<C-k>', -- Go to previous occurrence
                },
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
