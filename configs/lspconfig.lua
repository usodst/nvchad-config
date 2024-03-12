local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
  "bashls",
  "clangd",
  "csharp_ls",
  "cssls",
  "docker_compose_language_service",
  "dockerls",
  "html",
  "jedi_language_server",
  "terraformls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.powershell_es.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  bundle_path = vim.fn.stdpath "data" .. "/mason/packages/powershell-editor-services",
}

lspconfig.azure_pipelines_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
          "*/.Pipeline*/**/*.y*l",
          "*/.Pipeline*/*.y*l",
          "*/.pipeline*/**/*.y*l",
          "*/.pipeline*/*.y*l",
          "/*.azure*",
          "/azure-pipeline*.y*l",
          "Azure-Pipelines/**/*.y*l",
          "Pipelines/**/*.y*l",
        },
      },
    },
  },
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        kubernetes = "*.k8s.yaml",
      },
    },
  },
}
