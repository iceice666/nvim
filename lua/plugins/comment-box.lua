local mapx = require("core.keymap").mapx

mapx.group({ silent = true }, function()
  mapx.vnoremap("<leader>bc", "<cmd>CBccbox<cr>")
end)
