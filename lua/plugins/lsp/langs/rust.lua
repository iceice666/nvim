local rt = require("rust-tools")
local lsp_config = require("plugins.lsp.langs.default").lsp_config
local util = require("lspconfig/util")

-- stylua: ignore start
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
-- stylua: ignore end

return function()
  rt.setup({
    tools = {
      inlay_hints = {
        auto = true,
      },
    },
    server = lsp_config({
      filetypes = { "rust" },
      root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
          },
        },
      },
    }, nnoremaps, _),
  })
end
