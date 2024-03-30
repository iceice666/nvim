local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
return {

  -- Toggle comment
  "numToStr/Comment.nvim",
  event = "BufReadPost",
  opts = {
    padding = true,
    sticky = true,
    ignore = nil,
    mappings = {
      basic = false,
      extra = false,
    },
  },
  keys = {

    {
      "<C-\\>",
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      desc = "Comment: line comment",
    },
    {
      "<M-\\>",
      function()
        require("Comment.api").toggle.blockwise.current()
      end,
      desc = "Comment: block comment",
    },
    {
      "<C-\\>",
      function()
        vim.api.nvim_feedkeys(esc, "nx", false)
        require("Comment.api").toggle.linewise(vim.fn.visualmode())
      end,
      "Comment: line comment",
      mode = "v",
    },

    {
      "<M-\\>",
      function()
        vim.api.nvim_feedkeys(esc, "nx", false)
        require("Comment.api").toggle.blockwise(vim.fn.visualmode())
      end,
      "Comment: block comment",
      mode = "v",
    },
  },
}
