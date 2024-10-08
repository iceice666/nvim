return {
  -- Todo comment
  "folke/todo-comments.nvim",
  cond = 1 ~= vim.g.vscode,
  event = "BufReadPost",
  opts = {
    keywords = {
      IMPORTANT = {
        icon = "󰀨 ",
        color = "error",
        alt = {
          "NEED_FIX",
          "FIXME",
          "BUG",
          "FIXIT",
          "ISSUE",
          "IMPORTANT",
          "!!!",
        },
      },
      TODO = {
        icon = " ",
        color = "todo",
        alt = { "TODO" },
      },
      HACK = {
        icon = [[🤔]],
        color = "warning",
        alt = { "HACK", "HACKY" },
      },
      WARN = {
        icon = " ",
        color = "warning",
        alt = { "WARNING", "WARN" },
      },
      NOTE = {
        icon = " ",
        color = "hint",
        alt = { "INFO", "NOTE", "HINT" },
      },
      TEST = {
        icon = "⏲ ",
        color = "test",
        alt = { "TESTING", "PASSED", "FAILED" },
      },
    },
    colors = {
      todo = { "#ccddff" },
      error = { "#DC2626" },
      warning = { "#FBBF24" },
      hint = { "#ffb9ff" },
      test = { "#FF00FF" },
    },
  },
  keys = {
    {
      "<leader>st",
      "<cmd>TodoTrouble keywords=TODO,FIXME<cr>",
      desc = "Trouble: Show todos",
    },
  },
}
