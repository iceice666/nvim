return {
  -- Structural search and replace
  "cshuaimin/ssr.nvim",
  event = "BufReadPre",
  config = true,
  keys = {
    {
      "<leader>sr",
      mode = { "n", "x" },
      function() require("ssr").open() end,
      desc = "Structural search and replace"
    }
  }
}
