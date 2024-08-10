return {
  cond = 1 ~= vim.g.vscode,
  "Wansmer/treesj",
  event = "BufReadPost",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    use_default_keymaps = false,
  },
  keys = {
    {
      "<leader>us",
      function()
        require("treesj").toggle()
      end,
      desc = "Toggle split/join",
    },
  },
}
