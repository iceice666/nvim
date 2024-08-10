return {
  "mbbill/undotree",
  init = function()
    vim.cmd([[let g:undotree_WindowLayout = 2]])
  end,
  keys = {
    {
      "<leader>U",
      function()
        vim.cmd("silent! %foldopen! | UndotreeToggle")
      end,
      desc = "undotree",
    },
  },
}
