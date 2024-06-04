return {
  cond = 1 ~= vim.g.vscode,
  -- git sign
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    current_line_blame = true,
    current_line_blame_formatter = "<author>, <author_time:%Y/%m/%d>: <summary>",
  },
}