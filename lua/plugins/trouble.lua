return {
  -- Trouble / show diagnostics
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Trouble",
  config = function()
    require("trouble").setup({
      use_diagnostic_signs = true,
    })

    local mapx = vim.g.mapx
    mapx.name("<leader>st", "Trouble: Show Troubles")
    mapx.group({ silent = true }, function()
      mapx.nnoremap(
        "<leader>stf",
        "<cmd>Trouble document_diagnostics<cr>",
        "Trouble: Show diagnostics of current file"
      )
      mapx.nnoremap(
        "<leader>stw",
        "<cmd>Trouble workspace_diagnostics<cr>",
        "Trouble: Show diagnostics of current workspace"
      )
      mapx.nnoremap(
        "<leader>stc",
        "<cmd>TroubleClose<cr>",
        "Trouble: Close Trouble"
      )
    end)
  end,
}
