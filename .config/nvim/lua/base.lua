vim.cmd("autocmd!")
local opt = vim.opt
local wo = vim.wo

-- encoding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- line numebs
wo.number = true
wo.relativenumber = true

-- tab & indent
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true
opt.wrap = false -- No Wrap lines

-- apparence
opt.termguicolors = true
vim.opt.cursorline = true
opt.signcolumn = "yes"
opt.title = true
vim.opt.background = "dark"
-- vim.opt.winblend = 0
-- vim.opt.wildoptions = 'pum'
-- vim.opt.pumblend = 5
-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- search
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.hlsearch = true -- Highlight all matches on previous search pattern
opt.smartcase = true -- Don't ignore case with capitals
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })

-- backup & history
opt.undofile = true
opt.backup = false
opt.backupskip = { "/tmp/*", "/private/tmp/*" }

-- command & status line
opt.inccommand = "split"
opt.showcmd = true
opt.cmdheight = 1
opt.shell = "zsh"
opt.laststatus = 2

-- others
opt.scrolloff = 10
opt.backspace = { "start", "eol", "indent" }

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.iskeyword:append("-") -- consider string-string as whole word
