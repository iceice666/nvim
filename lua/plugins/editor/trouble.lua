return {
  -- Trouble / show diagnostics
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Trouble",
  opts = {
  },

  keys = {
    {
      "<leader>sx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Trouble: Diagnostics",
    },
    {
      "<leader>sb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Trouble: Buffer Diagnostics",
    },
    {
      "<leader>sl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Trouble: Location List",
    },
    {
      "<leader>sq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Trouble: Quickfix List",
    },
  },
}
