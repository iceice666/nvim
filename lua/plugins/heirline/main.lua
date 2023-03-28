local function req(modules)
  return require("plugins.heirline." .. modules)
end

return {
  "rebelot/heirline.nvim",
  config = function()
    local cond = require("heirline.conditions")
    local utils = require("heirline.utils")
    local Align = { provider = "%=" }
    local Space = { provider = " " }

    -- widget import
    local ViMode = req("vimode")
    local FileType = req("file").FileType
    local FileName = req("file").FileName
    local Ruler = req("ruler").Ruler
    local ScrollBar = req("ruler").ScrollBar
    local Git = req("git").Git
    local NullLsClients = req("lsp").NullLsClients
    local LspClients = req("lsp").LspClients

    ViMode = utils.surround({ "█", "" }, "bg_visual", { ViMode })

    local DefaultStatusline = {
      ViMode,
      Space,
      FileName,
      Space,
      Git,
      ------------------------------------------------
      Align,
      ------------------------------------------------
      Align,
      ------------------------------------------------
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
    local StatusLines = {
      hl = function()
        if cond.is_active() then
          return "StatusLine"
        else
          return "StatusLineNC"
        end
      end,
      fallthrough = false,
      -- SpecialStatusline,
      -- TerminalStatusline,
      -- InactiveStatusline,
      DefaultStatusline,
    }

    require("heirline").load_colors(require("core.utils").flatten(vim.g.colors))
    require("heirline").setup({ statusline = StatusLines })
  end,
}
