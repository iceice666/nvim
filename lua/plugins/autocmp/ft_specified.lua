return {
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
