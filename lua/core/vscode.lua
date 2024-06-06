if vim.g.vscode ~= 1 then return end

local vscode = require("vscode")

vim.notify = vscode.notify
vim.g.clipboard = vim.g.vscode_clipboard

vim.notify("Load vscode config!")

local action = vscode.action

-- TODO:
local km = {
  { "<leader>e", action("workbench.view.explorer") }
}

vim.g.utils.set_keymap(km)
