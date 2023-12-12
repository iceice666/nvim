local lspconfig = require("lspconfig")
local lsp_config = require("plugins.lsp.langs._default").lsp_config

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
