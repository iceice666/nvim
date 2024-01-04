return {
  "mrjones2014/legendary.nvim",
  -- since legendary.nvim handles all your keymaps/commands,
  -- its recommended to load legendary.nvim before other plugins
  priority = 10000,
  lazy = false,
  dependencies = { "kkharji/sqlite.lua" },
  opts = {
    extensions = {
      lazy_nvim = { auto_register = true },
      nvim_tree = true,
    },

    autocmds = require("core.autocmd"),
  },
}
