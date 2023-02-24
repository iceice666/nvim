return {
  -- Workspaces
  "natecraddock/workspaces.nvim",
  cmd = "Telescope workspaces",
  config = function()
    require("workspaces").setup({})
  end,
}
