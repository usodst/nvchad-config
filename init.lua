vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.relativenumber = true
vim.opt.spell = true
vim.lsp.set_log_level("off")

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"terraform", "markdown", "lua", "tf", "sh", "json"},
  callback = function ()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end
})
