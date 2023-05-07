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

  -- which key
  "folke/which-key.nvim",

  -- libs
  {
    "b0o/mapx.nvim",
    lazy = false,
    priority = 9999,
    config = function()
      local mapx = require("mapx").setup({ whichkey = true })
      vim.g.mapx = mapx
    end,
  },
  {
    "TravonteD/luajob",
    lazy = true,
  },
  -- [ Other plugins]

  { import = "plugins" },
  { import = "plugins.lsp" },
  { import = "plugins.dap" },
})
