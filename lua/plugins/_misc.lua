return {
  {
    -- line peek
    "nacro90/numb.nvim",
    event = "CmdlineEnter",
    config = true,
  },

  {
    -- git sign
    "lewis6991/gitsigns.nvim",
    config = true,
    event = "BufReadPre",
  },
}
