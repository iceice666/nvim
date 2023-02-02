local db = require("plugins.dashboardThemes.getTheme")


require("dashboard").setup(db)


vim.api.nvim_create_autocmd("VimLeavePre", {
  pattern = "",
  callback = function()
    vim.cmd("NeoTreeClose")
  end,
})
