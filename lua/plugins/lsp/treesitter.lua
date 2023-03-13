-- Treesitter / Syntax
return {
  -- "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter",
  dependenices = {},
  event = "BufReadPre",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "python",
        "vim",
        "regex",
        "bash",
        "markdown",
        "markdown_inline",
        "go",
        "query",
        "rust",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "<TAB>",
        },
      },
      -- playground = {
      --   enable = true,
      --   disable = {},
      --   updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      --   persist_queries = false, -- Whether the query persists across vim sessions
      --   keybindings = {
      --     toggle_query_editor = 'o',
      --     toggle_hl_groups = 'i',
      --     toggle_injected_languages = 't',
      --     toggle_anonymous_nodes = 'a',
      --     toggle_language_display = 'I',
      --     focus_language = 'f',
      --     unfocus_language = 'F',
      --     update = 'R',
      --     goto_node = '<cr>',
      --     show_help = '?',
      --   },
      -- }
    })
  end,
}
