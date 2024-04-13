local capabilities = function()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  return capabilities
end

return {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require("lsp-inlayhints").on_attach(client, bufnr)
    require("lsp-inlayhints").show()
  end,
}
