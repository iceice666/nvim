require("twilight").setup {
  exclude = {
    "dashboard",
    "dashboardpreview",
    "dapui_watches",
    "dapui_stacks",
    "dapui_breakpoints",
    "dapui_scopes",
    "dapui_console",
    "dap-repl"
  },
  dimming = {
    term_bg = require('core.colors').bg()
  },
  context = 6
}
