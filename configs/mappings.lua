local M = {}

M.nvim_dap = {
  n = {
    ["<F5>"] = {
      function ()
        require('dap').continue()
      end,
      "Start debugging"
    },
    ["<F9>"] = {
      function ()
        require('dap').toggle_breakpoint()
      end,
      "Toggle breakpoint"
    },
    ["<F10>"] = {
      function ()
        require('dap').step_over()
      end,
      "Step over"
    },
    ["<F11>"] = {
      function ()
        require('dap').step_into()
      end,
      "Step into"
    },
    ["<F12>"] = {
      function ()
        require('dap').step_out()
      end,
      "Step out"
    },
  }
}

return M
