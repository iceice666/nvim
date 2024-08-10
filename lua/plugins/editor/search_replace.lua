return {
  'MagicDuck/grug-far.nvim',
  config = function()
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
