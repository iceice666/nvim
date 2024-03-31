return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = { "williamboman/mason.nvim" },
  event = "VeryLazy",
  opts = {
    ensure_installed = { "python" },
    automatic_installation = true,
    automatic_setup = true,
  },
}
