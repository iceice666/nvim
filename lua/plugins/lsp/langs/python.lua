local lsp_default = require("plugins.lsp.langs.default")

require("lspconfig").pyright.setup({
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
  capabilities = lsp_default.capabilities(),
  on_attach = lsp_default.on_attach,
})
