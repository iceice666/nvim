return {
  -- smooth scrolling
  "karb94/neoscroll.nvim",
  event = "VimEnter",
  keys = {
    {
      "J",
      function()
        if vim.g.neovide then
          vim.fn.feedkeys("10j")
        else
          require("neoscroll").scroll(10, true, 50)
        end
      end,
      mode = { "n", "x", "o" },
      desc = "Down 10 lines",
    },
    {
      "K",
      function()
        if vim.g.neovide then
          vim.fn.feedkeys("10k")
        else
          require("neoscroll").scroll(-10, true, 50)
        end
      end,
      mode = { "n", "x", "o" },
      desc = "Up 10 lines",
    },
    {
      "<C-u>",
      function()
        require("neoscroll").scroll(-vim.wo.scroll, true, 250)
      end,
    },
    {
      "<C-d>",
      function()
        require("neoscroll").scroll(vim.wo.scroll, true, 250)
      end,
    },
    {
      "<C-b>",
      function()
        require("neoscroll").scroll(-vim.api.nvim_win_get_height(0), true, 450)
      end,
    },
    {
      "<C-f>",
      function()
        require("neoscroll").scroll(vim.api.nvim_win_get_height(0), true, 450)
      end,
    },
    {
      "<C-y>",
      function()
        require("neoscroll").scroll(-0.10, false, 100)
      end,
    },
    {
      "<C-e>",
      function()
        require("neoscroll").scroll(0.10, false, 100)
      end,
    },
    {
      "zt",
      function()
        require("neoscroll").zt("250")
      end,
    },
    {
      "zz",
      function()
        require("neoscroll").zz("250")
      end,
    },
    {
      "zb",
      function()
        require("neoscroll").zb("250")
      end,
    },
  },
  opts = {
    mappings = {},
    hide_cursor = true,
    stop_eof = true,
    cursor_scrolls_alone = true,
  },
}
