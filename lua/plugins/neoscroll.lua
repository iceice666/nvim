return {
  -- smooth scrolling
  "karb94/neoscroll.nvim",
  event = "VimEnter",
  keys = {
    {
      "J",
      function()
        require("neoscroll").scroll(10, true, 50)
      end,
      mode = { "n", "x", "o" },
      desc = "Down 10 lines",
    },
    {
      "K",
      function()
        require("neoscroll").scroll(-10, true, 50)
      end,
      mode = { "n", "x", "o" },
      desc = "Up 10 lines",
    },
  },
  opts = {
    mappings = {},
    hide_cursor = true,
    stop_eof = true,
    cursor_scrolls_alone = true,
  },
}
