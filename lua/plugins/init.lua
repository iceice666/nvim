return {
  require("plugins.theme.init"),     -- theme
  require("plugins.dashboard.init"), -- Welcome screen
  { import = "plugins.ui" },         -- Modify Neovim built-in UI
  { import = "plugins.qol" },        -- Some improvement
  { import = "plugins.movement" },   -- Cusor move/jump
  { import = "plugins.editing" },    -- Editing utilities
  { import = "plugins.editor" },     -- Add new features which usually interact with a custom window
  { import = "plugins.heirline" },   -- statusline
  { import = "plugins.lsp" },        -- Language Server Protocol
  { import = "plugins.cmp" },        -- Auto-completion
  { import = "plugins.hydra" },      -- Custom submodes and menus (like Emacs hydra)
  { import = "plugins.dap" },        -- Debug Adapter Protocol
  { import = "plugins.fun" },        -- Just for fun
}
