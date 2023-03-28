return {
  "rebelot/heirline.nvim",
  config = function()
    local cond = require("heirline.conditions")
    local utils = require("heirline.utils")
    local colors = vim.g.colors

    local ViMode = {
      init = function(self)
        self.mode = vim.fn.mode(1)
      end,
      static = {
        mode_names = {
          n = "N ",
          no = "N?",
          nov = "N?",
          noV = "N?",
          ["no\22"] = "N?",
          niI = "Ni",
          niR = "Nr",
          niV = "Nv",
          nt = "Nt",
          v = "V ",
          vs = "Vs",
          V = "V_",
          Vs = "Vs",
          ["\22"] = "^V",
          ["\22s"] = "^V",
          s = "S ",
          S = "S_",
          ["\19"] = "^S",
          i = "I ",
          ic = "Ic",
          ix = "Ix",
          R = "R ",
          Rc = "Rc",
          Rx = "Rx",
          Rv = "Rv",
          Rvc = "Rv",
          Rvx = "Rv",
          c = "C",
          cv = "Ex",
          r = "...",
          rm = "M ",
          ["r?"] = "?",
          ["!"] = "!",
          t = "T",
        },
        mode_colors = {
          n = "red",
          i = "green",
          v = "cyan",
          V = "cyan",
          ["\22"] = "cyan",
          c = "orange",
          s = "purple",
          S = "purple",
          ["\19"] = "purple",
          R = "orange",
          r = "orange",
          ["!"] = "red",
          t = "red",
        },
      },
      provider = function(self)
        return " %2(" .. self.mode_names[self.mode] .. "%)"
      end,
      hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = self.mode_colors[mode], bold = true }
      end,
      update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
          vim.cmd("redrawstatus")
        end),
      },
    }

    local FileIcon = {
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color =
            require("nvim-web-devicons").get_icon_color(
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
        if not cond.width_percent_below(#filename, 0.25) then
          filename = vim.fn.pathshorten(filename)
        end
        return filename
      end,
      hl = { fg = utils.get_highlight("Directory").fg },
    }

    local FileNameModifer = {
      hl = function()
        if vim.bo.modified then
          return { fg = "cyan", bold = true, force = true }
        end
      end,
    }

    local FileType = {
      provider = function()
        return string.upper(vim.bo.filetype)
      end,
      hl = { fg = utils.get_highlight("Type").fg, bold = true },
    }

    local FileNameBlock = {
      -- let's first set up some attributes needed by this component and it's children
      {
        init = function(self)
          self.filename = vim.api.nvim_buf_get_name(0)
        end,
      },
      FileIcon,
      utils.insert(FileNameModifer, FileName),
      { provider = "%<" },
    }
    require("heirline").load_colors(colors)
  end,
}
