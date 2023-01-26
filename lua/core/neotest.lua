require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = { justMyCode = false },
      args = { "--log-level", "DEBUG" },
      runner = "pytest",
      python = "venv/bin/python"
    }),
    require("neotest-plenary"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})
