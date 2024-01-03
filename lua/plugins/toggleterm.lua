return {
  -- toggle term
  "akinsho/toggleterm.nvim",
  -- keys = {
  --   "<a-t>",
  -- },
  -- cmd = {
  --   "TermExec",
  --   "ToggleTerm",
  -- },
  opts = {
    direction = "float",
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
  },
  keys = {
    {
      "<a-t>",
      "<cmd>ToggleTerm<cr>",
      desc = "Term: Open terminal",
      mode = { "n" },
    },
    {
      "<a-t>",
      "<c-\\><c-n><cmd>ToggleTerm<cr>",
      desc = "Term: Close terminal",
      mode = { "t" },
    },
  },
}
