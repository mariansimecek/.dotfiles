
-- Helix keybinds
vim.keymap.set("n", "gs", "^")
vim.keymap.set("n", "gl", "$")
vim.keymap.set("n", "ge", "G")
vim.keymap.set("n", "gh", "0")

vim.keymap.set("v", "gs", "^")
vim.keymap.set("v", "gl", "$")
vim.keymap.set("v", "ge", "G")
vim.keymap.set("v", "gh", "0")

--delete single char
vim.keymap.set("n", "d", "vd")

-- select line
vim.keymap.set("n", "x", "V")
vim.keymap.set("v", "x", "j")
vim.keymap.set("v", "X", "k")
--
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("v", ";", "<Esc>")
