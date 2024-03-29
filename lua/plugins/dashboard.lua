return {
  -- dashboard
  pin = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "rcarriga/nvim-notify",
  },
  "glepnir/dashboard-nvim",
  config = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local db = require("plugins.dashboard.getTheme")

        require("dashboard").setup(db)

        require("notify")(
          "Plz check message if something went wrong!",
          "warn",
          {
            title = "Startup",
            timeout = 5000,
          }
        )
      end,
    })
  end,
}
