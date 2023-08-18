return {
	-- indent line
	"lukas-reineke/indent-blankline.nvim",
	event = "BufReadPre",
	config = function()
		vim.cmd([[
highlight IndentBlanklineContextStart gui=underline guisp=#bff3fe guibg=#313244 cterm=underline
highlight IndentBlanklineContextChar gui=nocombine guifg=#bff3fe
    ]])
		require("indent_blankline").setup({
			char = "▎",
			context_char = "▎",
			space_char_blankline = " ",
			show_current_context = true,
			show_current_context_start = true,
			show_first_indent_level = true,
			use_treesitter_scope = true,
			stric_tabs = true,
		})
	end,
}
