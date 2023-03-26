return {
  -- Mark treesitter node to enhance context changes in buffer.
  "atusy/tsnode-marker.nvim",
  lazy = true,
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("tsnode-marker-markdown", {}),
      pattern = "markdown",
      callback = function(ctx)
        require("tsnode-marker").set_automark(ctx.buf, {
          target = { "code_fence_content" }, -- list of target node types
          hl_group = "CodeBlock", -- highlight group
        })
      end,
    })
  end,
  config = function()
    vim.api.nvim_set_hl(0, "CodeBlock", { bg = vim.g.colors.bg() })
  end,
}
