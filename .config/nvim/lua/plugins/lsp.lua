return {
  { "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "j-hui/fidget.nvim", config = true }, -- Lsp status notifications
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
        vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP show [g]o [f]inder" })
        vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { desc = "LSP show [g]o [d]efinition" })
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "LSP [g]o to [D]eclaration" })
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "LSP [g]o to [i]mplementation" })
        vim.keymap.set("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", { desc = "Show [c]ode [a]ction" })
        vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "LSP [r]e[n]ame" })
        vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show line [D]iagnostic" })
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
          vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", { desc = "Typescript [r]emove [u]nused" })
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
          code_action = ' ',
          diagnostic = ' ',
          incoming = '',
          outgoing = '',
          colors = {
            normal_bg = '#161616',
            title_bg = '#262626',
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

-- #262626
-- #393939
-- #ff7eb6
-- #42be65
-- #82cfff
-- #33b1ff
-- #ee5396
-- #3ddbd9
-- #dde1e6
-- #ffffff

      vim.api.nvim_set_hl(0, "SagaBorder", { link = "TelescopeNormal" })
      vim.api.nvim_set_hl(0, "SagaNormal", { link = "TelescopeNormal" })
      vim.api.nvim_set_hl(0, "RenameNormal", { link = "TelescopePromptNormal" })
      vim.api.nvim_set_hl(0, "RenameBorder", { link = "TelescopePromptBorder" })
      vim.api.nvim_set_hl(0, "CodeActionText", { link = "TelescopeNormal" })
    end
  },

}
