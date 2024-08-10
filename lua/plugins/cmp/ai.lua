return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "jonahgoldwastaken/copilot-status.nvim",
    dependencies = { "zbirenbaum/copilot.lua" },
    lazy = true,
    event = "BufReadPost",
    opts = {
      icons = {
        idle = "󰍶 ",
        error = " ",
        offline = " ",
        warning = "󰀨 ",
        loading = "󱍷 ",
      },
      debug = false,
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    opts = {},
  },
}
