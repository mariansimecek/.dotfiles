return {
    { "nvim-lua/plenary.nvim", lazy = true },
    -- "nyoom-engineering/oxocarbon.nvim",
    {
"Alexis12119/nightly.nvim",
        config = function()
            vim.cmd.colorscheme("nightly")
        end,
    },
    -- Git plugins
    "tpope/vim-fugitive",
    {
        "sindrets/diffview.nvim",
        cmd = "DiffviewOpen",
        opts = {
            view = {
                merge_tool = {
                    layout = "diff3_mixed",
                },
            },
        },
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
    {
        "echasnovski/mini.surround",
        version = false,
        config = function()
            require("mini.surround").setup({
                mappings = {
                    add = "ms", -- Add surrounding in Normal and Visual modes
                    delete = "md", -- Delete surrounding
                    find = "mf", -- Find surrounding (to the right)
                    replace = "mr", -- Replace surrounding
                    find_left = "", -- Find surrounding (to the left)
                    highlight = "", -- Highlight surrounding
                    update_n_lines = "", -- Update `n_lines`
                    suffix_last = "l", -- Suffix to search with "prev" method
                    suffix_next = "n", -- Suffix to search with "next" method
                },
            })
        end,
    },
    {
        "echasnovski/mini.move",
        config = function()
            require("mini.move").setup()
        end,
    },
    {
        "windwp/nvim-spectre",
        keys = {
            {
                "<leader>sr",
                function()
                    require("spectre").open()
                end,
                desc = "Replace in files (Spectre)",
            },
        },
    },
    {
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require("nvim-highlight-colors").setup({
                render = "background", -- or 'foreground' or 'first_column'
                enable_named_colors = true,
                enable_tailwind = false,
            })
        end,
    },
    {
        "otavioschwanck/cool-substitute.nvim",
        config = function()
            require("cool-substitute").setup({
                setup_keybindings = true,
                mappings = {
                    start = "gm",         -- Mark word / region
                    start_and_edit = "gM", -- Mark word / region and also edit
                    start_and_edit_word = "g!M", -- Mark word / region and also edit.  Edit only full word.
                    start_word = "g!m",   -- Mark word / region. Edit only full word
                    apply_substitute_and_next = "M", -- Start substitution / Go to next substitution
                    apply_substitute_and_prev = "<C-b>", -- same as M but backwards
                    apply_substitute_all = "ga", -- Substitute all
                    force_terminate_substitute = "g!!", -- Terminate macro (if some bug happens)
                    terminate_substitute = "<esc>", -- Terminate macro
                    skip_substitute = "n", -- Skip this occurrence
                    goto_next = "<C-j>",  -- Go to next occurence
                    goto_previous = "<C-k>", -- Go to previous occurrence
                },
                -- reg_char = 'o', -- letter to save macro (Dont use number or uppercase here)
                -- mark_char = 't', -- mark the position at start of macro
                -- writing_substitution_color = "#ECBE7B", -- for status line
                -- applying_substitution_color = "#98be65", -- for status line
                -- edit_word_when_starting_with_substitute_key = true -- (press M to mark and
            })
        end,
    },
}
