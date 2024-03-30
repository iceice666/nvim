return {
  -- show column when line too long
  "m4xshen/smartcolumn.nvim",
  event = "BufReadPost",
  opts = {
      colorcolumn = 80,
      disabled_filetypes = {
        "help",
        "text",
        "markdown",
        "lazy",
        "dashboard",
      },
    },
}
