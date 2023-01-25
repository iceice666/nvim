require("workspaces").setup({
  hooks = {
    open = { "RestoreSession" },
  }
})
