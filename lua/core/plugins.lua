local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  require("plugins.lib"), -- Libs
  require("plugins.theme.init"), -- theme
  require("plugins.dashboard.init"), -- Welcome screen
  { import = "plugins.ui" }, -- Modify Neovim built-in UI
  { import = "plugins.qol" }, -- Some improvement
  { import = "plugins.movement" }, -- Cusor move/jump
  { import = "plugins.editing" }, -- Editing utilities
  { import = "plugins.editor" }, -- Add new features which usually interact with a custom window
  { import = "plugins.statusline" }, -- statusline
  { import = "plugins.lsp" }, -- Language Server Protocol
  { import = "plugins.cmp" }, -- Auto-completion
  { import = "plugins.hydra" }, -- Custom submodes and menus (like Emacs hydra)
  { import = "plugins.dap" }, -- Debug Adapter Protocol
})
