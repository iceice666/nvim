return {
  "rebelot/heirline.nvim",
  event = "VeryLazy",
  cond = 1 ~= vim.g.vscode,
  config = function()
    local function req(modules)
      return require("plugins.heirline.components." .. modules)
    end

    table.unpack = table.unpack or unpack -- 5.1 compatibility

    local cond = require("heirline.conditions")
    local utils = require("heirline.utils")
    local Align = { provider = "%=" }
    local Space = { provider = " " }

    -- widget import
    local ViMode = utils.surround({ "█", "" }, "bg", { req("vimode") })
    local Git = req("git")
    local FileType = req("file").FileType
    local FileName = req("file").FileName
    local FileFormat = req("file").FileFormat
    local FileEncoding = req("file").FileEncoding
    local HelpFileName = req("file").HelpFileName
    local TerminalName = req("file").TerminalName
    local Diagnostics = req("lsp").Diagnostics
    local LspClients = req("lsp").LspClients
    -- local Snippets = req("lsp").Snippets
    local AiAssist = req("lsp").FittenCode
    local MacroRecoder = req("macro").MacroRecoder



    local ActiveStatusline = (function()
      local result = {}
      local left = {
        ViMode,
        FileName,
        Diagnostics,
        MacroRecoder,
      }

      local middle = {}

      local right = {
        -- Snippets,
        Git,
        AiAssist,
        LspClients,
        FileEncoding,
        FileFormat,
        FileType,
        Space,

      }

      local insert_between_items = vim.g.utils.insert_between_items
      insert_between_items(left, Space, result)
      table.insert(result, Align)
      insert_between_items(middle, Space, result)
      table.insert(result, Align)
      insert_between_items(right, Space, result)

      return result
    end)()

    local InactiveStatusline = {
      condition = cond.is_not_active,
      FileType,
      Space,
      FileName,
      Space,
      FileEncoding,
      Space,
      FileFormat,
      Space,
      Diagnostics,
      Align,
    }

    local SpecialStatusline = {
      condition = function()
        return cond.buffer_matches({
          buftype = { "nofile", "prompt", "help", "quickfix" },
          filetype = { "^git.*", "fugitive", "^neogit*" },
        })
      end,
      FileType,
      Space,
      HelpFileName,
      Align,
    }

    local TerminalStatusline = {
      condition = function()
        return cond.buffer_matches({ buftype = { "terminal" } })
      end,
      -- Quickly add a condition to the ViMode to only show it when buffer is active!
      { condition = cond.is_active, ViMode, Space },
      TerminalName,
      Align,
    }

    local StatusLines = {
      hl = function()
        if cond.is_active() then
          return "StatusLine"
        else
          return "StatusLineNC"
        end
      end,
      fallthrough = false,
      SpecialStatusline,
      TerminalStatusline,
      InactiveStatusline,
      ActiveStatusline,
    }

    require("heirline").load_colors(vim.g.utils.flatten(vim.g.colors))
    require("heirline").setup({ statusline = StatusLines })
  end,
}
