local lspconfig = require("lspconfig")
local lsp_config = require("plugins.lsp.langs.default").lsp_config

return function()
  lspconfig.lua_ls.setup(lsp_config({
    before_init = require("neodev.lsp").before_init,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
        completion = {
          callSnippet = "Both",
        },
      },
    },
  }))
end
