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
M.harpoon = {
  n = {
    ["<leader>tm"] = {
      function ()
        require('harpoon.ui').toggle_quick_menu()
      end,
      "Harpoon toggle menu"
    },
    ["<leader>ta"] = {
      function ()
        require('harpoon.mark').add_file()
      end,
      "Harpoon add file"
    },
    ["<leader>tn"] = {
      function ()
        require('harpoon.ui').nav_next()
      end,
      "Harpoon add file"
    },
    ["<leader>tp"] = {
      function ()
        require('harpoon.ui').nav_prev()
      end,
      "Harpoon add file"
    }
  }
}

return M
