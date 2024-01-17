require("flutter-tools").setup({
  lsp = {
    widget_guides = {
      enabled = true,
    },
    color = {
      enabled = true,
      background = true,
      virtual_text_str = "",
    },
  },
  closing_tags = {
    highlight = "LspInlayHint",
    prefix = "",
  },
})
