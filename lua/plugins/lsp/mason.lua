return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {}
  },
  {
    enabled = false,
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = { "python" },
      automatic_installation = true,
      automatic_setup = true,
    },
  }
}
