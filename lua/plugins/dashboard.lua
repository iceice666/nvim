return {
  -- dashboard
  pin = true,
  "glepnir/dashboard-nvim",
  config = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local db = require("plugins.dashboardThemes.getTheme")

        require("dashboard").setup(db)

        require('notify')("Plz check message if something go wrong!", "warn", {
          title = "Startup",
          timeout = 5000
        })
      end,
    })
  end,
}
