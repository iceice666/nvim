return {
  {
    -- neodev/ nvim lua setting help
    "folke/neodev.nvim",
    ft = "lua",
    config = true
  },

  {
    "lvimuser/lsp-inlayhints.nvim",
    event = "FileReadPost",
    config = true
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",
      config = true,
      dependencies = { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
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
      vim.fn.sign_define("DiagnosticSignError", {
        text = " ",
        texthl = "DiagnosticSignError",
        linehl = "DiagnosticSignError",
        numhl = "DiagnosticSignError",
      })
      vim.fn.sign_define("DiagnosticSignWarn", {
        text = " ",
        texthl = "DiagnosticSignWarn",
        linehl = "DiagnosticSignWarn",
        numhl = "DiagnosticSignWarn",
      })
      vim.fn.sign_define("DiagnosticSignHint", {
        text = " ",
        texthl = "DiagnosticSignHint",
        linehl = "DiagnosticSignHint",
        numhl = "DiagnosticSignHint",
      })
      vim.fn.sign_define("DiagnosticSignInfo", {
        text = " ",
        texthl = "DiagnosticSignInfo",
        linehl = "DiagnosticSignInfo",
        numhl = "DiagnosticSignInfo",
      })
      local lsp_config = require("plugins.lsp.langs._default").lsp_config

      local load = function(lang)
        return function()
          require("plugins.lsp.langs." .. lang)
        end
      end

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup(lsp_config())
        end,

        -- NOTE: when load a langauge (server), that means let lua require/load the lang's setup.
        -- The setup will be defined under `lua/plugins/lsp/langs`.
        --
        -- IMPORTANT: the return value of load() is a function
        ["lua_ls"] = load("lua"),
        ["pyright"] = load("python"),
        ["rust_analyzer"] = load("rust"),
      })
    end,
  },
}
