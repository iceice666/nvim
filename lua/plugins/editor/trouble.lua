return {
  -- Trouble / show diagnostics
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Trouble",
  opts = {
    use_diagnostic_signs = true,
  },

  keys = {
    { "<leader>stf", "<cmd>Trouble document_diagnostics<cr>",  desc = "Trouble: Show diagnostics of current file" },
    { "<leader>stw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Trouble: Show diagnostics of current workspace" },
    { "<leader>stc", "<cmd>TroubleClose<cr>",                  desc = "Trouble: Close Trouble" },
  }
}
