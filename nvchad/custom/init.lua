vim.g.copilot_assume_mapped = true
vim.opt.relativenumber = true
vim.opt.iskeyword:append("-") -- consider string-string as whole word

vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>',{noremap = true, silent = true})
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', {noremap = true, silent = true})
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', {noremap = true, silent = true})
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', {noremap = true, silent = true})
