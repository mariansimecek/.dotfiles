-- custom vim.keymap settings
vim.g.mapleader = " "
local opts = { noremap = true, silent = true }

-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- reload config
vim.keymap.set("n", "<leader>so", ":source %<CR>")
-- clear search highlights
vim.keymap.set("n", "<Esc>", ":nohl<CR>")

-- Save file
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>gv")

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


vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Normal-mode commands
vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", opts)
vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", opts)

-- Visual-mode commands
vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", opts)
vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", opts)
-- restart lsp server
vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fa", ":Telescope find_files follow=true no_ignore=true hidden=true<CR>")
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>")
vim.keymap.set("n", "<leader>fw", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>gc", ":Telescope git_commits<CR>")
vim.keymap.set("n", "<leader>gs", ":Telescope git_commits<CR>")
vim.keymap.set("n", "<leader>gi", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "<leader>gr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "<leader>D", ":Telescope lsp_type_definitions<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>sk", ":Telescope keymaps<CR>")


-- Toggle term 
vim.keymap.set("n", "<A-\\>", ":ToggleTerm direction=horizontal<CR>")
-- function _G.set_terminal_keymaps()
--   local opts_term = {buffer = 0}
--   vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts_term)
--   vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts_term)
--   vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts_term)
--   vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts_term)
--   vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts_term)
--   vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts_term)
-- end
--
