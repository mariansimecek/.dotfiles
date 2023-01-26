return {
  { "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "j-hui/fidget.nvim", config = true }, -- Lsp status notifications
      { 'folke/neodev.nvim', config = true },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()

      require('mason-lspconfig').setup({
        ensure_installed = {
          'tsserver',
        }
      })

      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lsp_attach = function(client, bufnr)
        -- keybind options
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- set keybinds
        vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
        vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
        vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
        vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
        vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
        vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
        vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
        vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
        vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
        vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor

        -- typescript specific keymaps (e.g. rename file and update imports)
        if client.name == "tsserver" then
          vim.keymap.set("n", "<leader>rf", ":TypecriptRenameFile<CR>") -- rename file and update imports
          vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
          vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
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

  { "jayp0521/mason-null-ls.nvim",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      "williamboman/mason.nvim"
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "eslint_d",
        },
        automatic_installation = true,
      })
    end },
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
          code_action = ' ',
          diagnostic = ' ',
          incoming = '',
          outgoing = '',
          colors = {
            normal_bg = '#161616',
            title_bg = '#161616',
            red = '#ee5396',
            magenta = '#ee5396',
            orange = '#ee5396',
            yellow = '#ee5396',
            green = '#ee5396',
            cyan = '#ee5396',
            blue = '#ee5396',
            purple = '#ee5396',
          }
        },
        symbol_in_winbar = {
          enable = false,
        },
      })
      vim.api.nvim_set_hl(0, "SagaBorder", { link = "TelescopeNormal" })
      vim.api.nvim_set_hl(0, "SagaNormal", { link = "TelescopeNormal" })
      vim.api.nvim_set_hl(0, "RenameNormal", { link = "TelescopePromptNormal" })
      vim.api.nvim_set_hl(0, "RenameBorder", { link = "TelescopePromptBorder" })
      vim.api.nvim_set_hl(0, "CodeActionText", { link = "TelescopeNormal" })
    end
  },

}
