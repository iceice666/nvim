return {
  -- File explorer
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "s1n7ax/nvim-window-picker",
  },
  branch = "v3.x",
  cmd = {
    "Neotree",
  },
  opts = {
    use_default_mappings = false,

    window = {
      mappings = {
        ["ge"] = function()
          vim.cmd("Neotree focus filesystem left")
        end,
        ["gb"] = function()
          vim.cmd("Neotree focus buffers left")
        end,
        ["gg"] = function()
          vim.cmd("Neotree focus git_status left")
        end,

        ["<cr>"] = "open",
        ["<tab>"] = {
          "toggle_preview",
          config = { use_float = true },
        },
        ["S"] = "split_with_window_picker",
        ["s"] = "vsplit_with_window_picker",
        ["w"] = "open_with_window_picker",
        ["a"] = {
          "add",
          -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
          -- some commands may take optional config options, see `:h neo-tree-mappings` for details
          config = {
            show_path = "relative", -- "none", "relative", "absolute"
          },
        },
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = {
          "copy",
          config = {
            show_path = "relative", -- "none", "relative", "absolute"
          },
        },
        ["m"] = {
          "move",
          config = {
            show_path = "relative", -- "none", "relative", "absolute"
          },
        }, -- takes text input for destination, also accepts the optional config.show_path option like "add".
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["["] = "prev_source",
        ["]"] = "next_source",
      },
    },

    close_if_last_window = true,

    sort_by = "case_sensitive",

    filesystem = {
      filtered_items = {
        visible = false,
        hide_gitignored = true,
        hide_hidden = false,
        hide_dotfiles = false,
        follow_current_file = {
          enabled = true,
        },
        always_show = {
          ".gitignore",
        },
        never_show = {
          ".vscode",
          ".git",
          ".idea",
        },
        hide_by_pattern = { -- uses glob style patterns
          "*.lock",
        },
      },
      window = {
        mappings = {
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["D"] = "fuzzy_finder_directory",
          ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
          -- ["D"] = "fuzzy_sorter_directory",
          ["f"] = "filter_on_submit",
          ["<c-/>"] = "clear_filter",
          ["g["] = "prev_git_modified",
          ["g]"] = "next_git_modified",
        },
        fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
          ["<down>"] = "move_cursor_down",
          ["<C-n>"] = "move_cursor_down",
          ["<up>"] = "move_cursor_up",
          ["<C-p>"] = "move_cursor_up",
        },
      },
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
          pcall(require("neo-tree").close_all)
        end,
      },
    },

    default_component_configs = {
      icon = {
        folder_empty = "󰜌",
        folder_empty_open = "󰜌",
      },
      git_status = {
        symbols = {
          renamed = "󰁕",
          unstaged = "󰄱",
        },
      },
    },

    document_symbols = {
      kinds = {
        File = { icon = "󰈙", hl = "Tag" },
        Namespace = { icon = "󰌗", hl = "Include" },
        Package = { icon = "󰏖", hl = "Label" },
        Class = { icon = "󰌗", hl = "Include" },
        Property = { icon = "󰆧", hl = "@property" },
        Enum = { icon = "󰒻", hl = "@number" },
        Function = { icon = "󰊕", hl = "Function" },
        String = { icon = "󰀬", hl = "String" },
        Number = { icon = "󰎠", hl = "Number" },
        Array = { icon = "󰅪", hl = "Type" },
        Object = { icon = "󰅩", hl = "Type" },
        Key = { icon = "󰌋", hl = "" },
        Struct = { icon = "󰌗", hl = "Type" },
        Operator = { icon = "󰆕", hl = "Operator" },
        TypeParameter = { icon = "󰊄", hl = "Type" },
        StaticMethod = { icon = "󰠄 ", hl = "Function" },
      },
    },

    -- Add this section only if you've configured source selector.
    source_selector = {
      sources = {
        { source = "filesystem" },
        { source = "buffers" },
        { source = "git_status" },
      },
      winbar = true,
      statusline = false,
    },
  },
  keys = {
    {
      "<leader>ft",
      "<cmd>Neotree reveal toggle<cr>",
      "Toggle file tree",
    },
  },
}
