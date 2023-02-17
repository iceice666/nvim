require("neodev").setup({ library = { plugins = { "neotest" }, types = true }, override = false })

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    -- lua
    "lua_ls",
    -- golang
    "gopls",
    -- python
    "pyright"

  },
  automatic_installation = true,
})
