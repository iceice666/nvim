if vim.g.vscode ~= 1 then return end

vim.notify = require("vscode").notify
vim.g.clipboard = vim.g.vscode_clipboard

vim.notify("Load vscode config!")
