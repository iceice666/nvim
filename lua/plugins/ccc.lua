return {
  -- Color preview / pick
  "uga-rosa/ccc.nvim",
  event = "BufReadPost",
  config = function()
    require("ccc").setup {}
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "",
      callback = function()
        vim.cmd("CccHighlighterEnable")
      end,
    })
  end
}
