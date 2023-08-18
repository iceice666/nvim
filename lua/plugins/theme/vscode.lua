return {
	-- theme
	branch = "main",
	lazy = false,
	priority = 9999,
	"Mofiqul/vscode.nvim",
	config = function()
		-- vim.o.background = "dark"
		local c = require("vscode.colors").get_colors()
		require("vscode").setup({
			transparent = true,
			italic_comments = true,
			group_overrides = {
				SpecialChar = { fg = c.vscPink, bg = "NONE" },
			},
		})

		vim.cmd("colorscheme vscode")
	end,
}
