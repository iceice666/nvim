local luasnip = require("luasnip")

return {

  Diagnostics = {
    condition = function()
      return #vim.lsp.get_active_clients({ bufnr = 0 }) > 0
    end,

    static = {
      error_icon = " ",
      warn_icon = " ",
      hint_icon = " ",
      info_icon = " ",
    },

    init = function(self)
      self.errors =
          vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      self.warnings =
          vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      self.hints =
          vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      self.info =
          vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    {
      update = { "DiagnosticChanged", "BufEnter" },
      condition = function(self)
        return #self.errors + #self.warnings + #self.info + #self.hints == 0
      end,

      provider = "󰔓 Good job! Ur code has no bugs!",
      hl = { fg = "green" },
    },

    {
      update = { "DiagnosticChanged", "BufEnter" },
      condition = function(self)
        return #self.errors > 0
      end,
      provider = function(self)
        return self.error_icon .. #self.errors .. " "
      end,
      hl = { fg = "red" },
    },
    {
      update = { "CursorMoved", "CursorMovedI" },
      condition = function(self)
        return #self.errors > 0
      end,
      provider = function(self)
        if #self.errors == 1 then
          return self.errors[1].message .. " "
        else
          local cursor = vim.api.nvim_win_get_cursor(0)[1]
          local offset = 1145141919810 -- tbh, can a human-readable file has so many lines in real world?
          local closest = 1
          for i, n in ipairs(self.errors) do
            local current_offset = math.abs(cursor - n.lnum)
            if current_offset < offset then
              offset = current_offset
              closest = i
            elseif current_offset > offset then
              break
            end
          end

          return self.errors[closest].message .. " "
        end
      end,
      hl = { fg = "red" },
    },
    {
      update = { "DiagnosticChanged", "BufEnter" },
      condition = function(self)
        return #self.errors == 0 and #self.warnings > 0
      end,
      provider = function(self)
        return self.warn_icon .. #self.warnings .. " "
      end,
      hl = { fg = "yellow" },
    },
    {
      update = { "DiagnosticChanged", "BufEnter" },
      condition = function(self)
        return #self.errors == 0 and #self.info > 0
      end,
      provider = function(self)
        return self.info_icon .. #self.info .. " "
      end,
      hl = { fg = "sapphire" },
    },
    {
      update = { "DiagnosticChanged", "BufEnter" },
      condition = function(self)
        return #self.errors == 0 and #self.hints > 0
      end,
      provider = function(self)
        return self.hint_icon .. #self.hints
      end,
      hl = { fg = "green" },
    },
  },

  NullLsClients = {
    provider = function()
      local sources = {}
      local ft = vim.bo.filetype
      for _, v in pairs(require("null-ls").get_sources()) do
        if v.filetypes[ft] == true or v.filetypes["_all"] == true then
          sources[#sources + 1] = v.name
        end
      end
      if sources == {} then
        return " null-ls: no clients"
      end

      return " null-ls: " .. table.concat(sources, ", ")
    end,
    hl = { fg = "mauve" },
    on_click = {
      callback = function()
        vim.cmd("NullLsInfo")
      end,
      name = "heirline_null_ls",
    },
  },
  LspClients = {
    condition = function()
      local tbl = {
        ["dashboard"] = true,
        [""] = true,
      }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    hl = { fg = "maroon" },

    provider = function()
      local s = {}
      for _, v in pairs(vim.lsp.get_active_clients()) do
        if v.name ~= "null-ls" then
          s[#s + 1] = v.name
        end
      end
      return " LSP:" .. table.concat(s, ", ")
    end,
  },
  Snippets = {
    -- check that we are in insert or select mode
    condition = function()
      return vim.tbl_contains({ "s", "i" }, vim.fn.mode())
          and (luasnip.expand_or_jumpable() or luasnip.jumpable(-1))
    end,
    provider = function()
      local forward = luasnip.expand_or_jumpable() and " " or ""
      local backward = luasnip.jumpable(-1) and " " or ""
      return " " .. backward .. forward
    end,
    hl = { fg = "red", bold = true },
  },
  CmpIM = {
    provider = function()
      if vim.g.isIMEnable then
        return "  Pinyin: actived"
      else
        return ""
      end
    end,
    hl = { fg = "red", bold = true },
    update = true,
  },
}
