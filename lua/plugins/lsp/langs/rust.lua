local rt = require("rust-tools")
local vnoremaps = require("plugins.lsp.langs.default").vnoremaps
local do_map = require("plugins.lsp.langs.default").do_map

-- stylua: ignore
--
-- https://github.com/simrat39/rust-tools.nvim#usage
local nnoremaps = {
  { "gd",         "<cmd>Lspsaga peek_definition<cr>",          "LSP: Peek defintion" },
  { "gD",         "<cmd>Lspsaga goto_definition<cr>",          "LSP: Goto definiton" },
  { "gh",         "<cmd>Lspsaga lsp_finder<cr>",               "LSP: Find keyword" },
  { "gH",         "<cmd>Lspsaga hover_doc ++keep<cr>",         "LSP: Show doc" },
  { "gi",         "<cmd>lua vim.lsp.buf.implementation()<cr>" },
  { "gr",         "<cmd>Lspsaga rename<cr>",                   "LSP: Rename" },
  { "g[",         "<cmd>lua vim.diagnostic.goto_prev()<cr>",   "LSP: Go prev diagnostic" },
  { "g]",         "<cmd>lua vim.diagnostic.goto_next()<cr>",   "LSP: Go next diagnostic" },
  { "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<cr>",     "LSP: Show current buffer diagnostics" },
  { "<leader>so", "<cmd>Lspsaga outline<cr>",                  "LSP: Show current buffer symbol outline" },
  { "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "LSP: Show signature help" },
  { "<leader>ca", "<cmd>Lspsaga code_action<cr>",              "LSP: Code action" }
}

return function()
  rt.setup({
    server = {
      on_attach = function(_, bufnr)
        do_map(bufnr, nnoremaps, vnoremaps)
      end,
    },
  })
end
