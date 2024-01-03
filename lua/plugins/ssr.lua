return {
  -- Structural search and replace
  "cshuaimin/ssr.nvim",
  event = "BufReadPre",
  config = function()
    require("ssr").setup({})
  end,
  keys = {
    {
      "<leader>sr",
      mode = { "n", "x" },
      function() require("ssr").open() end,
      desc = "Structural search and replace"
    }
  }
}
