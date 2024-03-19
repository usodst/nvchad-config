local M = {}

local GetDllFiles = function()
  local dllFiles = vim.fs.find(function(name, _)
    return name:match ".*dll$"
  end, { type = "file", limit = math.huge })
  return dllFiles
end

M.adapter = {
  type = "executable",
  command = vim.fs.find({ "netcoredbg", "netcoredbg.exe" }, {
    path = vim.fn.stdpath "data" .. "/mason/packages/netcoredbg",
    type = "file",
  })[1],
  args = { "--interpreter=vscode" },
}

M.config = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      -- return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
      local program = ""
      vim.ui.select(GetDllFiles(), {
        prompt = "Path to the dll:",
      }, function(choice)
        program = choice
      end)
      return program
    end,
  },
}

return M
