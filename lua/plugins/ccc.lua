require("ccc").setup {}


vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "",
  callback = function()
    vim.cmd("CccHighlighterEnable")
  end,
})
