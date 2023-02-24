return {
  -- theme
  "Mofiqul/vscode.nvim",
  branch = "main",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = "dark"
    vim.cmd("colorscheme vscode")

    vim.api.nvim_set_hl(0, "SpecialChar", { fg = "#c586c0" })
    -- vim.api.nvim_set_hl(0, "@stringEscape", { link = "@string.escape" })
  end,
}
