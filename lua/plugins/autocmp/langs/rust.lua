local util = require("lspconfig/util")
vim.g.rustaceanvim = {
  tools = {
    hover_actions = {
      auto_focus = true,
    },
    executors = require("rustaceanvim.executors").quickfix,
  },
  server = {
    filetypes = { "rust" },
    root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        check = {
          ignore = { "unused_variables", "dead_code" },
        },
      },
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function(client, bufnr)
      require("lsp-inlayhints").on_attach(client, bufnr)
      require("lsp-inlayhints").show()
    end,
  },
}
