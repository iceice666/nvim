local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

local FileNameBlock = {
  -- let's first set up some attributes needed by this component and it's children
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(
      filename,
      extension,
      { default = true }
    )
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

local FileName = {
  provider = function(self)
    -- first, trim the pattern relative to the current directory. For other
    -- options, see :h filename-modifers
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then
      return "[No Name]"
    end
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
  hl = { fg = utils.get_highlight("Directory").fg },
}

local firstToUpper = require("core.utils").firstToUpper
local FileType = {
  provider = function()
    local ft = vim.bo.filetype
    local exclude = { "css", "scss", "html" }
    for _, v in pairs(exclude) do
      if ft == v then
        return string.upper(ft)
      end
    end
    return firstToUpper(ft)
  end,
  hl = { fg = utils.get_highlight("Type").fg, bold = true },
}

return {
  FileType = utils.insert(
    FileNameBlock,
    FileIcon,
    FileType,
    { provider = "%<" }
  ),
  FileName = utils.insert(FileNameBlock, FileName, { provider = "%<" }),
}
