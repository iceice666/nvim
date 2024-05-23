-- require neovim 0.10 or above
return {
  "garymjr/nvim-snippets",
  dependencies = { "rafamadriz/friendly-snippets" },
  event = "InsertEnter",
  opts = {
    friendly_snippets = true
  }
}
