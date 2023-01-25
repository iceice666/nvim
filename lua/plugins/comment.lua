require("Comment").setup({
  padding = true,
  sticky = true,
  ignore = nil,
  mappings = {
    basic = false,
    extra = false,
  },
})


local mapx = require("core.keymap").mapx
local api = require('Comment.api')
local esc = vim.api.nvim_replace_termcodes(
  '<ESC>', true, false, true
)
mapx.group({ silent = true }, function()
  mapx.nnoremap("<C-/>", api.toggle.linewise.current)
  mapx.nnoremap("<A-/>", api.toggle.blockwise.current)
  mapx.vnoremap('<C-/>', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
  end)

  mapx.vnoremap('<A-/>', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.blockwise(vim.fn.visualmode())
  end)
end)
