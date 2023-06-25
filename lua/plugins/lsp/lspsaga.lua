return {
  "glepnir/lspsaga.nvim",
  pin = true,
  cmd = "Lspsaga",
  config = function()
    local theme_dyeing = function()
      if vim.g.theme == "catppuccin" and (not vim.g.theme == "catppuccin") then
        return require("catppuccin.groups.integrations.lsp_saga").custom_kind()
      else
        return {
          -- This option only works in Neovim 0.9
          title = true,
          -- Border type can be single, double, rounded, solid, shadow.
          border = "single",
          winblend = 0,
          expand = "",
          collapse = " ",
          code_action = "💡",
          incoming = " ",
          outgoing = " ",
          hover = " ",
          kind = {},
        }
      end
    end
    require("lspsaga").setup({
      ui = {
        kind = theme_dyeing(),
      },
      lightbulb = {
        enable = true,
        enable_in_insert = false,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
      },
    })

    vim.fn.sign_define("DiagnosticSignError", {
      text = "",
      texthl = "DiagnosticSignError",
      linehl = "DiagnosticSignError",
      numhl = "DiagnosticSignError",
    })
    vim.fn.sign_define("DiagnosticSignWarn", {
      text = "",
      texthl = "DiagnosticSignWarn",
      linehl = "DiagnosticSignWarn",
      numhl = "DiagnosticSignWarn",
    })
    vim.fn.sign_define("DiagnosticSignHint", {
      text = "",
      texthl = "DiagnosticSignHint",
      linehl = "DiagnosticSignHint",
      numhl = "DiagnosticSignHint",
    })
    vim.fn.sign_define("DiagnosticSignInfo", {
      text = "",
      texthl = "DiagnosticSignInfo",
      linehl = "DiagnosticSignInfo",
      numhl = "DiagnosticSignInfo",
    })
  end,
}
