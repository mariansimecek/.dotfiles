return {
    { "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            { "j-hui/fidget.nvim", config = true, opts = { text = { spinner = "dots", } } }, -- Lsp status notifications c
            { 'folke/neodev.nvim', config = true },
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "jose-elias-alvarez/typescript.nvim"
        },
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'tsserver',
                }
            })

            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lsp_attach = function(client, bufnr)
                -- set keybinds
                vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP show [g]o [r]eferences" })
                vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP show [g]o [f]inder" })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP show [g]o [d]efinition" })
                vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>",
                    { desc = "LSP [g]o to [D]eclaration" })
                vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>",
                    { desc = "LSP [g]o to [i]mplementation" })
                vim.keymap.set("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", { desc = "Show [c]ode [a]ction" })
                vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "LSP [r]e[n]ame" })
                vim.keymap.set("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>",
                    { desc = "Show line [D]iagnostic" })
                vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>",
                    { desc = "Show cursor [d]iagnostic" })
                vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Jump prev [d]iagnostic" })
                vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Jump next [d]iagnostic" })
                vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover docs" })

                -- typescript specific keymaps (e.g. rename file and update imports)
                if client.name == "tsserver" then
                    require("typescript").setup({})
                    vim.keymap.set("n", "<leader>rf", ":TypecriptRenameFile<CR>", { desc = "Typescript [r]ename [f]ile" })
                    vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>",
                        { desc = "Typescript [o]rganize [i]mports" })
                    vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>",
                        { desc = "Typescript [r]emove [u]nused" })
                    vim.keymap.set("n", "<leader>mi", ":TypescriptAddMissingImports<CR>",
                        { desc = "Typsecript add [m]issing [i]mports" })
                end
            end

            local lspconfig = require('lspconfig')
            require('mason-lspconfig').setup_handlers({
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
        config = function()
            require("mason").setup()
        end,
    },
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufEnter",
    config = function()
        local null_ls = require 'null-ls'
        local formatting = null_ls.builtins.formatting
        local code_actions = null_ls.builtins.code_actions
        local diagnostics = null_ls.builtins.diagnostics
        require("null-ls").setup({
            sources = {
                formatting.prettierd,
                formatting.stylua,
                code_actions.eslint_d,
                diagnostics.eslint_d
            }
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
        "williamboman/mason.nvim"
    },
    {
        "glepnir/lspsaga.nvim",
        config = function()
            require("lspsaga").setup({
                ui = {
                    title = false,
                    -- border = 'single',
                    expand = '',
                    collapse = '',
                    preview = ' ',
                    code_action = ' ',
                    diagnostic = ' ',
                    incoming = '',
                    outgoing = '',
                },
                symbol_in_winbar = {
                    enable = false,
                },
            })
        end
    },
}
