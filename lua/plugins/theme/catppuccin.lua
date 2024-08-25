return {
  "catppuccin/nvim",
  name = "catppuccin",
  cond = 1 ~= vim.g.vscode,
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
          DapBreakpoint = { fg = c.red1 },
          DapLogPoint = { fg = c.cyan },
          DapStop = { fg = c.green },
          LspInlayHint = { fg = c.overlay2, bg = c.crust },
          Folded = { bg = c.base },
          IblCurIndent = { fg = "#bff3fe", bg = "NONE" },

          -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
          PmenuSel = { bg = "#282C34", fg = "NONE" },
          Pmenu = { fg = "#C5CDD9", bg = "#22252A" },

          CmpItemAbbrDeprecated = {
            fg = "#7E8294",
            bg = "NONE",
            strikethrough = true,
          },
          CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", bold = true },
          CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", bold = true },
          CmpItemMenu = { fg = "#C792EA", bg = "NONE", italic = true },

          CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
          CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
          CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },

          CmpItemKindText = { fg = "#e5eedd", bg = "#3A570F" },
          CmpItemKindEnum = { fg = "#e5eedd", bg = "#3A570F" },
          CmpItemKindKeyword = { fg = "#e5eedd", bg = "#3A570F" },

          CmpItemKindConstant = { fg = "#FFE082", bg = "#725A08" },
          CmpItemKindConstructor = { fg = "#FFE082", bg = "#725A08" },
          CmpItemKindReference = { fg = "#FFE082", bg = "#725A08" },

          CmpItemKindFunction = { fg = "#EADFF0", bg = "#41145d" },
          CmpItemKindStruct = { fg = "#EADFF0", bg = "#41145d" },
          CmpItemKindClass = { fg = "#EADFF0", bg = "#41145d" },
          CmpItemKindModule = { fg = "#EADFF0", bg = "#41145d" },
          CmpItemKindOperator = { fg = "#EADFF0", bg = "#41145d" },

          CmpItemKindVariable = { fg = "#C5CDD9", bg = "#4c5094" },
          CmpItemKindFile = { fg = "#C5CDD9", bg = "#4c5094" },

          CmpItemKindUnit = { fg = "#F5EBD9", bg = "#a07627" },
          CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#a07627" },
          CmpItemKindFolder = { fg = "#F5EBD9", bg = "#a07627" },

          CmpItemKindMethod = { fg = "#DDE5F5", bg = "#045265" },
          CmpItemKindValue = { fg = "#DDE5F5", bg = "#045265" },
          CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#045265" },

          CmpItemKindInterface = { fg = "#D8EEEB", bg = "#308d80" },
          CmpItemKindColor = { fg = "#D8EEEB", bg = "#308d80" },
          CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#308d80" },

          CmpItemKindCopilot = { fg = "#ccbbdd", bg = "#378e00" },
          CmpItemKindFittenCode = { fg = "#009be1" }
        }
      end,
      integrations = {
        cmp = true,
        flash = true,
        lsp_trouble = true,
        lsp_saga = true,
        which_key = true,
        treesitter = true,
        noice = true,
        neotree = true,
        telescope = true,
        dashboard = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        markdown = true,
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
