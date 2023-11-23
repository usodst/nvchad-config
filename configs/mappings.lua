local M = {}

M.nvim_dap = {
  n = {
    ["<leader>dc"] = {
      function ()
        require('dap').continue()
      end,
      "Start debugging"
    },
    ["<leader>dt"] = {
      function ()
        require('dap').toggle_breakpoint()
      end,
      "Toggle breakpoint"
    },
    ["<leader>do"] = {
      function ()
        require('dap').step_over()
      end,
      "Step over"
    },
    ["<leader>di"] = {
      function ()
        require('dap').step_into()
      end,
      "Step into"
    },
    ["<leader>du"] = {
      function ()
        require('dap').step_out()
      end,
      "Step out"
    },
  }
}

return M
