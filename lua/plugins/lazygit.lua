return {
  "kdheepak/lazygit.nvim",
  event = "VimEnter",
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>g", "<cmd>LazyGit<cr>", desc = "Open lazygit" }
  }
}
