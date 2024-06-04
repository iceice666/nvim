return {
  "cpea2506/relative-toggle.nvim",
  event = "BufReadPost",
  cond = 1 ~= vim.g.vscode,
  opts = {
    pattern = "*",
    events = {
      off = {
        "BufEnter",
        "FocusGained",
        "InsertLeave",
        "WinEnter",
        "CmdlineLeave",
      },
      on = {
        "BufLeave",
        "FocusLost",
        "InsertEnter",
        "WinLeave",
        "CmdlineEnter",
      },
    },
  },
}