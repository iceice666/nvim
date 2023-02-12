local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
    sources = {
        -- lua
        formatting.stylua.with(
            {
                extra_args = {
                    "--indent-type", "Spaces", "--indent_width", "2"
                }
            }
        ),

        -- python
        formatting.black,
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
