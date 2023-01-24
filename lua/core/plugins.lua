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
  -- Theme
  {
    "iceice666/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme vscode")
    end
  },
  -- Sessions
  {
    "rmagatti/auto-session",
  },
  -- Comment
  {
    'numToStr/Comment.nvim',
    config = function()
      require('plugins.comment')
    end
  },
  -- Cursor navigate
  {
    --"tpope/vim-surround",
    --"mg979/vim-visual-multi",
    --"gcmt/wildfire.vim",
    --"easymotion/vim-easymotion",
  },
  -- Undo history
  {
    "mbbill/undotree",
  },
  -- Window tabs
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.bufferline")
    end
  },
  -- Color preview / pick
  -- Need config
  {
    "uga-rosa/ccc.nvim",
    config = function()
      require("plugins.ccc")
    end
  },
  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("plugins.scrollbar")
    end
  },
  -- hlslens
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("plugins.nvim-hlslens")
    end
  },
  -- toogle term
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugins.toggleterm")
    end
  },
  -- keymap
  {
    "b0o/mapx.nvim",
  },
  -- Dim inactive portions code
  -- Need config
  {
    "folke/twilight.nvim",
    config = function()
      require("plugins.twilight")
    end
  },
  -- Status line
  {
    "glepnir/galaxyline.nvim",
    config = function()
      require("plugins.galaxyline")
    end,
    dependencies = {
      "konapun/vacuumline.nvim"
    }
  },

  --Smooth cursor
  {
    "gen740/SmoothCursor.nvim",
    config = function()
      require("plugins.cursor")
    end
  },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons"
    },
    branch = "v2.x",
    config = function()
      require("plugins.neotree")
    end
  },
  -- Switch true/false
  {
    "rmagatti/alternate-toggler",
    config = function()
      require("plugins.alternate-toggler")
    end
  },
  -- indent line
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent-blankline")
    end
  },
  -- Git signs
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  -- dashboard
  {
    "glepnir/dashboard-nvim",
    config = function()
      require("dashboard").disable_at_vimenter = true
    end
  },
  -- which key
  {
    "folke/which-key.nvim"
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.telescope")
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-file-browser.nvim"
  },
  -- Syntax highlight / parser
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.lsp.treesitter")
    end
  },
  -- LSP
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "glepnir/lspsaga.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp.lsp")
    end,
  },

  -- cmp
  {
    -- sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-emoji",
    "f3fora/cmp-spell",
    "rcarriga/cmp-dap",
    "saadparwaiz1/cmp_luasnip",
    "ray-x/cmp-treesitter",
    "windwp/nvim-autopairs",

    -- Snippets
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind-nvim",
    event = "BufEnter"
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.lsp.cmp")
    end,
    event = "BufEnter"
  },
  -- DAP
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.lsp.dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    "RubixDev/mason-update-all",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
    --"mfussenegger/nvim-dap-python",
    --"nvim-telescope/telescope-dap.nvim"
  },
  -- Format & lint
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.lsp.null-ls")
    end
  },
  ------------- Wont Config -------------

  {
    "ckipp01/stylua-nvim",
    config = true
  },

  {
    "b0o/SchemaStore.nvim"
  },
})



vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    require("plugins.dashboard")
  end,
})
