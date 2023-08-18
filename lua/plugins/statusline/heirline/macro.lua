local utils = require("heirline.utils")
return {
	MacroRec = {
		condition = function()
			return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0
		end,
		provider = " Recoding... ",
		hl = { fg = "red", bold = true },
		utils.surround({ "[", "]" }, nil, {
			provider = function()
				return vim.fn.reg_recording()
			end,
			hl = { fg = "green", bold = true },
		}),
		update = {
			"RecordingEnter",
			"RecordingLeave",
			-- redraw the statusline on recording events
			callback = vim.schedule_wrap(function()
				vim.cmd("redrawstatus")
			end),
		},
	},
	NeoComposer = {
		provider = require("NeoComposer.ui").status_recording,
		hl = { fg = "red", bold = true },
		update = {
			"RecordingEnter",
			"RecordingLeave",
			-- redraw the statusline on recording events
			callback = vim.schedule_wrap(function()
				vim.cmd("redrawstatus")
			end),
		},
	},
}
