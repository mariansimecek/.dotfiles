-- local M = {}
--
--
-- return M
-- TODO: in selection not working a i A I
-- TODO: normalize modes

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
--
-- local submode = require("submode")
--
-- vim.keymap.set("n", "v", function()
--     vim.cmd("normal! v")
--     submode:enter("select")
-- end)
--
-- vim.keymap.set("n", "V", function()
--     vim.cmd("normal! V")
--     submode:enter("select")
-- end)
--
-- -- vim.keymap.set("v", "i", function()
-- --     -- go to insermode
-- --     vim.cmd("normal! i")
-- --     -- print("i")
-- -- end, { noremap = true })
--
-- submode:setup {
--     leave_when_mode_changed = true
-- }
--
-- submode:create("select", {
--     mode = "v",
--     enter = "v",
-- })
--
--
-- submode:register("select", {
--     lhs = "<C-a>",
--     rhs = function()
--         -- processes to do before exit this submode
--         submode:leave()
--     end
-- })
--
--
-- local function isSelect(a1, a2)
--     return submode:mode() == "select" and a1 or a2
-- end
--
-- local function createHelixSelectKeymap(action)
--     vim.keymap.set("n", action, "v" .. action)
--     vim.keymap.set("v", action, function()
--         return isSelect(action, "<Esc>v" .. action)
--     end, { expr = true })
-- end
--
-- createHelixSelectKeymap("w")
-- createHelixSelectKeymap("b")
-- createHelixSelectKeymap("e")
--
--
-- vim.keymap.set("v", "j", function()
--     return isSelect("j", "<Esc>j")
-- end, { expr = true })
--
-- vim.keymap.set("v", "k", function()
--     return isSelect("k", "<Esc>k")
-- end, { expr = true })
--
-- vim.keymap.set("v", "l", function()
--     return isSelect("l", "<Esc>l")
-- end, { expr = true })
--
-- vim.keymap.set("v", "h", function()
--     return isSelect("h", "<Esc>h")
-- end, { expr = true })
