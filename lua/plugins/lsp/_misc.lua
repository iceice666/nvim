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
    -- rust
    "simrat39/rust-tools.nvim",
    ft = {
      "rust",
    },
  },
  {
    "Saecki/crates.nvim",
    config = function()
      -- https://github.com/Saecki/crates.nvim#show-appropriate-documentation-in-cargotoml
      require("crates").setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      })
    end,
    ft = {
      "rust",
      "rs",
    },
  },
}
