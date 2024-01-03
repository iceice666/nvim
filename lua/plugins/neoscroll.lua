return {
  -- smooth scrolling
  "karb94/neoscroll.nvim",
  keys = {
    {
      "J",
      function()
        require("neoscroll").scroll(10, true, 50)
      end,
      mode = { "n", "x", "o" }
    },

    {
      "K",
      function()
        require("neoscroll").scroll(-10, true, 50)
      end,
      mode = { "n", "x", "o" }
    }
  },
  opts = {
    mappings = {},
    hide_cursor = true,
    stop_eof = true,
    cursor_scrolls_alone = true,
  },
}
