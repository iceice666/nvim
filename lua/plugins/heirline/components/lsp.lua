return {

  Diagnostics = {
    condition = function()
      return #vim.lsp.get_clients({ bufnr = 0 }) > 0
    end,

    on_click = {
      callback = function()
        vim.cmd("Trouble document_diagnostics")
      end,
      name = "heirline_diagnostics",
    },

    static = {
      error_icon = " ",
      warn_icon = " ",
      hint_icon = " ",
      info_icon = " ",
    },

    init = function(self)
      self.error_table =
          vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      self.errors = #self.error_table
      self.warnings =
          #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      self.hints =
          #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      self.info =
          #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    {
      update = { "DiagnosticChanged", "BufLeave" },
      condition = function(self)
        return self.errors + self.warnings + self.info + self.hints == 0
      end,

      provider = "󰔓 Ur code has no errors!",
      hl = { fg = "green" },
    },

    {
      update = { "DiagnosticChanged", "BufLeave" },
      condition = function(self)
        return self.errors > 0
      end,
      provider = function(self)
        return self.error_icon .. self.errors .. " "
      end,
      hl = { fg = "red" },
    },

    -- {
    --   update = { "CursorMoved", "CursorMovedI" },
    --   condition = function(self)
    --     return self.errors > 0
    --   end,
    --   provider = function(self)
    --     -- Iterate the error table and find the closest one
    --     if self.errors == 1 then
    --       return self.error_table[1].message .. " "
    --     else
    --       local cursor = vim.api.nvim_win_get_cursor(0)[1]
    --       local offset_limit = 1145141919810 -- tbh, can a file has so many lines?
    --       local closest = 0
    --       for i, n in ipairs(self.error_table) do
    --         local current_offset = math.abs(cursor - (n.lnum + 1))
    --         if current_offset > offset_limit then
    --           break
    --         else
    --           offset_limit = current_offset
    --           closest = i
    --         end
    --       end
    --
    --       local msg = vim.split(
    --         self.error_table[closest].message,
    --         [[^@]],
    --         { plain = true, trimempty = true }
    --       )
    --
    --       return msg[1] .. " "
    --     end
    --   end,
    --   hl = { fg = "red" },
    -- },

    {
      update = { "DiagnosticChanged", "BufLeave" },
      condition = function(self)
        return self.errors == 0 and self.warnings > 0
      end,
      provider = function(self)
        return self.warn_icon .. self.warnings .. " "
      end,
      hl = { fg = "yellow" },
    },
    {
      update = { "DiagnosticChanged", "BufLeave" },
      condition = function(self)
        return self.errors == 0 and self.info > 0
      end,
      provider = function(self)
        return self.info_icon .. self.info .. " "
      end,
      hl = { fg = "sapphire" },
    },
    {
      update = { "DiagnosticChanged", "BufLeave" },
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

  CmpIM = {
    provider = function()
      if vim.g.isImEnable then
        return "  Pinyin: actived"
      else
        return ""
      end
    end,
    hl = { fg = "red", bold = true },
    update = true,
  },

  Copilot = {
    condition = function()
      return require("copilot_status").enabled()
    end,
    provider = function()
      return require("copilot_status").status_string()
    end,
    update = true,
    hl = { fg = "#6CC644" },
  },
}
