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

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  -- Theme
  { "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme oxocarbon")
    end },
  -- Window tabs
  {
    "akinsho/bufferline.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" }
  },
  -- Status line
  "nvim-lualine/lualine.nvim",
  -- Smooth cursor
  "gen740/SmoothCursor.nvim",
  -- File explorer
  { "nvim-tree/nvim-tree.lua", },
  -- Auto close some chars like ()[]{}''""
  "m4xshen/autoclose.nvim",
  -- Switch true/false
  "rmagatti/alternate-toggler",
  -- indent line
  "lukas-reineke/indent-blankline.nvim",
  -- Lazy git
  "kdheepak/lazygit.nvim",
  -- Speed up loading
  "lewis6991/impatient.nvim",
  -- dashboard
   { "goolord/alpha-nvim", },
  ------------- Need Config -------------
  "folke/which-key.nvim",
  "folke/neodev.nvim",
  --{'neoclide/coc.nvim', {'branch': 'release'},},
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "BurntSushi/ripgrep", "sharkdp/fd", "nvim-lua/plenary.nvim" },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "folke/lsp-colors.nvim" }
  },

  -- LSP
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  },

  -- cmp resources
  {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-emoji",
    "f3fora/cmp-spell",
    "ray-x/cmp-treesitter",
  },
  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind-nvim",
  },

  -- Syntax highlight
  "nvim-treesitter/nvim-treesitter",

  -- Make inactive windows dark
  -- "sunjon/Shade.nvim",

  -- Cursor navigate
  "tpope/vim-surround",
  "mg979/vim-visual-multi",
  "gcmt/wildfire.vim",
  "easymotion/vim-easymotion",

  -- Undo history
  "mbbill/undotree",
  -- Format & lint
  "jose-elias-alvarez/null-ls.nvim",
  ------------- Wont Config -------------

  { "ckipp01/stylua-nvim", config = true },

  "b0o/SchemaStore.nvim",
})

local root = vim.fn.stdpath("config") .. "/lua/"

vim.opt.runtimepath:prepend(root .. "plugins")
local split = require("utilities").split
local isInclude = require("utilities").isInclude
local blacklist = { "coc" }

-- load plugins
local function loadPlugins(pluginsPath)
  pluginsPath = pluginsPath or "plugins/"
  local plugins = vim.fn.systemlist("ls " .. root .. pluginsPath)
  for _, k in ipairs(plugins) do
    local _p = split(k, ".")

    if isInclude(_p[1], blacklist) then
    elseif #_p == 1 then
      loadPlugins(pluginsPath .. _p[1] .. "/")
    elseif _p[#_p] == "lua" then
      require(pluginsPath .. _p[1])
    end
  end
end

loadPlugins()
