local rt = require("rust-tools")
local util = require("lspconfig/util")
local lsp_config = require("plugins.lsp.langs._default").lsp_config
local nmaps = require("plugins.lsp.langs._default").nnoremaps

nmaps["gk"] = {"<cmd>RustHoverActions <cr>", "LSP: rust: hover actions " }

rt.setup({
  tools = {
    hover_actions = {
      -- whether the hover action window gets automatically focused
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
          ignore = { "unused_variables", "dead_code"},
        },
      },
    },
  }, nmaps),
})
