return {
  -- Format & lint
  pin = true,
  "jose-elias-alvarez/null-ls.nvim",
  event = {
    "BufReadPre",
  },
  dependencies = {},
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    -- local completion = null_ls.builtins.completion
    -- local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
      sources = {
        -- "javascript", "javascriptreact",
        -- "typescript", "typescriptreact"
        -- "json", "jsonc", "markdown",
        formatting.deno_fmt,
        -- lua
        formatting.stylua.with({
          extra_args = {
            "--column-width",
            "80",
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--quote-style",
            "ForceDouble",
          },
        }),

        -- rust
        formatting.rustfmt,

        -- python
        formatting.black.with({
          extra_args = {
            "--line-length",
            "80",
          },
        }),
        formatting.isort,

        --golang
        diagnostics.golangci_lint,
        diagnostics.revive,
        formatting.golines.with({
          extra_args = {
            "--max-len=180",
            "--base-formatter=gofumpt",
          },
        }),
        require("go.null_ls").gotest(),
        require("go.null_ls").gotest_action(),
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
  end,
}
