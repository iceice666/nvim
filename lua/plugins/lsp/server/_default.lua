M = {}

function M.get_capabilities()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  return capabilities
end

function M.on_attach(client, bufnr)
  if client.supports_method("textDocument/inlayHint", { bufnr = bufnr }) then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
  local ok, res = pcall(require, "copilot_cmp")
  if ok then
    res._on_insert_enter({})
  end
end

return M
