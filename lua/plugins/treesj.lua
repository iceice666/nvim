return {
  "Wansmer/treesj",
  keys = { "<space>ut" },
  event = "BufReadPost",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    local mapx = require("core.keymap").mapx
    require("treesj").setup({
      use_default_keymaps = false,
    })
    mapx.nnoremap("<leader>ut", function()
      require("treesj").toggle()
    end, "Utils: Toggle split/join")
  end,
}
