local lsp_default = require("plugins.lsp.server._default")

if vim.g.util.is_npm_package_installed("vue") then
  return
end

-- TODO: add keybindings
require("typescript-tools").setup({
  capabilities = lsp_default.capabilities(),
  on_attach = lsp_default.on_attach,
})
