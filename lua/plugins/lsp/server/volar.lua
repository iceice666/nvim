-- If you are using mason.nvim, you can get the ts_plugin_path like this
local mason_registry = require("mason-registry")
local vue_language_server_path = mason_registry
    .get_package("vue-language-server")
    :get_install_path() .. "/node_modules/@vue/language-server"

local lspconfig = require("lspconfig")

local lsp_default = require("plugins.lsp.server._default")

lspconfig.tsserver.setup({
  capabilities = lsp_default.get_capabilities(),
  on_attach = lsp_default.on_attach,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = {
    "typescript",
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "vue",
  },
  server = {
    hint = {
      enable = true,
    }
  }
})



-- No need to set `hybridMode` to `true` as it's the default value
lspconfig.volar.setup({
  capabilities = lsp_default.get_capabilities(),
  on_attach = lsp_default.on_attach,
  server = {
    hint = {
      enable = true,
    }
  }
})

