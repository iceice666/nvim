return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = "typescript",
  },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    ft = "dart",
    config = function()
      require("plugins.lsp.server.flutter")
    end,
  },
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
    config = function()
      require("clangd_extensions").setup()
    end,
  },
  {
    -- eww yuck support
    "elkowar/yuck.vim",
    ft = { "yuck" },
  },
  {
    "mrcjkb/rustaceanvim",
    dependencies = {
      "lvimuser/lsp-inlayhints.nvim",
    },
    version = "^3", -- Recommended
    ft = { "rust" },
  },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },
  {
    -- neodev/ nvim lua setting help
    "folke/neodev.nvim",
    ft = "lua",
    config = true,
  },
}
