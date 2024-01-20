require("flutter-tools").setup({
  lsp = {
    color = {
      enabled = true,
      background = true,
      virtual_text_str = "",
    },
    settings = {
      renameFilesWithClasses = "always",
    },
  },
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = "LspInlayHint",
    prefix = "",
  },
  dev_tools = {
    auto_open_browser = true,
  },
})

require("telescope").load_extension("flutter")
