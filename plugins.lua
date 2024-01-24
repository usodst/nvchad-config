-- In order to modify the `lspconfig` configuration:
local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
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
      "bash-language-server",
      "clangd",
      "csharp-language-server",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "html-lsp",
      "jedi-language-server",
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
  },
  {
    'gsuuon/model.nvim',

    -- Don't need these if lazy = false
    cmd = { 'M', 'Model', 'Mchat' },
    init = function()
      vim.filetype.add({
        extension = {
          mchat = 'mchat',
        }
      })
    end,
    ft = 'mchat',

    keys = {
      {'<C-m>d', ':Mdelete<cr>', mode = 'n'},
      {'<C-m>s', ':Mselect<cr>', mode = 'n'},
      {'<C-m><space>', ':Mchat<cr>', mode = 'n' }
    },

    -- To override defaults add a config field and call setup()

    config = function ()
      local ollama = require('model.providers.ollama')
      require('model').setup({
        default_prompt = {
            provider = ollama,
            params = {
              model = 'starling-lm'
            },
            builder = function(input)
              return {
                prompt = 'GPT4 Correct User: '
                  .. input
                  .. '<|end_of_turn|>GPT4 Correct Assistant: ',
              }
            end
          }
      })
    end

    -- config = function()
    --   require('model').setup({
    --     prompts = {..},
    --     chats = {..},
    --     ..
    --   })
    --
    --   require('model.providers.llamacpp').setup({
    --     binary = '~/path/to/server/binary',
    --     models = '~/path/to/models/directory'
    --   })
    --end
  }
}
return plugins
