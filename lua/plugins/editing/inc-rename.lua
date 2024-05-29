vim.cmd(":set inccommand=split")
return {
  "smjonas/inc-rename.nvim",
  dependencies = {
    "stevearc/dressing.nvim"
  },
  opts = {
  },
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
