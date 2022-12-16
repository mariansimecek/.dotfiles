require("mason").setup()
require("mason-null-ls").setup({
    automatic_setup = true,
    ensure_installed = {"scss"},
})
