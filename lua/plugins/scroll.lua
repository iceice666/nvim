return {
  -- scroll related
  "petertriho/nvim-scrollbar",
  config = function()
    require("scrollbar").setup({
      show_in_active_only = true,
    })

    require("scrollbar.handlers.search").setup({})
  end
}
