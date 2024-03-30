local lsp_default = require("plugins.lsp.langs.default")
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

    capabilities = lsp_default.capabilities(),
    on_attach = lsp_default.on_attach,
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
