
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
