return {
  -- indent line
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  main = "ibl",
  config = function()
    vim.cmd([[
    highlight IblCurIndent gui=nocombine guifg=#bff3fe
        ]])
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
