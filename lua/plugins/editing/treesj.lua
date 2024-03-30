return {
  "Wansmer/treesj",
  event = "BufReadPost",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    use_default_keymaps = false,
  },
  keys = {
    {
      "<leader>sj",
      function()
        require("treesj").toggle()
      end,
      desc = "Utils: Toggle split/join",
    },
  },
}
