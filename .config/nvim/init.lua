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
-- vim.opt.title = true
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

-- custom vim.keymap settings
vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "<leader>so", ":%so<CR>", { desc = "Source file" })

-- clear search highlights
vim.keymap.set("n", "<Esc>", ":nohl<CR>")

-- Save file
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("v", "<leader>w", "<Esc>:w<CR>gv", { desc = "Save file" })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- quifix next prev
vim.keymap.set("n", "<leader>j", ":cn<CR>")
vim.keymap.set("n", "<leader>k", ":cp<CR>")

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

-- fix copy paste
vim.keymap.set("v", "p", '"_dP')

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
-- DAP
vim.keymap.set("n", "<leader>gb", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>gB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>gh", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>gl", ":lua require'dapui'.toggle()<CR>")
--

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

local function format()
  vim.lsp.buf.format({
    filter = function(client)
      return client.name ~= "tsserver"
    end,
    timeout_ms = 2000,
  })
end
-- Format
vim.keymap.set({ "n", "v" }, "<leader>m", format, { desc = "Format file" })

-- Spell toggle
vim.keymap.set("n", "<leader>ss", ":setlocal spell!<CR>", { desc = "Toggle spell" })

-- Search and replace
vim.keymap.set("n", "<leader>rs", ":%s///gc<Left><Left><Left><Left>", { desc = "Native search and replace" })
vim.keymap.set(
  "v",
  "<leader>rs",
  ":s///gc<Left><Left><Left><Left>",
  { desc = "Native search and replace in selection" }
)

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

vim.keymap.set("n", "<leader>l", ":Lazy<CR>")

-- Helix keybinds
vim.keymap.set({ "n", "v" }, "gs", "^")
vim.keymap.set({ "n", "v" }, "gl", "$")
vim.keymap.set({ "n", "v" }, "ge", "G")
vim.keymap.set({ "n", "v" }, "gh", "0")

-- delete single char
-- vim.keymap.set("n", "d", "vd")

--not working with cool substitute
-- vim.keymap.set("n", "c", "vc")

-- select line
-- vim.keymap.set("n", "x", "V")
-- vim.keymap.set("v", "x", "j")
-- vim.keymap.set("v", "X", "k")
vim.keymap.set("n", "U", "<C-r>")
-- vim.keymap.set("v", ";", "<Esc>")
--
-- vim.keymap.set("n", "ma", "va")
-- vim.keymap.set("n", "mi", "vi")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

local function openConfig()
  local configPath = vim.fn.stdpath("config")
  vim.cmd("edit " .. configPath .. "/init.lua")
  vim.cmd("cd " .. configPath)
end

local setPwdfromActualFile = function()
  vim.cmd("cd %:p:h")
end

local setPwdFromGitRoot = function()
  vim.cmd("cd " .. vim.fn.system("git rev-parse --show-toplevel"))
end

vim.api.nvim_create_user_command("Config", openConfig, {})

vim.api.nvim_create_user_command("SetFilePwd", setPwdfromActualFile, {})
vim.api.nvim_create_user_command("SetGitPwd", setPwdFromGitRoot, {})
