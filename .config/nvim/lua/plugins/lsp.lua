return {
    { "williamboman/mason.nvim", config = function()
        -- import mason plugin safely
        local mason_status, mason = pcall(require, "mason")
        if not mason_status then
            return
        end

        -- import mason-lspconfig plugin safely
        local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
        if not mason_lspconfig_status then
            return
        end

        -- import mason-null-ls plugin safely
        local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
        if not mason_null_ls_status then
            return
        end

        -- enable mason
        mason.setup()

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "tsserver",
                "html",
                "sumneko_lua",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })

        mason_null_ls.setup({
            -- list of formatters & linters for mason to install
            ensure_installed = {
                "prettier", -- ts/js formatter
                "stylua", -- lua formatter
                "eslint_d", -- ts/js linter
            },
            -- auto-install configured formatters & linters (with null-ls)
            automatic_installation = true,
        })
    end }, -- in charge of managing lsp servers, linters & formatters
    "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
    {
        "neovim/nvim-lspconfig",
        dependecies = {
            "jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
        },

        config = function()
            local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end


            local lspconfig_status, lspconfig = pcall(require, "lspconfig")
            if not lspconfig_status then
                return
            end
            -- import typescript plugin safely
            local typescript_setup, typescript = pcall(require, "typescript")
            if not typescript_setup then
                return
            end

            local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
            if not cmp_nvim_lsp_status then
                return
            end
            local keymap = vim.keymap -- for conciseness

            -- enable keybinds only for when lsp server available
            local on_attach = function(client, bufnr)
                -- keybind options
                local opts = { noremap = true, silent = true, buffer = bufnr }

                -- set keybinds
                keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
                keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
                keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
                keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
                keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
                keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
                keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
                keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
                keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
                keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
                keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
                -- keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

                -- typescript specific keymaps (e.g. rename file and update imports)
                if client.name == "tsserver" then
                    keymap.set("n", "<leader>rf", ":TypecriptRenameFile<CR>") -- rename file and update imports
                    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
                    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
                end
            end

            -- used to enable autocompletion (assign to every lsp server config)
            local capabilities = cmp_nvim_lsp.default_capabilities()


            -- configure html server
            lspconfig["html"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure typescript server with plugin
            typescript.setup({
                server = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                },
            })

            -- configure css server
            lspconfig["cssls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- tailwindcss server
            lspconfig["tailwindcss"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- csharp server
            lspconfig["omnisharp"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            local languageServerPath = vim.fn.stdpath("data") .. "/mason/bin/ngserver"
            local cmd = { "ngserver", "--stdio", "--tsProbeLocations", languageServerPath, "--ngProbeLocations",
                languageServerPath }

            lspconfig.angularls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = cmd,
                on_new_config = function(new_config, new_root_dir)
                    new_config.cmd = cmd
                end,
            }
            -- configure lua server (with special settings)
            lspconfig["sumneko_lua"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = { -- custom settings for lua
                    Lua = {
                        -- make the language server recognize "vim" global
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            -- make language server aware of runtime files
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            })

        end
    },


    "jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
    "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
    "onsails/lspkind-nvim",
    { "glepnir/lspsaga.nvim", branch = "main" }, -- enhanced lsp uis
    { "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end,
    },

}
