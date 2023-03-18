return {
  -- theme
  "Mofiqul/vscode.nvim",
  branch = "main",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = "dark"
    local c = require("vscode.colors").get_colors()
    require("vscode").setup({
      transparent = false,
      italic_comments = false,
      group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!

        SpecialChar = { fg = "#c586c0", bg = "NONE" },
      },
    })
    require("vscode").load()
  end,
}
