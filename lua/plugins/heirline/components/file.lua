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

local cpp_name = function()
  local mapping = {
    "D--",
    "C++",
    "C艹",
    "吸加加",
    "CPP",
  }

  return mapping[math.random(#mapping)]
end

local firstToUpper = vim.g.utils.firstToUpper
local FileType = {
  provider = function()
    local ft = vim.bo.filetype
    local custom = {
      ["qf"] = "quickfix",
      ["css"] = "CSS",
      ["scss"] = "SCSS",
      ["sass"] = "SASS",
      ["yaml"] = "YAML",
      ["toml"] = "TOML",
      ["json"] = "JSON",
      ["typescript"] = "TS",
      ["javascript"] = "JS",
      ["javascriptreact"] = "JSX",
      ["typescriptreact"] = "TSX",
      ["sh"] = "Shell",
      ["md"] = "Markdown",
      ["html"] = "HTML",
      ["cs"] = "C#",
      ["cpp"] = cpp_name(),
    }
    return custom[ft] or firstToUpper(ft)
  end,
  hl = function(self)
    return { fg = self.icon_color, bold = true }
  end,
}

local ReadOnly = {
  condition = function()
    return not vim.bo.modifiable or vim.bo.readonly
  end,
  provider = "  ",
  hl = { fg = "orange" },
}

local FileFormat = {
  init = function(self)
    self.fmt = vim.bo.fileformat
  end,
  condition = function(self)
    return self.fmt ~= 'unix'
  end,
  provider = function(self)
    return self.fmt:upper()
  end
}

local FileEncoding = {
  init = function(self)
    self.enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
  end,
  condition = function(self)
    return self.enc ~= 'utf-8'
  end,
  provider = function(self)
    return self.enc:upper()
  end
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
  FileName = utils.insert(FileNameBlock, FileName, ReadOnly, { provider = "%<" }),
  FileFormat = FileFormat,
  FileEncoding = FileEncoding,
  HelpFileName = HelpFileName,
  TerminalName = TerminalName,
}
