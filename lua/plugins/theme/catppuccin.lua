return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 9999,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      color_overrides = {
        all = {
          mzk = "#DDAACC",
        },
      },
      custom_highlights = function(c)
        return {
          CodeBlock = { bg = c.dark3 },
          DashboardDesc = { fg = c.teal },
          DashboardKey = { fg = c.orange },
          ["@comment"] = { fg = "#009f69" },
        }
      end,
      integrations = {
        cmp = true,
        lsp_trouble = true,
        lsp_saga = true,
        which_key = true,
        treesitter = true,
        noice = true,
        neotree = true,
        telescope = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
      },
    })
    vim.cmd("colorscheme catppuccin")
    vim.g.theme = "catppuccin"

    local colors = require("catppuccin.palettes").get_palette("mocha")
    colors.bg = colors.base
    colors.git = {
      add = colors.green,
      change = colors.yellow,
      delete = colors.red,
    }

    vim.g.colors = colors
  end,
}
