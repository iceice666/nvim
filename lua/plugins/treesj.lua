return {
  "Wansmer/treesj",
  keys = { "<space>Tm" },
  event = "BufReadPost",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    local mapx = require("core.keymap").mapx
    require("treesj").setup({
      use_default_keymaps = false,
    })
    mapx.nnoremap("<leader>Tm", function()
      require("treesj").toggle()
    end)
  end,
}
