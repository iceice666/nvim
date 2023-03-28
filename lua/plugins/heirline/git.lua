local conditions = require("heirline.conditions")
return {
  Git = {
    condition = conditions.is_git_repo,

    init = function(self)
      self.status_dict = vim.b.gitsigns_status_dict
      self.has_changes = self.status_dict.added ~= 0
          or self.status_dict.removed ~= 0
          or self.status_dict.changed ~= 0
    end,
    on_click = {
      callback = function()
        local path =
            require("neo-tree.sources.manager").get_state("filesystem").path
        if path == nil then
          vim.cmd("NeoTreeShow")
          vim.cmd("sleep 100m")
          vim.cmd("NeoTreeClose")
          path =
              require("neo-tree.sources.manager").get_state("filesystem").path
        end
        vim.cmd("TermExec cmd='cd " .. path .. " && lazygit&&exit'")
      end,
      name = "heirline_git",
    },

    hl = { fg = "orange" },

    { -- git branch name
      provider = function(self)
        return " " .. self.status_dict.head .. " "
      end,
      hl = { bold = true },
    },

    {
      provider = function(self)
        local count = self.status_dict.added or 0
        return count > 0 and (" " .. count .. " ")
      end,
      hl = { fg = "git.add" },
    },

    {
      provider = function(self)
        local count = self.status_dict.removed or 0
        return count > 0 and (" " .. count .. " ")
      end,
      hl = { fg = "git.delete" },
    },
    {
      provider = function(self)
        local count = self.status_dict.changed or 0
        return count > 0 and ("柳" .. count .. " ")
      end,
      hl = { fg = "git.change" },
    },
  },
}
