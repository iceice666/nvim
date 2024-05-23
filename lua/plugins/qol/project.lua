return {
  cond = false,
  "coffebar/neovim-project",
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  event = "VeryLazy",
  opts = {
    projects = { -- define project roots
      "~/project/*",
      "~/.config/nvim",
    },
    dashboard_mode = true,
  },
}
