return {
	cmd = "Cheatsheet",
	"sudormrfbin/cheatsheet.nvim",
	config = function()
		-- TODO: Add a function to auto generate cheatsheet.txt with custom keybinding
		local cs = require("cheatsheet")
		local actions = require("cheatsheet.telescope.actions")
		cs.setup({
			bundled_cheatsheets = {
				enabled = { "default", "nerd-fonts" },
			},
			include_only_installed_plugins = true,
			telescope_mappings = {
				["<CR>"] = actions.select_or_execute,
				["<A-CR>"] = actions.select_or_fill_commandline,
			},
		})
	end,
}
