require("toggleterm").setup({
  direction = "float",
  hide_numbers = true,
  autochdir = true,
  shade_terminals = true,
  start_in_insert = true
})

local mapx = require("core.keymap").mapx
-- terminal mapping
mapx.nnoremap("<a-t>", "<cmd>ToggleTerm<cr>")
mapx.tnoremap("<a-t>", "<c-\\><c-n><cmd>ToggleTerm<cr>")
mapx.tnoremap("<esc>", "<c-\\><c-n>")
