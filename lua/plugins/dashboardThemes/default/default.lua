local colors = require("core.colors")
local shl = vim.api.nvim_set_hl
shl(0, "DashboardDesc", { fg = colors.bluegreen() })
shl(0, "DashboardKey", { fg = colors.gold() })


local center = function()
  local buttons = {}
  local button = function(shortcut, icon, label, action, hl)
    shortcut = shortcut or nil
    icon = icon or nil
    label = label or nil
    action = action or nil
    hl = hl or "DashboardShotCut"
    buttons[#buttons + 1] = {
      desc = icon .. " " .. label .. string.rep(" ", 47 - #label),
      desc_hl = "DashboardDesc",
      action = action,
      key = shortcut,
      key_hl = "DashboardKey"
    }
  end

  button("R", "ﮦ", "Restore session", "lua require('dashboard'):new_file(); vim.cmd('RestoreSession')")
  button("W", "", "Workspaces", "Telescope workspaces")
  button("r", "󱋡", "Recent files", "Telescope oldfiles")
  button("L", "", "Lazy", "Lazy")
  button("P", "", "Lazy profile", "Lazy profile")
  button("C", "", "Close dashboard", "lua require('dashboard'):new_file()")
  button("q", "", "Quit", "qa")

  return buttons
end

local footer = function()
  local version = vim.version()
  if version ~= nil then
    version = "Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch
  end

  local stats = require("lazy").stats()
  local loaded = stats.loaded
  local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
  local footer = {
    '',
    version,
    loaded .. " plugins in " .. ms .. "ms"
    , ''
  }

  for _, k in ipairs(require("plugins.dashboardThemes.static.quotes").quote) do
    footer[#footer + 1] = k
  end
  return footer
end

local themePath = vim.fn.stdpath("config") .. "/lua/plugins/dashboardThemes/"

local preview = function()
  return {
    command = "cat | bash " .. themePath .. "static/animated_lolcat.sh",
    file_path = themePath .. "default/icon.txt",
    file_height = 11,
    file_width = 60,
  }
end

return {
  theme = 'doom',
  preview = preview(),
  config = {
    packages = { enable = false },
    shortcut = center(),
    center = center(),
    footer = footer()
  },
  hide = {
    statusline = true,
    tabline = true,
  }
}
