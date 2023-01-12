require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "codedark",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      "NvimTree", "alpha",
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { { "filename", path = 1 } },
    lualine_c = {
      {
        "diagnostcs",
        sources = { "nvim_lsp", "nvim_diagnostic", "nvim_workspace_diagnostic" },
        sections = { "error", "warn", "info", "hint" },
        diagnostics_color = {
          error = "DiagnosticError",
          warn = "DiagnosticWarn",
          info = "DiagnosticInfo",
          hint = "DiagnosticHint",
        },
        symbols = {
          error = "",
          warning = "",
          hint = "",
          information = "",
        },
        colored = true,
        update_in_insert = false,
        always_visible = false,
      },
    },
    lualine_x = { "filetype" },
    lualine_y = { { "location", color = { fg = "white" } } },
    lualine_z = {},
  },
  inactive_sections = {

    lualine_a = { { "filename" } },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})
