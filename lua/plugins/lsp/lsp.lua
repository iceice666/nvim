local km = require 'mapx'.setup { global = false }
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
local opt = { silent = true }
-- LSP mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
km.nnoremap("[d", vim.diagnostic.goto_prev, opt)
km.nnoremap("]d", vim.diagnostic.goto_next, opt)

local lsp_mapping = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- See `:help vim.lsp.*` for documentation on any of the below functions

  km.nnoremap("n", "gD", vim.lsp.buf.declaration, opt)
  km.nnoremap("n", "gd", vim.lsp.buf.definition, opt)
  km.nnoremap("n", "gh", vim.lsp.buf.hover, opt)
  km.nnoremap("n", "gi", vim.lsp.buf.implementation, opt)
  km.nnoremap("n", "gs", vim.lsp.buf.signature_help, opt)
  km.nnoremap("n", "<f2>", vim.lsp.buf.rename, opt)
  km.nnoremap("n", "<space>ca", vim.lsp.buf.code_action, opt)
  km.nnoremap("n", "gr", vim.lsp.buf.references, opt)
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
