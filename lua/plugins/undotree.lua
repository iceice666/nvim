return {

  -- Undo history
  "mbbill/undotree",
  event = "BufAdd",
  keys = {
    { "<leader>U", "<cmd>UndotreeToggle<cr>", desc = "Undo tree" }
  }
}
