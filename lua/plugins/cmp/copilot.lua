return {
  {
    enabled = false,
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
    enabled = false,
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
    enabled = false,
    "zbirenbaum/copilot-cmp",
    event = {
      "InsertEnter",
      "CmdlineEnter",
    },
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = {},
  },
}
