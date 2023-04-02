local function req(modules)
  return require("plugins.statusline.heirline." .. modules)
end

return {
  "rebelot/heirline.nvim",
  event = "BufReadPost",
  config = function()
    local cond = require("heirline.conditions")
    local utils = require("heirline.utils")
    local Align = { provider = "%=" }
    local Space = { provider = " " }

    -- widget import
    local ViMode = req("vimode")
    local Git = req("git")
    local FileType = req("file").FileType
    local FileName = req("file").FileName
    local HelpFileName = req("file").HelpFileName
    local TerminalName = req("file").TerminalName
    local Ruler = req("ruler").Ruler
    local ScrollBar = req("ruler").ScrollBar
    local DAPMessages = req("dap").DAPMessages
    local NullLsClients = req("lsp").NullLsClients
    local LspClients = req("lsp").LspClients
    local Snippets = req("lsp").Snippets
    local MacroRec = req("misc").MacroRec

    ViMode = utils.surround({ "█", "" }, "bg_visual", { ViMode })

    local ActiveStatusline = {
      ViMode,
      Space,
      FileName,
      Space,
      MacroRec,
      Space,
      DAPMessages,
      Space,
      ------------------------------------------------
      Align,
      ------------------------------------------------
      Align,
      ------------------------------------------------
      Snippets,
      Space,
      -- Space,
      Git,
      Space,
      LspClients,
      Space,
      NullLsClients,
      Space,
      Ruler,
      Space,
      FileType,
      Space,
      ScrollBar,
    }

    local InactiveStatusline = {
      condition = cond.is_not_active,
      FileType,
      Space,
      FileName,
      Space,
      DAPMessages,
      Align,
    }

    local SpecialStatusline = {
      condition = function()
        return cond.buffer_matches({
          buftype = { "nofile", "prompt", "help", "quickfix" },
          filetype = { "^git.*", "fugitive" },
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
      hl = { bg = "dark_red" },
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

    require("heirline").load_colors(require("core.utils").flatten(vim.g.colors))
    require("heirline").setup({ statusline = StatusLines })
  end,
}
