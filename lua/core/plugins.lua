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
  { -- Undo history
    "mbbill/undotree",
    event = "BufAdd",
  },
  -- which key
  "folke/which-key.nvim",
  { -- git sign
    'lewis6991/gitsigns.nvim',
    event = "BufReadPre"
  },
  { -- hlsearch lens
    "kevinhwang91/nvim-hlslens",
    keys = "/",
    config = function()
      require("hlslens").setup()
    end
  },
  -- libs
  "b0o/mapx.nvim",
  {
    "TravonteD/luajob",
    lazy = true
  },
  -- [ Other langauges support]

  { import = "plugins" },
  { import = "plugins.lsp" },
  { import = "plugins.dap" }

})
