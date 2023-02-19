return {
-- Trouble / show diagnostics
  "folke/trouble.nvim",
  requires = "nvim-tree/nvim-web-devicons",
  config = function()
    require("trouble").setup({
      use_diagnostic_signs = true
    })

    local mapx = require("core.keymap").mapx
    mapx.group({ silent = true }, function()
      mapx.nnoremap("<leader>sd", "<cmd>Trouble document_diagnostics<cr>",
        "Trouble: Show diagnostics of current file")
      mapx.nnoremap("<leader>sD", "<cmd>Trouble workspace_diagnostics<cr>",
        "Trouble: Show diagnostics of current workspace")
      mapx.nnoremap("<leader>stc", "<cmd>TroubleClose<cr>", "Trouble: Close Trouble")
    end
    )
  end
}
