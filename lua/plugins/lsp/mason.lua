return {
    "williamboman/mason.nvim",
  opts = {}
},
{
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  lazy = true,
  opts = {
    ensure_installed = { "python" },
    automatic_installation = true,
    automatic_setup = true,
  },
}
