require("trouble").setup({
  use_diagnostic_signs = true
})

local mapx = require("core.keymap").mapx
mapx.group({ silent = true }, function()
  mapx.nnoremap("<leader>sd", "<cmd>TroubleToggle document_diagnostics<cr>",
    "Trouble: Show diagnostics of current file")
  mapx.nnoremap("<leader>sD", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    "Trouble: Show diagnostics of current workspace")
end
)
