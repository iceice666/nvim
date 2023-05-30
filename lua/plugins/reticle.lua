return {
  -- cursorline apperence
  "tummetott/reticle.nvim",
  cmd = {
    "Telescope",
    "Messages",
    "Enew",
  },
  config = function()
    require("reticle").setup({
      on_focus = {
        cursorline = {
          "neo-tree",
        },
      },
    })
    vim.cmd("set cursorline")
  end,
}
