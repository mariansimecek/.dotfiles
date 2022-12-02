-- custom keymap settings
vim.g.mapleader = ' '
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- use jk to exit insert mode
-- keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")


-- Save file
keymap.set('n', '<C-s>', ':w<CR>')
keymap.set('i', '<C-s>', '<Esc>:w<CR>')
keymap.set('v', '<C-s>', '<Esc>:w<CR>gv')

-- Normal-mode commands
keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)

-- Visual-mode commands
keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)

-- Disable arrow keys
keymap.set('n', '<Up>', '<Nop>')
keymap.set('n', '<Down>', '<Nop>')
keymap.set('n', '<Left>', '<Nop>')
keymap.set('n', '<Right>', '<Nop>')


-- disable adding char to buffer
keymap.set('n', 'x', '"_x')

-- Increment/decrement
-- keymap.set('n', '+', '<C-a>')
-- keymap.set('n', '-', '<C-x>')

-- Select all
-- keymap.set('n', '<C-a>', 'gg<S-v>G')

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
