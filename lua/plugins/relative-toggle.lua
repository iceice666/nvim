return {
  "cpea2506/relative-toggle.nvim",
  event = "BufReadPost",
  config = function()
    require("relative-toggle").setup({
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
    })
  end,
}
