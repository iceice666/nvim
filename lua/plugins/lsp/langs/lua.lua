local lspconfig = require("lspconfig")
local lsp_config = require("plugins.lsp.langs.deflaut").lsp_config

return function()
  lspconfig.sumneko_lua.setup(lsp_config({
    before_init = require("neodev.lsp").before_init,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "require" },
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  }))
end
