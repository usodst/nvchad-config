-- In order to modify the `lspconfig` configuration:
local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "terraform"
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
   "williamboman/mason.nvim",
   opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "csharp-language-server",
        "clangd",
        "powershell-editor-services",
        "terraform-ls",
        "azure-pipelines-language-server",
        "dockerfile-language-server",
        "docker-compose-language-service"
      },
    },
  }
}
return plugins
