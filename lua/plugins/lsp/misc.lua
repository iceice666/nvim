return {
  {
    -- rust
    "simrat39/rust-tools.nvim",
    config = function() end,
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
  {
    "baskerville/vim-sxhkdrc",
    ft = { "sxhkdrc" },
  },
}
