return {
  -- dashboard
  pin = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "rcarriga/nvim-notify",
    "mrquantumcodes/configpulse",
  },
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  config = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local db = require("plugins.dashboard.getTheme")


        require("dashboard").setup(db)

        vim.notify("Plz check message if something went wrong!", "warn", {
          title = "Startup",
          timeout = 5000,
        })

        local time = require("configpulse").get_time()

        if time.days < 1 then
          return
        end

        local msg = "You haven't touched your config for\n"
            .. time.days
            .. " days, "
            .. time.hours
            .. " hours, "
            .. time.minutes
            .. " minutes.🤓👆"

        vim.notify(msg, "info", {
          title = "Your config file is missing you!",
          timeout = 10000,
        })
      end,
    })
  end,
}
