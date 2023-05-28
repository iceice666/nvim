return {
  -- indent line
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  config = function()
    if vim.g.theme ~= "catppuccin" then
      -- stylua: ignore start
      vim.cmd("highlight IndentBlanklineContextStart gui=underline guisp=#DDAAFF")
      vim.cmd("highlight IndentBlanklineContextChar gui=nocombine guifg=#DDAAFF")
      vim.cmd("highlight IndentBlanklineIndent1 guifg=#770000 gui=nocombine")
      vim.cmd("highlight IndentBlanklineIndent2 guifg=#a03000 gui=nocombine")
      vim.cmd("highlight IndentBlanklineIndent3 guifg=#004000 gui=nocombine")
      vim.cmd("highlight IndentBlanklineIndent4 guifg=#005477 gui=nocombine")
      vim.cmd("highlight IndentBlanklineIndent5 guifg=#003d77 gui=nocombine")
      vim.cmd("highlight IndentBlanklineIndent6 guifg=#6d12ff gui=nocombine")

      -- sytlua: ignore end
    end

    require("indent_blankline").setup({
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      },
      char = "▎",
      context_char = "▎",
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
      show_first_indent_level = false,
      use_treesitter_scope = true,
      stric_tabs = true,
    })
  end,
}
