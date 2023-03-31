local luasnip = require("luasnip")
return {
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
    hl = { fg = "purple" },
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
    highlight = {
      "red",
    },

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
          and (luasnip.expand_or_jumpable() or luasnip.jumpable( -1))
    end,
    provider = function()
      local forward = luasnip.expand_or_jumpable() and " " or ""
      local backward = luasnip.jumpable( -1) and " " or ""
      return " " .. backward .. forward
    end,
    hl = { fg = "red", bold = true },
  },
}
