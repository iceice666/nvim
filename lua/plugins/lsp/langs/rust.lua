local rt = require("rust-tools")
local util = require("lspconfig/util")
local lsp_config = require("plugins.lsp.langs._default").lsp_config
local nmaps = require("plugins.lsp.langs._default").nnoremaps

-- nmaps["gh"] = { rt.hover_actions.hover_actions, "LSP: rust: hover actions " }

rt.setup({
  tools = {
    inlay_hints = {
      auto = true,
    },
    hover_actions = {
      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },

      -- Maximal width of the hover window. Nil means no max.
      max_width = nil,

      -- Maximal height of the hover window. Nil means no max.
      max_height = nil,

      -- whether the hover action window gets automatically focused
      -- default: false
      auto_focus = true,
    },
  },
  server = lsp_config({
    filetypes = { "rust" },
    root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        check = {
          ignore = { "unused_variables" },
        },
      },
    },
  }, nmaps),
})
