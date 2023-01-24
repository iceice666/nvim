local mapx = require("core.keymap").mapx
local colors = require("core.colors").colors
--require("neodev").setup({})

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

require('lspsaga').setup({
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = false,
  },
  ui = {
    colors = {
      normal_bg = colors.bg(),
      title_bg = colors.bg(),
      red = colors.red(),
      magenta = colors.magenta(),
      orange = colors.orange(),
      yellow = colors.yellow(),
      green = colors.green(),
      cyan = colors.cyan(),
      blue = colors.blue(),
      purple = colors.pink(),
      white = colors.white(),
      black = colors.black(),
    }
  }
})
-- ===========================Mapping===================================
mapx.nname("g", "Goto")
mapx.nname("<leader>s", "Show info")
local lsp_mapping = function(_, bufnr)
  --  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  mapx.group({ silent = true, buffer = bufnr }, function()
    mapx.nnoremap("gd", "<cmd>Lspsaga peek_definition<CR>", "LSP: Peek defintion")
    mapx.nnoremap("gD", "<cmd>Lspsaga goto_definition<CR>", "LSP: Goto definiton")
    mapx.nnoremap("gh", "<cmd>Lspsaga lsp_finder<CR>", "LSP: Find keyword")
    mapx.nnoremap("gH", "<cmd>Lspsaga hover_doc<CR>", "LSP: Show doc")
    mapx.nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    mapx.nnoremap("gr", "<cmd>Lspsaga rename<CR>", "LSP: Rename")
    mapx.nnoremap("g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", "LSP: Go prev diagnostic")
    mapx.nnoremap("g]", "<cmd>lua vim.diagnostic.goto_next()<CR>", "LSP: Go next diagnostic")
    mapx.nnoremap("<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", "LSP: Show current buffer diagnostics")
    mapx.nnoremap("<leader>so", "<cmd>Lspsaga outline<CR>", "LSP: Show current buffer symbol outline")
    mapx.nnoremap("<leader>sh", "<cmd>vim.lsp.buf.signature_help", "LSP: Show signature help")

    mapx.nnoremap("<leader>ca", "<cmd>Lspsaga code_action<CR>", "LSP: Code action")
    mapx.vnoremap("<leader>ca", "<cmd>Lspsaga code_action<CR>", "LSP: Code action")
  end)
end
-- =====================================================================

local lsp_config = function(settings)
  settings = settings or {}
  return (
      vim.tbl_extend(
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
