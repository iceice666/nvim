local mapx = require("core.keymap").mapx

mapx.nnoremap("<F2>", "<cmd>lua print(vim.bo.filetype)<cr>", "Print filetype")
mapx.vnoremap("<F3>", "<cmd>lua print(vim.fn.mode())<cr>", "Print current mode")
mapx.inoremap("<F3>", "<cmd>lua print(vim.fn.mode())<cr>", "Print current mode")
mapx.tnoremap("<F3>", "<cmd>lua print(vim.fn.mode())<cr>", "Print current mode")
mapx.snoremap("<F3>", "<cmd>lua print(vim.fn.mode())<cr>", "Print current mode")

mapx.vnoremap("<F4>", "<cmd>lua print(vim.fn.mode() == '^V')<cr>", "Print current mode")
