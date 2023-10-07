return {
    { "nvim-lua/plenary.nvim", lazy = true },
    -- {
    --     "nyoom-engineering/oxocarbon.nvim",
    --     config = function()
    --         vim.cmd.colorscheme("oxocarbon")
    --     end,
    -- },
    -- {
    --     "felipeagc/fleet-theme-nvim",
    --     config = function()
    --         vim.cmd("colorscheme fleet")
    --     end,
    -- },
    {
        "projekt0n/github-nvim-theme",
        config = function()
            require("github-theme").setup({
                options = {
                    transparent = true,
                },
            })

            vim.cmd("colorscheme github_dark")
        end,
    },
    -- Git plugins
    "tpope/vim-fugitive",
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
                    add = "ms",          -- Add surrounding in Normal and Visual modes
                    delete = "md",       -- Delete surrounding
                    find = "mf",         -- Find surrounding (to the right)
                    replace = "mr",      -- Replace surrounding
                    find_left = "",      -- Find surrounding (to the left)
                    highlight = "",      -- Highlight surrounding
                    update_n_lines = "", -- Update `n_lines`
                    suffix_last = "l",   -- Suffix to search with "prev" method
                    suffix_next = "n",   -- Suffix to search with "next" method
                },
            })
        end,
    },
    {
        "echasnovski/mini.move",
        config = {},
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
        config = {
            render = "background", -- or 'foreground' or 'first_column'
            enable_named_colors = true,
            enable_tailwind = true,
        },
    },
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            "smoka7/hydra.nvim",
        },
        opts = {},
        cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
        keys = {
            {
                mode = { "v", "n" },
                "<Leader>n",
                "<cmd>MCstart<cr>",
                desc = "Create a selection for selected text or word under the cursor",
            },
        },
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        opts = {
            history = true,
            delete_check_events = "TextChanged",
        },
    },

    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",     -- nvim-cmp source for neovim's built-in LSP
            "hrsh7th/cmp-buffer",       -- nvim-cmp source for buffer words
            "hrsh7th/cmp-path",         -- source for file system paths
            "saadparwaiz1/cmp_luasnip", -- for autocompletion
            "rambhosale/cmp-bootstrap.nvim",
            "onsails/lspkind-nvim",
            -- "zbirenbaum/copilot.lua",
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
                        maxwidth = 50,        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
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
                    { name = "nvim_lsp" },
                    -- { name = "copilot" },
                    -- { name = 'cmp_bootstrap' },
                    { name = "luasnip" },
                    { name = "nvim_lua" },
                    { name = "path" },
                    { name = "buffer" },
                },
            })
        end,
    },
    -- {
    --     "zbirenbaum/copilot.lua",
    --     event = "VimEnter",
    --     config = function()
    --         vim.defer_fn(function()
    --             require("copilot").setup()
    --         end, 100)
    --     end,
    --     dependencies = {
    --         "onsails/lspkind-nvim",
    --         {
    --             "zbirenbaum/copilot-cmp",
    --             config = function()
    --                 require("copilot_cmp").setup()
    --             end,
    --         },
    --     },
    -- },
    -- Gitsigns
    --
    {
        "lewis6991/gitsigns.nvim", -- show line modifications on left hand side
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
                    change = {
                        hl = "GitSignsChange",
                        text = "│",
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn",
                    },
                    delete = {
                        hl = "GitSignsDelete",
                        text = "_",
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn",
                    },
                    topdelete = {
                        hl = "GitSignsDelete",
                        text = "‾",
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn",
                    },
                    changedelete = {
                        hl = "GitSignsChange",
                        text = "│",
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn",
                    },
                },
                signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
                numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
                linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
                word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir = {
                    interval = 1000,
                    follow_files = true,
                },
                attach_to_untracked = true,
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter_opts = {
                    relative_time = false,
                },
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
                max_file_length = 40000,
                preview_config = {
                    -- Options passed to nvim_open_win
                    border = "rounded",
                    style = "minimal",
                    relative = "cursor",
                    row = 0,
                    col = 1,
                },
                yadm = {
                    enable = false,
                },
            })
        end,
    },

    --lsp
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "pmizio/typescript-tools.nvim",
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig"
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require("typescript-tools").setup { settings = {

                expose_as_code_action = "all",
                on_attach = function()
                    vim.keymap.set(
                        "n",
                        "<leader>rf",
                        ":TypecriptRenameFile<CR>",
                        { desc = "Typescript [r]ename [f]ile" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>oi",
                        ":TSToolsOrganizeImports<CR>",
                        { desc = "Typescript [o]rganize [i]mports" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>ru",
                        ":TSToolsRemoveUnused<CR>",
                        { desc = "Typescript [r]emove [u]nused" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>rui",
                        ":TSToolsRemoveUnusedImports<CR>",
                        { desc = "Typescript [r]emove [u]nused [i]mports" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>mi",
                        ":TSToolsAddMissingImports<CR>",
                        { desc = "Typsecript add [m]issing [i]mports" }
                    )
                end,
            } }
            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                },
            })
        end,
    },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        text = { spinner = "dots" },
    },

    { "folke/neodev.nvim",     config = true },
    "hrsh7th/cmp-nvim-lsp",

    -- Formatting
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescriptreact = { "prettier" },
                    svelte = { "prettier" },
                    css = { "prettier" },
                    html = { "prettier" },
                    json = { "prettier" },
                    yaml = { "prettier" },
                    markdown = { "prettier" },
                    graphql = { "prettier" },
                    lua = { "stylua" },
                    python = { "isort", "black" },
                },
                format_on_save = {
                    lsp_fallback = true,
                    async = true,
                },
            })

            vim.keymap.set({ "n", "v" }, "<leader>m", function()
                conform.format({
                    lsp_fallback = true,
                    async = true,
                })
            end, { desc = "Format file or range (in visual mode)" })
        end,
    },
    -- Linting
    {
        "mfussenegger/nvim-lint",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        config = function()
            local lint = require("lint")

            lint.linters_by_ft = {
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                typescriptreact = { "eslint_d" },
                svelte = { "eslint_d" },
                python = { "pylint" },
            }

            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })

            vim.keymap.set("n", "<leader>l", function()
                lint.try_lint()
            end, { desc = "Trigger linting for current file" })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "", right = "" },
                    disabled_filetypes = {},
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        {
                            "filename",
                            file_status = true, -- displays file status (readonly status, modified status)
                            path = 0,           -- 0 = just filename, 1 = relative path, 2 = absolute path
                        },
                    },
                    lualine_c = { "branch" },
                    lualine_x = {
                        {
                            "diagnostics",
                            sources = { "nvim_diagnostic" },
                        },
                        "filetype",
                    },
                    lualine_y = { "diff" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {
                        {
                            "filename",
                            file_status = true, -- displays file status (readonly status, modified status)
                            path = 1,           -- 0 = just filename, 1 = relative path, 2 = absolute path
                        },
                    },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                extensions = { "fugitive", "nvim-tree", "toggleterm" },
            })
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        commit = "914a6868cb7e5318ed0380f6fe2a44d11c01e45d",
        dependencies = {
            {
                "nvim-tree/nvim-web-devicons",
                opts = { override = {}, default = true },
            },
        },
        cmd = "NvimTreeToggle",
        opts = {
            filters = { dotfiles = false },
            disable_netrw = true,
            hijack_netrw = true,
            hijack_cursor = true,
            hijack_unnamed_buffer_when_opening = false,
            update_cwd = true,
            update_focused_file = {
                enable = true,
                update_cwd = false,
            },
            view = {
                adaptive_size = true,
                side = "left",
                width = 25,
            },
            git = {
                enable = true,
            },
            filesystem_watchers = {
                enable = true,
            },
            actions = {
                open_file = {
                    resize_window = true,
                },
            },
            renderer = {
                highlight_git = true,
                highlight_opened_files = "name",
                root_folder_label = false,

                indent_markers = {
                    enable = true,
                },

                icons = {
                    symlink_arrow = "  ",
                    show = {
                        file = true,
                        folder = false,
                        folder_arrow = true,
                        git = false,
                    },

                    glyphs = {
                        folder = {
                            arrow_open = "",
                            arrow_closed = "",
                        },
                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "-L",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                    },
                    prompt_prefix = "   ",
                    selection_caret = "  ",
                    entry_prefix = "  ",
                    initial_mode = "insert",
                    selection_strategy = "reset",
                    sorting_strategy = "ascending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                            results_width = 0.8,
                        },
                        vertical = {
                            mirror = false,
                        },
                        width = 0.87,
                        height = 0.80,
                        preview_cutoff = 120,
                    },
                    file_sorter = require("telescope.sorters").get_fuzzy_file,
                    file_ignore_patterns = { "node_modules" },
                    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                    path_display = { "truncate" },
                    winblend = 0,
                    border = {},
                    color_devicons = true,
                    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                    -- Developer configurations: Not meant for general override
                    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
                    mappings = {
                        i = {
                            ["<Tab>"] = actions.move_selection_next,
                            ["<S-Tab>"] = actions.move_selection_previous,
                            -- ["<C-q>" ] = require("telescope.actions").close,
                        },
                        n = { ["q"] = require("telescope.actions").close },
                    },
                },
                pickers = {
                    -- Default configuration for builtin pickers goes here:
                    -- picker_name = {
                    --   picker_config_key = value,
                    --   ...
                    -- }
                    -- Now the picker_config_key will be applied every time you call this
                    -- builtin picker
                },
                extensions = {
                    -- Your extension configuration goes here:
                    -- extension_name = {
                    --   extension_config_key = value,
                    -- }
                    -- please take a look at the readme of the extension you want to configure
                },
            })

            -- change matched highlight color
            vim.cmd("highlight TelescopeMatching guifg=#fabd2f")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "windwp/nvim-ts-autotag",
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
                ensure_installed = {
                    "typescript",
                    "tsx",
                    "json",
                    "yaml",
                    "css",
                    "html",
                    "lua",
                    "prisma",
                },
                autotag = {
                    enable = true,
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        -- init_selection = '<c-space>',
                        -- node_incremental = '<c-space>',
                        -- scope_incremental = '<c-S>',
                        -- node_decremental = '<c-backspace>',
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>sa"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>sA"] = "@parameter.inner",
                        },
                    },
                },
            })
        end,
    },
    {
        "00sapo/visual.nvim",
        event = "VeryLazy", -- this is for making sure our keymaps are applied after the others: we call the previous mapppings, but other plugins/configs usually not!
        -- opts = {},
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({})
        end,
    },
}
