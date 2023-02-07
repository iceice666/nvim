local vnoremaps = require("plugins.lsp.langs.default").vnoremaps
local do_map = require("plugins.lsp.langs.default").do_map

local nnoremaps = {
  { "gd", "<cmd>Lspsaga peek_definition<cr>", "LSP: Peek defintion" },
  { "gD", "<cmd>Lspsaga goto_definition<cr>", "LSP: Goto definiton" },
  { "gh", "<cmd>Lspsaga lsp_finder<cr>", "LSP: Find keyword" },
  { "gH", "<cmd>Lspsaga hover_doc ++keep<cr>", "LSP: Show doc" },
  { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>" },
  { "gr", "<cmd>Lspsaga rename<cr>", "LSP: Rename" },
  { "g[", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "LSP: Go prev diagnostic" },
  { "g]", "<cmd>lua vim.diagnostic.goto_next()<cr>", "LSP: Go next diagnostic" },
  { "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<cr>", "LSP: Show current buffer diagnostics" },
  { "<leader>so", "<cmd>GoPkgOutline<cr>", "LSP: Show current buffer symbol outline" },
  { "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "LSP: Show signature help" },
  { "<leader>ca", "<cmd>Lspsaga code_action<cr>", "LSP: Code action" }
}




local lsp_config = require("plugins.lsp.langs.default").lsp_config({
  on_attach = function(_, bufnr)
    do_map(bufnr, nnoremaps, vnoremaps)
  end,
  enableCodeLens = true
}
)

return function()
  require("go").setup {
    lsp_cfg = lsp_config,
    trouble = true,
    luasnip = true
  }
end
