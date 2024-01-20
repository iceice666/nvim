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
      "<c-`>",
      "<cmd>ToggleTerm dir=\"" .. vim.fn.getcwd() .. "\"<CR>",
      desc = "Term: Open terminal",
      mode = { "n" },
    },
    {
      "<c-`>",
      "<c-\\><c-n><cmd>ToggleTerm<cr>",
      desc = "Term: Close terminal",
      mode = { "t" },
    },
    {
      "<m-c>",
      "; cd " .. vim.fn.getcwd() .. "<CR>",
      desc = "Go to current working dir",
      mode = { "t" },
    },
  },
}
