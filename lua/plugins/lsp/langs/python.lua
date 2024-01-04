local config = {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

require("lspconfig").pyright.setup(
  vim.tbl_extend("force", require("plugins.lsp.langs.default"), config)
)
