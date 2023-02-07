local lsp_config = require("plugins.lsp.langs.default").lsp_config

require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup(lsp_config())
  end,

  ["sumneko_lua"] = require("plugins.lsp.langs.lua"),

  ["gopls"] = require("plugins.lsp.langs.go"),

  ["pyright"] = require("plugins.lsp.langs.python"),
}

)
