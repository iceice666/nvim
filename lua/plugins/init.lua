local enable = {
  require("plugins.theme.init"),                                -- theme
  require("plugins.dashboard.init"),                            -- Welcome screen
  { import = "plugins.ui",       enabled = 1 ~= vim.g.vscode }, -- Modify Neovim built-in UI
  { import = "plugins.qol" },                                   -- Some improvement
  { import = "plugins.movement" },                              -- Cusor move/jump
  { import = "plugins.editing" },                               -- Editing utilities
  { import = "plugins.editor",   enabled = 1 ~= vim.g.vscode }, -- Add new features which usually interact with a custom window
  { import = "plugins.lsp",      enabled = 1 ~= vim.g.vscode }, -- Language Server Protocol
  { import = "plugins.cmp",      enabled = 1 ~= vim.g.vscode }, -- Auto-completion
  { import = "plugins.heirline", enabled = 1 ~= vim.g.vscode }, -- statusline
  { import = "plugins.hydra",    enabled = 1 ~= vim.g.vscode }, -- Custom submodes and menus (like Emacs hydra)
  { import = "plugins.mini",     enabled = 1 ~= vim.g.vscode }, -- mini
  { import = "plugins.fun",      enabled = 1 ~= vim.g.vscode }, -- Just for fun
}

-- Deprecated
-- { import = "plugins.dap",      enabled = 1 ~= vim.g.vscode }, -- Debug Adapter Protocol



return enable
