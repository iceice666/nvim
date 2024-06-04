return {
  cond = 1 ~= vim.g.vscode,
  "smjonas/inc-rename.nvim",
  dependencies = {
    "stevearc/dressing.nvim"
  },
  init = function()
    vim.cmd(":set inccommand=split")
  end,
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