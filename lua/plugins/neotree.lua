return {
  -- File explorer
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  branch = "v2.x",
  keys = "<leader>e",
  cmd = {
    "Neotree",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("neo-tree").setup({
      close_if_last_window = true,
      sort_by = "case_sensitive",
      filesystem = {
        filtered_items = {
          hide_gitignored = false,
        },
        follow_current_file = true,
      },
      actions = {
        open_file = { quit_on_open = true },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
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
      event_handlers = {
        {
          event = "file_opened",
          handler = function(_)
            --auto close
            require("neo-tree").close_all()
          end,
        },
      },
    })

    local opt = { silent = true }
    -- File tree
    local mapx = require("core.keymap").mapx
    mapx.nnoremap("<leader>e", ":Neotree reveal toggle<cr>", opt)
  end,
}
