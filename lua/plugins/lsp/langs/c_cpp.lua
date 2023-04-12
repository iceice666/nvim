local lspconfig = require("lspconfig")
local lsp_config = require("plugins.lsp.langs.default").lsp_config

return function()
  lspconfig.clangd.setup(lsp_config({}))
end
