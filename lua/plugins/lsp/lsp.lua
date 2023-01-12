local _set = require("keybindings")._set

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "sumneko_lua",
    "jsonls",
  },
  automatic_installation = true,
})

local lspconfig = require("lspconfig")

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- ===========================Mapping===================================

-- LSP mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
_set("n", "[d", vim.diagnostic.goto_prev)
_set("n", "]d", vim.diagnostic.goto_next)

local lsp_mapping = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gh", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<f2>", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

-- =====================================================================

local lsp_config = function(settings)
  settings = settings or {}
  return (
      vim.tbl_deep_extend(
        "force",
        {
          on_attach = lsp_mapping,
          capabilities = capabilities,
        },
        settings
      )
      )
end

require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup(lsp_config())
  end,

  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup(lsp_config({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "require" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
        json = {
          schemas = require("schemastore").json.schemas({
            ignore = {
              ".eslintrc",
              "package.json",
            },
          }),
          validate = { enable = true },
        },
      },
    }))
  end,
})
