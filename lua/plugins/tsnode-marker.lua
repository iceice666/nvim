return {
	"atusy/tsnode-marker.nvim",
	lazy = true,
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("tsnode-marker-markdown", {}),
			pattern = "markdown",
			callback = function(ctx)
				require("tsnode-marker").set_automark(ctx.buf, {
					target = { "code_fence_content" }, -- list of target node types
					hl_group = "markdown_inline", -- highlight group
				})
			end,
		})

		vim.cmd("highlight markdown_inline guibg=#101017 gui=nocombine")
	end,
}
