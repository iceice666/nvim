require("toggleterm").setup({
  direction = "float",
  hide_numbers = true,
  autochdir = true,
  shade_terminals = true,
  start_in_insert = true
})

local mapx = require("core.keymap").mapx
-- terminal mapping
mapx.nnoremap("<a-t>", function()
  if vim.fn.filereadable(vim.fn.expand(vim.fn.getcwd() .. "/venv/bin/activate")) == true then
    pcall(vim.cmd, "TermExec cmd='source venv/bin/activate;clear'")
  else
    vim.cmd("ToggleTerm")
  end
end)
mapx.tnoremap("<a-t>", "<c-\\><c-n><cmd>ToggleTerm<cr>")
mapx.tnoremap("<esc>", "<c-\\><c-n>")
