return {
  -- cursorline apperence
  "tummetott/reticle.nvim",
  config = function()
    require("reticle").setup {
      on_focus = {
        cursorline = {
          "neo-tree"
        }
      }
    }
  end
}
