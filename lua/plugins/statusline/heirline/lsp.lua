local luasnip = require("luasnip")
local conditions = require("heirline.conditions")

return {

  Diagnostics = {

    condition = conditions.has_diagnostics,

    static = {
      error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
      warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
      info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
      hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
    },

    init = function(self)
      self.errors =
          #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      self.warnings =
          #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      self.hints =
          #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      self.info =
          #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    update = { "DiagnosticChanged", "BufEnter" },

    {
      provider = "![",
    },
    {
      provider = function(self)
        return " " .. self.error_icon .. self.errors .. " "
      end,
      hl = { fg = "diag_error" },
    },
    {
      provider = function(self)
        return self.warn_icon .. self.warnings .. " "
      end,
      hl = { fg = "diag_warn" },
    },
    {
      provider = function(self)
        return self.info_icon .. self.info .. " "
      end,
      hl = { fg = "diag_info" },
    },
    {
      provider = function(self)
        return self.hint_icon .. self.hints
      end,
      hl = { fg = "diag_hint" },
    },
    {
      provider = "]",
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
