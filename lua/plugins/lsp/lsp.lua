local mapx = require("core.keymap").mapx
local colors = require("core.colors")
require("neodev").setup({ library = { plugins = { "neotest" }, types = true }, override = false })

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
    enable_in_insert = false,
    sign = false,
    sign_priority = 40,
    virtual_text = true,
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

vim.fn.sign_define('DiagnosticSignError', {
  text = "",
  texthl = "DiagnosticSignError",
  linehl = "DiagnosticSignError",
  numhl = "DiagnosticSignError",
})
vim.fn.sign_define('DiagnosticSignWarn', {
  text = "",
  texthl = "DiagnosticSignWarn",
  linehl = "DiagnosticSignWarn",
  numhl = "DiagnosticSignWarn",
})
vim.fn.sign_define('DiagnosticSignHint', {
  text = "",
  texthl = "DiagnosticSignHint",
  linehl = "DiagnosticSignHint",
  numhl = "DiagnosticSignHint",
})
vim.fn.sign_define('DiagnosticSignInfo', {
  text = "",
  texthl = "DiagnosticSignInfo",
  linehl = "DiagnosticSignInfo",
  numhl = "DiagnosticSignInfo",
})

local lsp_mapping = function(_, bufnr)
  --  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

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
      before_init = require("neodev.lsp").before_init,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "require" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    }))
  end,
})


mapx.nname("g", "Goto")
mapx.nname("<leader>s", "Show info")
mapx.group({ silent = true }, function()
  mapx.nnoremap("gd", "<cmd>Lspsaga peek_definition<cr>", "LSP: Peek defintion")
  mapx.nnoremap("gD", "<cmd>Lspsaga goto_definition<cr>", "LSP: Goto definiton")
  mapx.nnoremap("gh", "<cmd>Lspsaga lsp_finder<cr>", "LSP: Find keyword")
  mapx.nnoremap("gH", "<cmd>Lspsaga hover_doc <cr>", "LSP: Show doc")
  mapx.nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
  mapx.nnoremap("gr", "<cmd>Lspsaga rename<cr>", "LSP: Rename")
  mapx.nnoremap("g[", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "LSP: Go prev diagnostic")
  mapx.nnoremap("g]", "<cmd>lua vim.diagnostic.goto_next()<cr>", "LSP: Go next diagnostic")
  mapx.nnoremap("<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<cr>", "LSP: Show current buffer diagnostics")
  mapx.nnoremap("<leader>so", "<cmd>Lspsaga outline<cr>", "LSP: Show current buffer symbol outline")
  mapx.nnoremap("<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "LSP: Show signature help")

  mapx.nnoremap("<leader>ca", "<cmd>Lspsaga code_action<cr>", "LSP: Code action")
  mapx.vnoremap("<leader>ca", "<cmd>Lspsaga code_action<cr>", "LSP: Code action")
end)
