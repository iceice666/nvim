require("neodev").setup({ library = { plugins = { "neotest" }, types = true }, override = false })

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    -- lua
    "sumneko_lua",
    -- python
    "pyright",
    -- golang
    "gopls",
    --"golangci_lint_ls",

  },
  automatic_installation = true,

})
