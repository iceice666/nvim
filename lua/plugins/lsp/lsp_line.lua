return {
  cond=false,
  "ErichDonGubler/lsp_lines.nvim",
  keys = { "<space>Td" },
  event = "BufReadPost",
  config = function()
    local mapx = vim.g.mapx
    require("lsp_lines").setup()
    mapx.nnoremap("<leader>Td", function()
      local diagnostics_on = require("lsp_lines").toggle()
      if diagnostics_on then
        vim.diagnostic.config({
          virtual_text = false,
        })
      else
        vim.diagnostic.config({
          virtual_text = { spacing = 2, prefix = " " },
        })
      end
    end, "LSP: Toggle diagnostic shown mode")
    vim.diagnostic.config({
      virtual_text = false,
    })
  end,
}
