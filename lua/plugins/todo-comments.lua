return {
  -- Todo comment
  "folke/todo-comments.nvim",
  event = "BufReadPost",
  config = function()
    require("todo-comments").setup({
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
            "!!!!!",
          },
        },
        TODO = {
          icon = " ",
          color = "todo",
          alt = { "TODO" },
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
        NOTE = {
          icon = " ",
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
        todo = { "#ccddff" },
        error = { "#DC2626" },
        warning = { "#FBBF24" },
        hint = { "#ffb9ff" },
        test = { "#FF00FF" },
      },
    })

    vim.g.mapx.nnoremap("<leader>sT", "<cmd>TodoTrouble<cr>", "Trouble: Show todos")
  end,
}
