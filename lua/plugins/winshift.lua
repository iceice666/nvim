return {
  -- windows shifting
  "sindrets/winshift.nvim",
  event = "BufAdd",
  opts = {
    keymaps = {
      disable_defaults = true,
    },
  },

  keys = {
    { "<c-l>", "<cmd>WinShift right<cr>" },
    { "<c-h>", "<cmd>WinShift left<cr>" },
    { "<c-j>", "<cmd>WinShift down<cr>" },
    { "<c-k>", "<cmd>WinShift up<cr> " },
  },
}
