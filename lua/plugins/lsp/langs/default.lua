local mapx = vim.g.mapx

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- stylua: ignore
local nnoremaps = {
  { "gp",         "<cmd>Lspsaga peek_definition<cr>",          "LSP: Peek defintion" },
  { "gd",         "<cmd>Lspsaga goto_definition<cr>",          "LSP: Goto definiton" },
  { "gf",         "<cmd>Lspsaga lsp_finder<cr>",               "LSP: Find keyword" },
  { "gH",         "<cmd>Lspsaga hover_doc ++keep<cr>",         "LSP: Show doc" },
  { "gi",         "<cmd>lua vim.lsp.buf.implementation()<cr>" },
  { "gr",         "<cmd>Lspsaga rename<cr>",                   "LSP: Rename" },
  { "g[",         "<cmd>lua vim.diagnostic.goto_prev()<cr>",   "LSP: Go prev diagnostic" },
  { "g]",         "<cmd>lua vim.diagnostic.goto_next()<cr>",   "LSP: Go next diagnostic" },
  { "<leader>so", "<cmd>Lspsaga outline<cr>",                  "LSP: Show current buffer symbol outline" },
  { "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "LSP: Show signature help" },
  { "<leader>ca", "<cmd>Lspsaga code_action<cr>",              "LSP: Code action" }
}

local vnoremaps = {
  { "<leader>ca", "<cmd>Lspsaga code_action<cr>", "LSP: Code action" },
}

-- mapping keybind
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

local lsp_config = function(settings, nmaps, vmaps)
  settings = settings or {}
  nmaps = nnoremaps or {}
  vmaps = vnoremaps or {}
  return (
      vim.tbl_extend("force", {
        on_attach = function(_, bufnr)
          do_map(bufnr, nmaps, vmaps)
        end,
        capabilities = capabilities,
      }, settings)
      )
end

return {
  nnoremaps = nnoremaps,
  vnoremaps = vnoremaps,
  lsp_config = lsp_config,
}
