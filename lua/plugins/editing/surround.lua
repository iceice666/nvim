return {
  "roobert/surround-ui.nvim",
  event        = "BufReadPost",
  dependencies = {
    {
      "kylechui/nvim-surround",
      config = true
    },
    "folke/which-key.nvim",
  },
  opts         = {
    root_key = "S"
  }
}
