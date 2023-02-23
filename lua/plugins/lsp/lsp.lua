return {
  { -- golang
    cond = false,
    'ray-x/go.nvim',
    ft = {
      "go", "golang"
    },
    dependencies = {
      'ray-x/guihua.lua'
    }
  },
  { -- neodev/ nvim lua setting help
    "folke/neodev.nvim",
    ft = "lua"
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
    event = "BufReadPre",
    config = function()
      require("neodev").setup({ library = { plugins = { "neotest" }, types = true }, override = false })
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- lua
          "lua_ls",
          -- golang
          "gopls",
          -- python
          "pyright"
        },
        automatic_installation = true,
      })
      local lsp_config = require("plugins.lsp.langs.default").lsp_config

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup(lsp_config())
        end,
        ["lua_ls"] = require("plugins.lsp.langs.lua"),
        ["gopls"] = require("plugins.lsp.langs.go"),
        ["pyright"] = require("plugins.lsp.langs.python"),
      }
      )
    end

  }
}
