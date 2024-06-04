if vim.g.vscode ~= 1 then return end

vim.notify = require("vscode").notify
vim.g.clipboard = vim.g.vscode_clipboard

vim.notify("Load vscode config!")


local km = require("core.keymap")

for _, binding in ipairs(km) do
  local lhs = binding[1]
  local rhs = binding[2]
  local mode = binding.mode or "n"

  if type(mode) == "table" then
    for _, m in ipairs(mode) do
      vim.keymap.set(m, lhs, rhs, { noremap = true, silent = true })
    end
  else
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
  end
end
