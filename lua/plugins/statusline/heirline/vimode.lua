return {
  init = function(self)
    self.mode = vim.api.nvim_get_mode().mode
  end,
  static = {
    mode_names = {
      n = "N ",
      no = "No",
      nov = "No",
      noV = "No",
      ["no\22"] = "No",
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
      t = "T ",
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
      t = "green",
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
