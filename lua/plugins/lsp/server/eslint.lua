local lsp_default = require("plugins.lsp.server._default")
require("lspconfig").eslint.setup({
  capabilities = lsp_default.get_capabilities(),
  server = {
    hint = {
      enable = true,
    }
  },
  settings = {
    packageManager = "npm",
  },
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })

    lsp_default.on_attach()
  end,
})