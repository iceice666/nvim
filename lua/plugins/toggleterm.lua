return {
  -- toggle term
  "akinsho/toggleterm.nvim",
  opts = {
    direction = "float",
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
  },
  keys = {
    {
      "<m-t>",
      "<cmd>ToggleTerm<cr>",
      desc = "Term: Open terminal",
      mode = { "n" },
    },
    {
      "<m-t>",
      "<c-\\><c-n><cmd>ToggleTerm<cr>",
      desc = "Term: Close terminal",
      mode = { "t" },
    },
  },
}
