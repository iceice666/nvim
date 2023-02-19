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

local req = function(plugin_name)
  require("plugins." .. plugin_name)
end


require("lazy").setup({

  
 
   -- Undo history
  "mbbill/undotree",
  -- which key
  "folke/which-key.nvim",
  -- neodev
  "folke/neodev.nvim",
  -- scroll stop at end
  "Aasim-A/scrollEOF.nvim",
  -- line peek
  "nacro90/numb.nvim",
  -- git sign
  'lewis6991/gitsigns.nvim',
  -- hlsearch lens
    "kevinhwang91/nvim-hlslens",

  -- libs
 "b0o/mapx.nvim",

  "ckipp01/stylua-nvim",
  "TravonteD/luajob",


 
    -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 
  -- [ Other langauges support]
  { -- golang
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua'
    }
  },
  {import = "plugins"},
    {import = "plugins.lsp"},
    {import = "plugins.dap"}

    })
