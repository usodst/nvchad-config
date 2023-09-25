---@type ChadrcConfig 
local M = {}

M.ui = {theme = 'github_dark'}
M.plugins = 'custom.plugins'

vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"terraform", "markdown", "lua", "tf"},
  callback = function ()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end
})

return M
