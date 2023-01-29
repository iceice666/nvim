require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "vim", "regex", "bash", "markdown", "markdown_inline", "go" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>'
    }
  },
})

--vim.wo.foldlevel = 114514
--vim.wo.foldmethod = 'expr'
--vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
