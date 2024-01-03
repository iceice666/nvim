return {
  {
    -- line peek
    "nacro90/numb.nvim",
    event = "CmdlineEnter",
  },

  {
    -- git sign
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
    event = "BufReadPre",
  },
}
