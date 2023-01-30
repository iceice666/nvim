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

  { -- Theme
    "iceice666/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme vscode")
    end
  },
  { -- auto saver
    "tmillr/sos.nvim",
    config = function()
      require("sos").setup({
        timeout = 30000,
        autowrite = true,
        save_on_cmd = "some",
        save_on_bufleave = true,
        save_on_focuslost = true,
      })
    end
  },
  { -- statuscolumn
    -- TODO: Need config
    "luukvbaal/statuscol.nvim",
    config = function()
      require("plugins.statuscol")
    end
  },
  { -- Markdown preview
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.cmd('source ' .. vim.fn.stdpath('config') .. "/lua/plugins/mdpreview.vim")
    end
  },
  { -- Notification
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    },
    config = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          require("plugins.noice")
        end,
      })
    end,
  },
  { -- Sessions
    cond = true,
    "rmagatti/auto-session",
    config = function()
      require("plugins.auto-session")
    end
  },
  { -- Toggle comment
    "folke/todo-comments.nvim",
    config = function()
      require('plugins.comment')
    end
  },
  { -- Color comment
    'numToStr/Comment.nvim',
    config = function()
      require("plugins.todo-comments")
    end
  },
  { -- Comment box
    "LudoPinelli/comment-box.nvim",
    config = function()
      require("plugins.comment-box")
    end
  },
  { -- Workspaces
    "natecraddock/workspaces.nvim",
    config = function()
      require("plugins.workspaces")
    end
  },
  { -- Cursor motion
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat"
    },
    config = function()
      require("plugins.motion")
    end
  },
  { -- Window tabs
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("plugins.bufferline")
    end
  },
  { -- Color preview / pick
    "uga-rosa/ccc.nvim",
    config = function()
      require("plugins.ccc")
    end
  },
  { -- scroll related
    "petertriho/nvim-scrollbar",
    config = function()
      require("plugins.scroll")
    end
  },
  { -- hlsearch lens
    "kevinhwang91/nvim-hlslens",
    config = function()
      require('hlslens').setup()
    end
  },
  { -- toggle term
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugins.toggleterm")
    end
  },
  { -- Status line
    "glepnir/galaxyline.nvim",
    config = function()
      require("plugins.galaxyline")
    end
  },
  { -- File explorer
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
  { -- Switch true/false
    "rmagatti/alternate-toggler",
    config = function()
      require("plugins.alternate-toggler")
    end
  },
  { -- indent line
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent-blankline")
    end
  },
  { -- Git signs
    'lewis6991/gitsigns.nvim',
    config = function()
      require("gitsigns").setup({})
    end
  },
  { -- Trouble / show diagnostics
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.trouble")
    end
  },
  { -- line peek
    "nacro90/numb.nvim",
    config = true
  },
  -- NEED: implementation needed
  { -- Image display
    'edluffy/hologram.nvim',
    cond = false
  },
  { -- dashboard
    cond = true,
    "glepnir/dashboard-nvim",
    config = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          require("plugins.dashboard")
        end,
      })
    end,
  },
  -- Undo history
  "mbbill/undotree",
  -- which key
  "folke/which-key.nvim",
  -- neodev
  "folke/neodev.nvim",
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- Treesitter / Syntax
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.lsp.treesitter")
    end
  },
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- [ Telescope ]
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.telescope")
    end,
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- [ LSP / Language Server Protocol ]
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp.mason")
      require("plugins.lsp.lspsaga")
      require("plugins.lsp.lsp")
    end,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "glepnir/lspsaga.nvim",
    },
  },
  -- [ Other langauges support]
  { -- golang
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua'
    }
  },
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- [ CMP / Completion engine ]
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.lsp.cmp")
    end,
    event = "BufEnter",
    dependencies = {
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
    }
  },
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- [ DAP / Debug Adapter Protocol ]
  { -- core
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.lsp.dap")
    end,
    dependencies = {
      -- ui
      "rcarriga/nvim-dap-ui",
      "RubixDev/mason-update-all",
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
    }
  },
  { -- test adapter
    -- NEED: More research and config
    -- See https://github.com/nvim-neotest/neotest for helps
    "nvim-neotest/neotest",
    config = function()
      require("plugins.lsp.neotest")
    end,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
  },
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  { -- Format & lint
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.lsp.null-ls")
    end
  },
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- ╭──────────────────────────────────────────────────────────╮
  -- │                           Libs                           │
  -- ╰──────────────────────────────────────────────────────────╯
  "b0o/mapx.nvim",
  "ckipp01/stylua-nvim"
})
