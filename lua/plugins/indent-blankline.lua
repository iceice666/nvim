return {
  -- indent line
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  config = function()
    vim.cmd("highlight IndentBlanklineContextStart gui=underline guisp=#DDAAFF")
    vim.cmd("highlight IndentBlanklineContextChar gui=nocombine guifg=#DDAAFF")
    vim.cmd("highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine")
    vim.cmd("highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine")
    vim.cmd("highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine")
    vim.cmd("highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine")
    vim.cmd("highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine")
    vim.cmd("highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine")
    -- vim.cmd("highlight IndentBlanklineChar guifg=#6d12ff gui=nocombine")



    require("indent_blankline").setup {
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      },
      char = '▎',
      context_char = "▎",
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
      show_first_indent_level = false,
      use_treesitter_scope = true,
      stric_tabs = true
    }
  end
}
