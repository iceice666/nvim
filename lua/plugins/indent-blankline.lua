return {
  -- indent line
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  main = "ibl",
  init = function()
    vim.cmd([[
    highlight IblCurIndent gui=nocombine guifg=#bff3fe
        ]])
  end,
  config =
      function()
        require("ibl").setup({
          indent = {
            char = "▎",
          },
          scope = {
            highlight = { "IblCurIndent" },
          },
        })
      end,
}
