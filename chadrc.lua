---@type ChadrcConfig 
local M = {}

M.ui = {
  theme        = 'github_dark',
  transparency = true
}
M.plugins = 'custom.plugins'
M.mappings = require("custom.configs.mappings")

return M
