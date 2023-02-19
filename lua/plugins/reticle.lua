return {
  -- cursorline apperence
  "tummetott/reticle.nvim",
  event="BufNew",
  config = function()
    require("reticle").setup {
      on_focus = {
        cursorline = {
          "neo-tree"
        }
      }
    }
    vim.cmd("set cursorline")
  end
}
