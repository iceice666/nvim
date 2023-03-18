return {
  "ErichDonGubler/lsp_lines.nvim",
  config = function()
    local mapx = require("core.keymap").mapx
    require("lsp_lines").setup()
    mapx.nnoremap("<leader>l", function()
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
    end, "Toggle lsp lines")
  end,
}
