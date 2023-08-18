return {
	-- theme
	branch = "main",
	lazy = false,
	priority = 9999,
	"folke/tokyonight.nvim",
	config = function()
		local opts = {
			style = "night",
			light_style = "day",
			transparent = false,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				sidebars = "dark",
				floats = "dark",
			},
			sidebars = { "qf", "help", "neo-tree" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			on_colors = function(colors)
				colors.mzk = "#DDAACC"
				colors.dark_red = "#51112f"
			end,
			on_highlights = function(hl, c)
				hl.CodeBlock = { bg = c.dark3 }
				hl.DashboardDesc = { fg = c.teal }
				hl.DashboardKey = { fg = c.orange }
			end,
		}

		require("tokyonight").setup(opts)
		vim.g.colors = require("tokyonight.colors").setup(opts)

		vim.cmd("colorscheme tokyonight-night")
	end,
}
