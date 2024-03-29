vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

vim.keymap.set({ "n", "v" }, "gs", "^")
vim.keymap.set({ "n", "v" }, "gl", "$")
vim.keymap.set({ "n", "v" }, "ge", "G")
vim.keymap.set({ "n", "v" }, "gh", "0")

vim.keymap.set("n", "U", "<C-r>")

vim.keymap.set("n", "sr", ":%s///gc<Left><Left><Left><Left>", { desc = "Native search and replace" })
