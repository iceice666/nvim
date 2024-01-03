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
  config = function()
    require("neoscroll").setup({
      mappings = {},
      hide_cursor = true,
      stop_eof = true,
      cursor_scrolls_alone = true,
    })
  end,
}
