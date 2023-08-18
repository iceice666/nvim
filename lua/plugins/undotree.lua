return {
	-- Undo history
	"mbbill/undotree",
	event = "BufAdd",
	config = function()
		vim.g.mapx.nnoremap("<leader>U", "<cmd>UndotreeToggle<cr>", "Undo tree")
	end,
}
