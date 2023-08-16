return {
    -- Format & lint
    cond = true,
    "jose-elias-alvarez/null-ls.nvim",
    event = {
        "BufReadPre",
    },
    dependencies = {},
    config = function()
        local null_ls = require("null-ls")

        local formatting = null_ls.builtins.formatting
        -- local diagnostics = null_ls.builtins.diagnostics
        -- local completion = null_ls.builtins.completion
        -- local code_actions = null_ls.builtins.code_actions

        null_ls.setup({
            sources = {

                -- "javascript", "javascriptreact",
                -- "typescript", "typescriptreact",
                -- "vue", "css", "scss", "less",
                -- "html",
                -- "json", "jsonc",
                -- "yaml",
                -- "markdown", "markdown.mdx",
                -- "graphql",
                -- "handlebars"
                formatting.prettier_d_slim,

                -- lua
                formatting.stylua,

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
            },
        })
    end,
}
