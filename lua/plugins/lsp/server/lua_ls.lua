local lsp_default = require("plugins.lsp.server._default")

require("lspconfig").lua_ls.setup({
  capabilities = lsp_default.get_capabilities(),
  on_attach = lsp_default.on_attach,
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
    hint = {
      enable = true,
    },
  },
})

