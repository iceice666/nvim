return {
  -- indent line
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  main = "ibl",
  opts = {
    indent = {
      char = "▎",
    },
    scope = {
      highlight = { "IblCurIndent" },
    },
  }
  ,
}
