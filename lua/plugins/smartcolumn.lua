return {
	-- show column when line too long
	"m4xshen/smartcolumn.nvim",
	event = "BufReadPost",
	config = function()
		require("smartcolumn").setup({
			colorcolumn = 80,
			disabled_filetypes = {
				"help",
				"text",
				"markdown",
				"lazy",
				"dashboard",
			},
		})
	end,
}
