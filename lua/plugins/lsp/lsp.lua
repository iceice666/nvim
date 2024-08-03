local load = function(lang)
  return function()
    require("plugins.lsp.server." .. lang)
  end
end

local lsp_default = require("plugins.lsp.server._default") -- return a table

local server = { "lua_ls", "pyright", "rust_analyzer", "tsserver", "volar" }

local handler = {
  function(server_name)
    require("lspconfig")[server_name].setup({
      on_attach = lsp_default.on_attach,
      capabilities = lsp_default.get_capabilities(),
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
    "williamboman/mason.nvim",
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
