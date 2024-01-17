return {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = function(client, bufnr)
    require("lsp-inlayhints").on_attach(client, bufnr)
    require("lsp-inlayhints").show()
  end,
}
