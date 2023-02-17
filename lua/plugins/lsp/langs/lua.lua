local lspconfig = require("lspconfig")
local lsp_config = require("plugins.lsp.langs.default").lsp_config

return function()
  lspconfig.lsp_ls.setup(lsp_config({
    before_init = require("neodev.lsp").before_init,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "require" },
        },
        completion = {
          callSnippet = "Both",
        },
      },
    },
  }))
end
