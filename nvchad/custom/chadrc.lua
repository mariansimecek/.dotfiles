-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "ayu-dark",
}

M.plugins = require "custom.plugins"

return M
