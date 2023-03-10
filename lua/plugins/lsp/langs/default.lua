local mapx = require("core.keymap").mapx

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- stylua: ignore
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

local vnoremaps = {
  { "<leader>ca", "<cmd>Lspsaga code_action<cr>", "LSP: Code action" },
}

mapx.nname("g", "Goto")
mapx.nname("<leader>s", "Show info")

local do_map = function(bufnr, nnms, vnms)
  mapx.group({ silent = true, buffer = bufnr }, function()
    for _, k in ipairs(nnms) do
      mapx.nnoremap(k[1], k[2], k[3])
    end
    for _, k in ipairs(vnms) do
      mapx.vnoremap(k[1], k[2], k[3])
    end
  end)
end

local lsp_config = function(settings)
  settings = settings or {}
  return (
      vim.tbl_extend("force", {
        on_attach = function(_, bufnr)
          do_map(bufnr, nnoremaps, vnoremaps)
        end,
        capabilities = capabilities,
      }, settings)
      )
end

return {
  nnoremaps = nnoremaps,
  vnoremaps = vnoremaps,
  lsp_config = lsp_config,
  do_map = do_map,
  capabilities = capabilities,
}
