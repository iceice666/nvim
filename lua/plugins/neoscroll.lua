return {
  -- smooth scrolling
  "karb94/neoscroll.nvim",
  config = function()
    local neoscroll = require('neoscroll')
    neoscroll.setup()
    local scroll = neoscroll.scroll
    local mapx = require("core.keymap").mapx
    mapx.group({ silent = true }, function()
      mapx.nnoremap("j", function()
        scroll(1, true, 10)
      end)
      mapx.nnoremap("k", function()
        scroll( -1, true, 10)
      end)
      mapx.nnoremap("J", function()
        scroll(0.25, true, 150)
      end)
      mapx.nnoremap("K", function()
        scroll( -0.25, true, 150)
      end)
    end)
  end
}
