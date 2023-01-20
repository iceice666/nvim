require("alternate-toggler").setup({
  alternates = {
    ["true"] = "false",
    ["True"] = "False",
    ["TRUE"] = "FALSE",
    ["Yes"] = "No",
    ["YES"] = "NO",
    ["<"] = ">",
    ["("] = ")",
    ["["] = "]",
    ["{"] = "}",
    ['"'] = "'",
    ['""'] = "''",
    ["==="] = "!==",
    ["!="] = "==",
  },
})

local mapx = require('core.keymap').mapx
local opt = { silent = true }
-- Alternate toggler
mapx.nnoremap("<leader>ms", "<cmd>ToggleAlternate<cr>", opt)
