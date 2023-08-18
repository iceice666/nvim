return {
	enabled = false,
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	event = { "BufReadPre" },
	config = function()
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
		local mapx = vim.g.mapx
		mapx.group({ silent = true }, function()
			mapx.nnoremap("<leader>fO", require("ufo").openAllFolds)
			mapx.nnoremap("<leader>fC", require("ufo").closeAllFolds)
			mapx.nnoremap("<leader>fo", require("ufo").openFoldsExceptKinds)
			mapx.nnoremap("<leader>fc", require("ufo").closeFoldsWith)
			mapx.nnoremap("<leader>ft", "za")
		end)

		local ftMap = {
			vim = "indent",
			python = { "indent" },
			git = "",
		}

		local function customizeSelector(bufnr)
			local function handleFallbackException(err, providerName)
				if type(err) == "string" and err:match("UfoFallbackException") then
					return require("ufo").getFolds(bufnr, providerName)
				else
					return require("promise").reject(err)
				end
			end

			return require("ufo")
				.getFolds(bufnr, "lsp")
				:catch(function(err)
					return handleFallbackException(err, "treesitter")
				end)
				:catch(function(err)
					return handleFallbackException(err, "indent")
				end)
		end

		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return ftMap[filetype] or { "treesitter", "indent" }
			end,
			close_fold_kinds = { "imports", "comment" },
			preview = {
				win_config = {
					border = { "", "─", "", "", "", "─", "", "" },
					winhighlight = "Normal:Folded",
					winblend = 0,
				},
				mappings = {
					scrollU = "<C-[>",
					scrollD = "<C-]>",
					jumpTop = "<C-n>",
					jumpBot = "<C-N>",
				},
			},
			fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = ("  %d lines"):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end,
		})
	end,
}
