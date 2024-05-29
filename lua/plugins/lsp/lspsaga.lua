return {
  "nvimdev/lspsaga.nvim",
  event = "BufReadPre",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    symbols_in_winbar = { enable = true },
    implement = { enable = true },
    lightbulb = { virtual_text = false },
    ui = {
      kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    },
  },
  keys = {
    { "[d", "<CMD>Lspsaga diagnostic_jump_prev<CR>", desc = "Next diagnostic" },
    { "]d", "<CMD>Lspsaga diagnostic_jump_next<CR>", desc = "Prev diagnostic" }
  }
}
