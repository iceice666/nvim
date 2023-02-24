return {
  -- smooth scrolling
  "karb94/neoscroll.nvim",
  dependencies = {
    "Aasim-A/scrollEOF.nvim",
  },
  keys = {
    "j",
    "k",
    "J",
    "K",
  },
  config = function()
    local neoscroll = require("neoscroll")
    neoscroll.setup({
      mappings = { "j", "k" },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
    })

    local scroll = neoscroll.scroll
    local mapx = require("core.keymap").mapx
    mapx.group({ silent = true }, function()
      mapx.nnoremap("J", function()
        scroll(0.25, true, 150)
      end)

      mapx.nnoremap("K", function()
        scroll(-0.25, true, 150)
      end)
    end)
  end,
}
