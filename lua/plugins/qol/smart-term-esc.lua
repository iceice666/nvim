return {
  cond = 1 ~= vim.g.vscode,
  "sychen52/smart-term-esc.nvim",
  event = "BufReadPre",
  opts = {
    key = "<Esc>",
    except = { "lazygit", "nvim", "fzf" },
  },
}
