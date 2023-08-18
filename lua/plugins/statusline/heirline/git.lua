local conditions = require("heirline.conditions")
return {
	condition = conditions.is_git_repo,
	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
		self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
	end,
	on_click = {
		callback = function()
			vim.cmd("LazyGit")
		end,
		name = "heirline_git",
	},
	hl = { fg = "orange" },
	{
		-- git branch name
		provider = function(self)
			return " " .. self.status_dict.head
		end,
		hl = { bold = true },
	},
	{
		provider = function(self)
			local count = self.status_dict.added or 0
			return count > 0 and ("  " .. count)
		end,
		hl = { fg = "git.add" },
	},
	{
		provider = function(self)
			local count = self.status_dict.removed or 0
			return count > 0 and ("  " .. count)
		end,
		hl = { fg = "git.delete" },
	},
	{
		provider = function(self)
			local count = self.status_dict.changed or 0
			return count > 0 and ("  " .. count)
		end,
		hl = { fg = "git.change" },
	},
}
