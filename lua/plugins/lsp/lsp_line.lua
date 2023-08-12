return {
  "ErichDonGubler/lsp_lines.nvim",
  keys = { "<space>ud" },
  event = "BufReadPost",
  config = function()
    local mapx = vim.g.mapx
    require("lsp_lines").setup()
    mapx.nnoremap("<leader>ud", function()
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
    end, "Utils: Toggle diagnostic shown mode")
    vim.diagnostic.config({
      virtual_text = false,
    })
  end,
}
