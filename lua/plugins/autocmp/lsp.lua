return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = true,
      dependencies = { "williamboman/mason-lspconfig.nvim" },
    },
    {
      "lvimuser/lsp-inlayhints.nvim",
      event = "FileReadPost",
      config = true,
    },
  },
  opts = {
    ensure_installed = {
      -- lua
      "lua_ls",
      -- python
      "pyright",
      -- rust
      "rust_analyzer",
    },
    automatic_installation = true,
  },
  config = function(_, opts)
    require("mason-lspconfig").setup(opts)

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

    local load = function(lang)
      return function()
        require("plugins.autocmp.langs." .. lang)
      end
    end

    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup(load("default")())
      end,

      -- INFO: Use `load` to set up a langauge server
      -- Also see: `:help mason-lspconfig.setup_handlers()`
      ["lua_ls"] = load("lua"), -- this one setup server inside
      ["pyright"] = load("python"), -- this one setup server inside
      ["rust_analyzer"] = load("rust"), -- this one pass config to plugin ( and plugin will setup the server)
    })
  end,
}
