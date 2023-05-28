return {
  "kdheepak/lazygit.nvim",
  event = "VimEnter",
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- Lazygit
    vim.g.mapx.nnoremap("<leader>g", "<cmd>LazyGit<cr>", "Lazy")
  end,
}
