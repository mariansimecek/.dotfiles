-- custom vim.keymap settings
vim.g.mapleader = " "

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set("n", "<leader>so", ":%so<CR>", { desc = "Source file" })

-- clear search highlights
vim.keymap.set("n", "<Esc>", ":nohl<CR>")

-- Save file
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("v", "<leader>w", "<Esc>:w<CR>gv", { desc = "Save file" })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- support moving in edit mode
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
-- Disable arrow keys
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Down>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")

-- disable adding char to buffer
vim.keymap.set("n", "x", '"_x')
vim.keymap.set({ "n", "v" }, "p", "P")


vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")


vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")



vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Telescope
-- TODO: add desc
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fa", ":Telescope find_files follow=true no_ignore=true hidden=true<CR>")
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>")
vim.keymap.set("n", "<leader>fw", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>gc", ":Telescope git_commits<CR>")
vim.keymap.set("n", "<leader>gi", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "<leader>gr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "<leader>D", ":Telescope diagnostics<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>sk", ":Telescope keymaps<CR>")


-- Format
vim.keymap.set({ "n", "v" }, "<leader>m", vim.lsp.buf.format, { desc = "Format file" })

-- Spell toggle
vim.keymap.set("n", "<leader>ss", ":setlocal spell!<CR>", { desc = "Toggle spell" })


-- Search and replace
vim.keymap.set("n", "<leader>rs", ":%s///gc<Left><Left><Left><Left>", { desc = "Native search and replace" })
vim.keymap.set("v", "<leader>rs", ":s///gc<Left><Left><Left><Left>", { desc = "Native search and replace in selection" })

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

vim.keymap.set("n", "<leader>l", ":Lazy<CR>")

-- Helix keybinds
vim.keymap.set({ "n", "v" }, "gs", "^")
vim.keymap.set({ "n", "v" }, "gl", "$")
vim.keymap.set({ "n", "v" }, "ge", "G")
vim.keymap.set({ "n", "v" }, "gh", "0")

vim.keymap.set("n", "ma", "va")
vim.keymap.set("n", "mi", "vi")

vim.keymap.set("n", "c", "v\"_di")
vim.keymap.set("n", "d", "v\"_d")

--delete single char
vim.keymap.set("n", "d", "vd")

-- select line
vim.keymap.set("n", "x", "V")
vim.keymap.set("v", "x", "j")
vim.keymap.set("v", "X", "k")
--
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("v", ";", "<Esc>")
