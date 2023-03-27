return {
  -- Todo comment
  "folke/todo-comments.nvim",
  event = "BufReadPost",
  config = function()
    require("todo-comments").setup({
      keywords = {
        FIX = {
          icon = " ",
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = {
          icon = " ",
          color = "hint",
          alt = { "TODO", "NEED" },
        },
        HACK = {
          icon = " ",
          color = "warning",
          alt = { "HACK", "HACKY" },
        },
        WARN = {
          icon = " ",
          color = "warning",
          alt = { "WARNING", "WARN" },
        },
        PERF = {
          icon = " ",
          alt = { "PERFORMANCE", "OPTIMIZE" },
        },
        NOTE = {
          icon = " ",
          color = "hint",
          alt = { "INFO", "NOTE" },
        },
        TEST = {
          icon = "⏲ ",
          color = "test",
          alt = { "TESTING", "PASSED", "FAILED" },
        },
      },
      colors = {
        error = { "#DC2626" },
        warning = { "#FBBF24" },
        info = { "#2563EB" },
        hint = { "#10B981" },
        default = { "#7C3AED" },
        test = { "#FF00FF" },
      },
    })

    vim.g.mapx.nnoremap(
      "<leader>sT",
      "<cmd>TodoTrouble<cr>",
      "Trouble: Show todos"
    )
  end,
}
