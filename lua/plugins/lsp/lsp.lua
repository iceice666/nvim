local load = function(lang)
  return function()
    require("plugins.lsp.server." .. lang)
  end
end

local default_config = require("plugins.lsp.server._default") -- return a table

local server = { "lua_ls", "pyright", "rust_analyzer", "tsserver", "volar" }

local handler = {
  function(server_name)
    require("lspconfig")[server_name].setup({
      on_attach = default_config.on_attach,
      capabilities = default_config.capabilities(),
    })
  end,
}

for _, name in pairs(server) do
  local ok, cfg = pcall(load, name)
  if ok then
    handler[name] = cfg
  end
end

return {
  "williamboman/mason-lspconfig.nvim",
  event = "BufReadPre",
  dependencies = {
    "neovim/nvim-lspconfig",
    {
      "williamboman/mason.nvim",
      config = true,
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
    handlers = handler,
  },
  init = function()
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
  end,
}
