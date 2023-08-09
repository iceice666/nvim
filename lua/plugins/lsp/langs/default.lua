local mapx = vim.g.mapx

local capabilities = require("cmp_nvim_lsp").default_capabilities()


-- stylua: ignore
local nnoremaps = {
  ["gp"]         = { "<cmd>Lspsaga peek_definition<cr>", "LSP: Peek defintion" },
  ["gd"]         = { vim.lsp.buf.definition, "LSP: Goto definiton" },
  ["gH"]         = { vim.lsp.buf.hover, "LSP: Show doc" },
  ["gi"]         = { vim.lsp.buf.implementation },
  ["gr"]         = { vim.lsp.buf.rename, "LSP: Rename" },
  ["g["]         = { vim.diagnostic.goto_prev, "LSP: Go prev diagnostic" },
  ["g]"]         = { vim.diagnostic.goto_next, "LSP: Go next diagnostic" },
  ["<leader>so"] = { vim.lsp.buf.document_symbol, "LSP: Show current buffer symbol outline" },
  ["<leader>sh"] = { vim.lsp.buf.signature_help, "LSP: Show signature help" },
  ["<leader>ca"] = { vim.lsp.buf.code_action, "LSP: Code action" }
}

local vnoremaps = {
  ["<leader>ca"] = { "<cmd>Lspsaga code_action<cr>", "LSP: Code action" },
}

-- mapping keybind
local do_map = function(bufnr, nnms, vnms)
  mapx.group({ silent = true, buffer = bufnr }, function()
    for k, v in ipairs(nnms) do
      mapx.nnoremap(k, v[1], v[2])
    end
    for k, v in ipairs(vnms) do
      mapx.vnoremap(k, v[1], v[2])
    end
  end)
end

local lsp_config = function(settings, nmaps, vmaps)
  settings = settings or {}
  nmaps = nmaps or nnoremaps
  vmaps = vmaps or vnoremaps

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
