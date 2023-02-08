require("focus").setup({ excluded_filetypes = { "toggleterm" } })

local mapx = require("core.keymap").mapx

mapx.group({ silent = true }, function()
  mapx.nnoremap("Wl", "<cmd>FocusSplitRight<CR>")
  mapx.nnoremap("Wh", "<cmd>FocusSplitLeft<CR>")
  mapx.nnoremap("Wk", "<cmd>FocusSplitUp<CR>")
  mapx.nnoremap("Wj", "<cmd>FocusSplitDown<CR>")
end)
