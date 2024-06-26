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
        "lua",
        "markdown",
        "python",
        "regex",
        "terraform",
        "vimdoc",
        "yaml",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"
      opts.sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format.with {
          filetypes = {
            "c",
            "cpp",
            "java",
            "cuda",
            "proto",
          },
        },
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.yamlfmt,
      }
      return opts
    end,
    lazy = false,
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
        -- Language servers
        "azure-pipelines-language-server@0.7.0",
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

        -- Formatters
        "beautysh",
        "black",
        "clang-format",
        "csharpier",
        "yamlfmt",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "gsuuon/model.nvim",

    -- Don't need these if lazy = false
    cmd = { "M", "Model", "Mchat" },
    init = function()
      vim.filetype.add {
        extension = {
          mchat = "mchat",
        },
      }
    end,
    ft = "mchat",

    keys = {
      { "<C-m>d",       ":Mdelete<cr>", mode = "n" },
      { "<C-m>s",       ":Mselect<cr>", mode = "n" },
      { "<C-m><space>", ":Mchat<cr>",   mode = "n" },
    },

    -- To override defaults add a config field and call setup()

    config = function()
      local ollama = require "model.providers.ollama"
      local starters = require "model.prompts.chats"
      require("model").setup {
        default_prompt = {
          provider = ollama,
          params = {
            model = "starling-lm",
          },
          options = {
            url = "http://localhost:11434",
          },
          builder = function(input)
            return {
              prompt = "GPT4 Correct User: " .. input .. "<|end_of_turn|>GPT4 Correct Assistant: ",
            }
          end,
        },
        chats = {
          ["ollama:starling"] = vim.tbl_deep_extend("force", starters["ollama:starling"], {
            options = {
              url = "http://localhost:11434"
            },
          }),
        },
      }
    end,

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
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup {
        font = "JetBrainsMonoNL NF=30",
        theme = "Nord",
      }
    end,
  },
}
return plugins
