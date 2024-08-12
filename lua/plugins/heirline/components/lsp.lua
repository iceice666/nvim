local conditions = require "lua.heirline.conditions"
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
      self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,


    update = { "DiagnosticChanged", "BufLeave" },

    {
      condition = function(self)
        return self.errors + self.warnings + self.info + self.hints == 0
      end,

      provider = "󰔓 Ur code has no errors!",
      hl = { fg = "green" },
    },
    {
      condition = function(self)
        return self.errors > 0
      end,
      provider = function(self)
        return self.error_icon .. self.errors .. " "
      end,
      hl = { fg = "red" },
    },
    {
      condition = function(self)
        return self.errors == 0 and self.warnings > 0
      end,
      provider = function(self)
        return self.warn_icon .. self.warnings .. " "
      end,
      hl = { fg = "yellow" },
    },
    {
      condition = function(self)
        return self.errors == 0 and self.info > 0
      end,
      provider = function(self)
        return self.info_icon .. self.info .. " "
      end,
      hl = { fg = "sapphire" },
    },
    {
      condition = function(self)
        return self.errors == 0 and self.hints > 0
      end,
      provider = function(self)
        return self.hint_icon .. self.hints
      end,
      hl = { fg = "green" },
    },
  },

  LspClients = {
    condition = conditions.lsp_attached,
    update = { "LspAttach", "LspDetach" },
    hl = { fg = "maroon" },

    provider = function()
      local s = {}
      for _, v in pairs(vim.lsp.get_clients()) do
        if v.name ~= "copilot" then
          s[#s + 1] = v.name
        end
      end
      return " LSP:" .. table.concat(s, ", ")
    end,
  },

  -- Snippets = {
  --   -- check that we are in insert or select mode
  --   condition = function()
  --     return luasnip_ok or vim.tbl_contains({ "s", "i" }, vim.fn.mode())
  --         and (luasnip.in_snippet() or luasnip.expandable())
  --   end,
  --   provider = function()
  --     if luasnip_ok ~= true then
  --       return ""
  --     end
  --
  --     local forward = luasnip.expand_or_locally_jumpable() and "󰜵 " or ""
  --     local backward = (
  --           luasnip.expandable()
  --           or (luasnip.in_snippet() and luasnip.jumpable(-1))
  --         )
  --         and "󰜲 "
  --         or ""
  --
  --     return "󰈚 " .. backward .. forward
  --   end,
  --   hl = { fg = "red", bold = true },
  -- },

  Copilot = {
    condition = function()
      return require("copilot_status").enabled()
    end,
    provider = function()
      return " " .. require("copilot_status").status().status
    end,
    on_click = {
      callback = function()
        local status = require("copilot_status").status()
        vim.notify(status.messge, "info", {
          title = "Copilot: " .. status.status,
        })
      end,
      name = "heirline_copilot",
    },
    update = true,
    hl = { fg = "#6CC644" },
  },
}
