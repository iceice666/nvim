return {
	-- smooth scrolling
	"karb94/neoscroll.nvim",
	dependencies = {
		"Aasim-A/scrollEOF.nvim",
	},
	keys = {},
	config = function()
		local neoscroll = require("neoscroll")
		neoscroll.setup({
			mappings = {},
			hide_cursor = true,
			stop_eof = true,
			cursor_scrolls_alone = true,
		})

		local scroll = neoscroll.scroll
	end,
}
