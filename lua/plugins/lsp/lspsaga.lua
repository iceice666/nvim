return {
  "glepnir/lspsaga.nvim",
  pin = true,
  cmd = "Lspsaga",
  theme = "tokyonight",
  config = function()
    require("lspsaga").setup({
      lightbulb = {
        enable = true,
        enable_in_insert = false,
        sign = false,
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
