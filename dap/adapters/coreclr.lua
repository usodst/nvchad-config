local M = {}

M.adapter = {
  type = 'executable',
  command = vim.fs.find({"netcoredbg","netcoredbg.exe"},{
    path = vim.fn.stdpath('data') .. "/mason/packages/netcoredbg"
  })[1],
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
