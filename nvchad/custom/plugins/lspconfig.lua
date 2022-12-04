local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tailwindcss"}

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


-- configure typescript server with plugin
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})
