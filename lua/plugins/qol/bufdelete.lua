return {
  enabled = false,
  cond = 1 ~= vim.g.vscode,
  "famiu/bufdelete.nvim",
  event = "BufReadPre",
}
