return {
	-- scrollbar
	"petertriho/nvim-scrollbar",
	event = "BufReadPost",
	theme = "tokyonight",
	config = function()
		require("scrollbar").setup({
			show_in_active_only = true,
		})

		require("scrollbar.handlers.search").setup({})
	end,
}
