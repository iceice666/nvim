local lsp_default = require("plugins.autocmp.langs.default")

require("lspconfig").lua_ls.setup({
  capabilities = lsp_default.capabilities(),
  on_attach = lsp_default.on_attach,
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
})
