return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["jose-elias-alvarez/typescript.nvim"] = {},

  ['github/copilot.vim'] = {} ,

  -- Override plugin definition options
  ["goolord/alpha-nvim"] = {
    disable = false,
  },

  ["folke/which-key.nvim"] = {
    disable = false,
  }
}
