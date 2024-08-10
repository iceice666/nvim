return {
  'MagicDuck/grug-far.nvim',
  config = function()
    vim.g.maplocalleader = '\\'
    require('grug-far').setup({
    })
  end,
  keys = {
    {
      "<leader>r",
      "<CMD>GrugFar<CR>"
    }
  }

}
