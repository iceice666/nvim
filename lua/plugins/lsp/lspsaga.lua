return {
  "nvimdev/lspsaga.nvim",
  event = "BufReadPre",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lspsaga").setup({
      symbols_in_winbar = { enable = true },
      implement = { enable = true },
      lightbulb = { virtual_text = false },
      ui = {
        kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
      },
    })
  end,
}
