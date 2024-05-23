local lsp_default = require("plugins.lsp.server._default")

require("lspconfig").pyright.setup({
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
    hint = {
      enable = true,
    },
  },
  capabilities = lsp_default.capabilities(),
  on_attach = lsp_default.on_attach,
})
