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
          dark_red = "#51112f",
        },
      },
      custom_highlights = function(c)
        return {
          CodeBlock = { bg = c.dark3 },
          DashboardDesc = { fg = c.teal },
          DashboardKey = { fg = c.orange },
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
    vim.g.theme = "catppuccin"
    vim.g.colors = require("catppuccin.palettes").get_palette("mocha")
    vim.cmd("colorscheme catppuccin")
  end,
}
