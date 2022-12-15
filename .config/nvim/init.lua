require("mariansimecek.keymap")
require("mariansimecek.base")
require("mariansimecek.plugins")

local function openConfig()
  local configPath = vim.fn.stdpath("config")
  vim.cmd("edit " .. configPath .. "/init.lua")
end
-- import config 
--
vim.api.nvim_create_user_command("Config", openConfig, {})
