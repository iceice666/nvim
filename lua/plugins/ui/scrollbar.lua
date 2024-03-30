return {
  "kevinhwang91/nvim-hlslens",
  dependencies = {
    "petertriho/nvim-scrollbar",
  },
  event = "BufReadPost",
  config = function()
    -- require('hlslens').setup() is not required
    require("scrollbar.handlers.search").setup({
      -- hlslens config overrides
    })
  end,
}
