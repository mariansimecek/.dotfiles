vim.cmd("autocmd!")

local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

au("TextYankPost", {
    group = ag("yank_highlight", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
    end,
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
--enable spell
vim.opt.spell = false

-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- tab & indent
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 8
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.wrap = true

-- appearance
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.title = true
vim.opt.background = "dark"
-- vim.opt.winblend = 0
-- vim.opt.wildoptions = 'pum
-- vim.opt.pumblend = 5

vim.o.fillchars = "vert: ,horiz: "

-- cursor
vim.cmd("set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50")
-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- search
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })

-- backup & history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- command & status line
vim.opt.inccommand = "split"
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.shell = "zsh"
vim.opt.laststatus = 2

-- others
vim.opt.scrolloff = 10
vim.opt.backspace = { "start", "eol", "indent" }

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set nopaste",
})

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

vim.opt.iskeyword:append("-") -- consider string-string as whole word

-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""

vim.opt.updatetime = 50

-- vim.cmd([[highlight IndentBlanklineChar guifg=#3c3836]])

vim.cmd([[
sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=]])
