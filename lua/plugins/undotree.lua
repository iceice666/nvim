return {

  -- Undo history
  "mbbill/undotree",
  event = "BufReadPost",
  keys = {
    { "<leader>U", "<cmd>UndotreeToggle<cr>", desc = "Undo tree" },
  },
}
