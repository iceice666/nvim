return {
  "smjonas/inc-rename.nvim",
  config = true,
  keys = {
    {
      "<leader>rn",
      function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      expr = true,
    },
  },
}
