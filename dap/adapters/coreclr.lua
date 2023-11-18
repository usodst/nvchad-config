local M = {}

M.adapter = {
  type = 'executable',
  command = vim.fn.stdpath('data') .. "/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe",
  args = {'--interpreter=vscode'}
}

M.config = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

return M
