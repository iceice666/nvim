local db = require("plugins.dashboardThemes.getTheme")


require("dashboard").setup(db)


require('notify')("Plz check message if something go wrong!", "warn", {
  title = "Startup",
  timeout = 5000
})
