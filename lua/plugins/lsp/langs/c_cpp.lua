local lspconfig = require("lspconfig")
local lsp_config = require("plugins.lsp.langs.default").lsp_config

lspconfig.clangd.setup(lsp_config({
	capabilities = { offsetEncoding = { "utf-16" } },
}))

require("clangd_extensions.inlay_hints").setup_autocmd()
require("clangd_extensions.inlay_hints").set_inlay_hints()
