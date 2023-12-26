-- In order to modify the `lspconfig` configuration:
local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "c_sharp",
        "cpp",
        "dockerfile",
        "markdown",
        "python",
        "regex",
        "terraform",
        "vimdoc",
      }
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        names = false,
      },
    },
  },
  {
   "williamboman/mason.nvim",
   opts = {
    ensure_installed = {
      "azure-pipelines-language-server",
      "clangd",
      "csharp-language-server",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "html-lsp",
      "lua-language-server",
      "netcoredbg",
      "powershell-editor-services",
      "prettier",
      "stylua",
      "terraform-ls",
      "yaml-language-server",
    },
   },
  },
  {
    "mfussenegger/nvim-dap",
    config = function ()
      require("custom.dap")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function ()
      require("dapui").setup()
    end
  }
}
return plugins
