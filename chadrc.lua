---@type ChadrcConfig 
local M = {}

M.ui = {
  theme        = 'nord',
  transparency = true
}
M.plugins = 'custom.plugins'
M.mappings = require("custom.configs.mappings")

return M
