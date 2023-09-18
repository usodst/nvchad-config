---@type ChadrcConfig 
local M = {}
local opt = vim.opt

M.ui = {theme = 'github_dark'}
M.plugins = 'custom.plugins'

opt.relativenumber = true

return M
