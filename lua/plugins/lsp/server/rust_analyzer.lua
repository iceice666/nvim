local util = require("lspconfig/util")

local lsp_default = require("plugins.lsp.server._default")

vim.g.rustaceanvim = {
  tools = {
    hover_actions = {
      auto_focus = true,
    },
    executors = require("rustaceanvim.executors").quickfix,
  },
  server = {
    hint = { enable = true, },
    filetypes = { "rust" },
    root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          buildScripts = {
            enable = true,
          },
        },
        check = {
          ignore = { "unused_variables", "dead_code" },
          allTargets = false,
          command = "clippy",
        },
        procMacro = {
          enable = true,
        },
      },
    },
    capabilities = lsp_default.get_capabilities(),
    on_attach = lsp_default.on_attach,
  },
}

