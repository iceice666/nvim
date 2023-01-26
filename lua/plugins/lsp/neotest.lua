require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = { justMyCode = false },
      args = { "--log-level", "DEBUG" },
      runner = "pytest",
      python = "venv/bin/python"
    }),
  },
})
