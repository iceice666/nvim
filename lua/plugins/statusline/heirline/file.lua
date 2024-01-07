local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local FileNameBlock = {
  -- let's first set up some attributes needed by this component and it's children
  init = function(self)
    local filename = vim.api.nvim_buf_get_name(0)
    self.filename = filename
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(
      filename,
      vim.fn.fnamemodify(filename, ":e"),
      { default = true }
    )
  end,
}

local FileIcon = {
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

local FileName = {
  provider = function(self)
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

local cpp_name = ({
  "D--",
  "C++",
  "C艹",
  "吸加加",
  "CPP",
})[math.random(5)]

local firstToUpper = vim.g.util.firstToUpper
local FileType = {
  provider = function()
    local ft = vim.bo.filetype
    local custom = {
      ["css"] = "CSS",
      ["scss"] = "SCSS",
      ["html"] = "HTML",
      ["cs"] = "C#",
      ["cpp"] = cpp_name,
    }
    local r = custom[ft]
    if r == nil then
      return firstToUpper(ft)
    else
      return r
    end
  end,
  hl = function(self)
    return { fg = self.icon_color, bold = true }
  end,
}

local HelpFileName = {
  condition = function()
    return vim.bo.filetype == "help"
  end,
  provider = function()
    local filename = vim.api.nvim_buf_get_name(0)
    return vim.fn.fnamemodify(filename, ":t")
  end,
  hl = { fg = "green" },
}

local TerminalName = {
  -- we could add a condition to check that buftype == 'terminal'
  -- or we could do that later (see #conditional-statuslines below)
  provider = function()
    local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
    return " " .. tname
  end,
  hl = { fg = "blue", bold = true },
}

return {
  FileType = utils.insert(
    FileNameBlock,
    FileIcon,
    FileType,
    { provider = "%<" }
  ),
  FileName = utils.insert(FileNameBlock, FileName, { provider = "%<" }),
  HelpFileName = HelpFileName,
  TerminalName = TerminalName,
}
