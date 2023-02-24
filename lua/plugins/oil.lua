return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  keys = "<leader>E",
  config = function()
    require("oil").setup()
    require("core.keymap").mapx.nnoremap(
      "<leader>E",
      "<cmd>Oil --float . <cr>",
      "Oil: Normal-buffer-like file explorer",
      { silent = true }
    )
  end,
}
