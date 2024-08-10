return {
  {
    cond = 1 ~= vim.g.vscode,
    "roobert/surround-ui.nvim",
    event        = "BufReadPost",
    dependencies = {
      "kylechui/nvim-surround",
      "folke/which-key.nvim",
    },
    opts         = {
      root_key = "S"
    },
  },
  {
    "kylechui/nvim-surround",
    event  = "BufReadPost",
    config = true
  },
}

