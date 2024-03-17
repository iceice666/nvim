return {
  "folke/flash.nvim",
  event = "BufReadPost",
  opts = {
    modes = {
      search = {
        enabled = false,
      },
    },
  },
  -- stylua: ignore start
  keys = {
    { "\\", mode = { "n", "x", "o" }, function() require("flash").jump() end,             desc = "Flash" },
    { "|", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,       desc = "Flash Treesitter" },
    { "r", mode = "o",              function() require("flash").remote() end,            desc = "Remote Flash" },
    { "R", mode = { "o", "x" },     function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  },
  -- stylua: ignore end
}
