return {
  {
    -- line peek
    "nacro90/numb.nvim",
    event = "CmdlineEnter",
  },
  {
    -- eww yuck support
    "elkowar/yuck.vim",
    ft = { "yuck" },
  },
  {
    -- git sign
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
    event = "BufReadPre",
  },
  {
    -- hlsearch lens
    "kevinhwang91/nvim-hlslens",
    keys = "/",
    config = function()
      require("hlslens").setup()
    end,
  },
}
