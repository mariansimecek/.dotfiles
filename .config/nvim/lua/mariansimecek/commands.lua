
local function openConfig()
  local configPath = vim.fn.stdpath("config")
  vim.cmd("edit " .. configPath .. "/init.lua")
  vim.cmd("cd " .. configPath)
end

vim.api.nvim_create_user_command("Config", openConfig, {})
