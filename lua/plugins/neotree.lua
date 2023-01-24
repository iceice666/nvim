vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("neo-tree").setup({
  close_if_last_window = true,
  sort_by = "case_sensitive",
  actions = {
    open_file = { quit_on_open = true },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  filters = {
    custom = { "^.git$", "^node_modules$" },
  },
  git = {
    enable = true,
  },
  log = {
    enable = true,
    types = {
      diagnostics = true,
    },
  },

  diagnostics = {
    enable = true,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
})

local opt = { silent = true }
-- File tree
local mapx = require("core.keymap").mapx
mapx.nnoremap("<leader>e", ":NeoTreeRevealToggle <cr>", opt)
