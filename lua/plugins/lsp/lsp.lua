return {
  {
    -- neodev/ nvim lua setting help
    "folke/neodev.nvim",
    ft = "lua",
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = "FileReadPost",
    config = function()
      require("lsp-inlayhints").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",
      dependencies = { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      require("neodev").setup({
        library = { plugins = { "neotest" }, types = true },
        override = false,
      })
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- lua
          "lua_ls",
          -- python
          "pyright",
          -- rust
          "rust_analyzer",
        },
        automatic_installation = true,
      })
      local lsp_config = require("plugins.lsp.langs.default").lsp_config

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup(lsp_config())
        end,
        ["lua_ls"] = require("plugins.lsp.langs.lua"),
        ["pyright"] = require("plugins.lsp.langs.python"),
        ["rust_analyzer"] = require("plugins.lsp.langs.rust"),
        ["clangd"] = require("plugins.lsp.langs.c_cpp"),
      })
    end,
  },
}
