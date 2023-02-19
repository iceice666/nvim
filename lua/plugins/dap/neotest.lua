return {
  -- test adapter
  -- NEED: More research and config
  -- See https://github.com/nvim-neotest/neotest for helps
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
          dap = { justMyCode = false },
          args = { "--log-level", "DEBUG" },
          runner = "pytest",
          python = ".venv/bin/python"
        }),
      },
    })
  end,
}
