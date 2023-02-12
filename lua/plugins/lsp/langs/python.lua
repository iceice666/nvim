local lspconfig = require("lspconfig")
local lsp_config = require("plugins.lsp.langs.default").lsp_config

return function()
  lspconfig.pyright.setup(lsp_config({
      settings = {
          python = {
              analysis = {
                  autoSearchPaths = true,
                  diagnosticMode = "workspace",
                  useLibraryCodeForTypes = true
              }
          }
      },
  }))
end
