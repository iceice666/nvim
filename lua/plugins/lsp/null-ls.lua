local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    -- formatting
    formatting.stylua.with(
      {
        extra_args = {
          "--indent-type", "Spaces", "--indent_width", "2"
        }
      }
    ),
    formatting.autopep8,

    -- linter / diagnostics
    diagnostics.ruff,

    -- code actions
    code_actions.gitsigns,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
