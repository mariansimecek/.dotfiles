
local function openConfig()
  local configPath = vim.fn.stdpath("config")
  vim.cmd("edit " .. configPath .. "/init.lua")
end

local function cleanSwap ()
  vim.cmd("silent! !rm -rf " .. vim.fn.stdpath("cache") .. "/swap/*")
end

vim.api.nvim_create_user_command("Config", openConfig, {})
vim.api.nvim_create_user_command("CleanSwap", cleanSwap, {})
