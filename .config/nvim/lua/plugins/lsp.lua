return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "j-hui/fidget.nvim",
                opts = {
                    text = { spinner = "dots" },
                    sources = {
                        ["null-ls"] = {
                            ignore = true,
                        },
                    },
                    -- fmt = {
                    --     task = function(task_name, message, percentage)
                    --         if task_name == "code_action" then
                    --             return false
                    --         end
                    --         return string.format(
                    --             "%s%s [%s]",
                    --             message,
                    --             percentage and string.format(" (%s%%)", percentage) or "",
                    --             task_name
                    --         )
                    --     end,
                    -- },
                },
            }, -- Lsp status notifications
            { "folke/neodev.nvim", config = true },
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "jose-elias-alvarez/typescript.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "tsserver",
                },
            })

            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lsp_attach = function(client, bufnr)
                -- set keybinds
                vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP show [g]o [r]eferences" })
                vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP show [g]o [f]inder" })
                vim.keymap.set("n", "gd", "<C-]>", { desc = "LSP show [g]o [d]efinition" })
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP [g]o to [D]eclaration" })
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "LSP [g]o to [i]mplementation" })
                vim.keymap.set("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", { desc = "Show [c]ode [a]ction" })
                vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "LSP [r]e[n]ame" })
                vim.keymap.set(
                    "n",
                    "<leader>ld",
                    "<cmd>Lspsaga show_line_diagnostics<CR>",
                    { desc = "Show [l]ine [d]iagnostic" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>d",
                    "<cmd>Lspsaga show_cursor_diagnostics<CR>",
                    { desc = "Show cursor [d]iagnostic" }
                )
                vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Jump prev [d]iagnostic" })
                vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Jump next [d]iagnostic" })
                vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover docs" })

                -- typescript specific keymaps (e.g. rename file and update imports)
                if client.name == "tsserver" then
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                    require("typescript").setup({})
                    vim.keymap.set(
                        "n",
                        "<leader>rf",
                        ":TypecriptRenameFile<CR>",
                        { desc = "Typescript [r]ename [f]ile" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>oi",
                        ":TypescriptOrganizeImports<CR>",
                        { desc = "Typescript [o]rganize [i]mports" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>ru",
                        ":TypescriptRemoveUnused<CR>",
                        { desc = "Typescript [r]emove [u]nused" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>mi",
                        ":TypescriptAddMissingImports<CR>",
                        { desc = "Typsecript add [m]issing [i]mports" }
                    )
                end
            end

            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        on_attach = lsp_attach,
                        capabilities = lsp_capabilities,
                    })
                end,
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
            },
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- require("typescript.extensions.null-ls.code-actions"),
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.diagnostics.eslint_d,
                    null_ls.builtins.code_actions.eslint_d,
                    null_ls.builtins.completion.spell,
                },
            })

            require("mason-null-ls").setup({
                ensure_installed = {
                    "prettier",
                    "stylua",
                    "eslint_d",
                },
                automatic_installation = true,
                automatic_setup = true,
            })
        end,
        dependencies = {
            "jayp0521/mason-null-ls.nvim",
            "williamboman/mason.nvim",
        },
    },
    {
        "glepnir/lspsaga.nvim",
        config = function()
            require("lspsaga").setup({
                ui = {
                    title = false,
                    -- border = 'single',
                    expand = "",
                    collapse = "",
                    preview = " ",
                    code_action = " ",
                    diagnostic = " ",
                    incoming = "",
                    outgoing = "",
                },
                symbol_in_winbar = {
                    enable = false,
                },
            })
        end,
    },
}
