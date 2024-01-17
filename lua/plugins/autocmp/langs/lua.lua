local config = {
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
}

require("lspconfig").lua_ls.setup(
  vim.tbl_extend("force", require("plugins.autocmp.langs.default"), config)
)
