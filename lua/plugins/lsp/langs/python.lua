local lspconfig = require("lspconfig")
local lsp_config = require("plugins.lsp.langs._default").lsp_config

lspconfig.pyright.setup(lsp_config({
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
}))
