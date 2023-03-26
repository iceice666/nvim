local colors = vim.g.colors
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
      desc = icon .. "  " .. label .. string.rep(" ", 47 - #label),
      desc_hl = "DashboardDesc",
      action = action,
      key = shortcut,
      key_hl = "DashboardKey",
    }
  end

  button("r", "󰉋", "Restore Session", "enew | RestoreSession")
  button("w", "", "Change workspaces", "Telescope workspaces")
  button("R", "󱋡", "Recent files", "Telescope oldfiles")
  button("c", "", "Close dashboard", "enew | bdelete")
  button("m", "", "Messages", "Noice")
  button("p", "", "Lazy profile", "Lazy profile")
  button("q", "󰗼", "Quit", "qa")

  return buttons
end

local footer = function()
  local version = vim.version()
  if version ~= nil then
    version = "Neovim v"
        .. version.major
        .. "."
        .. version.minor
        .. "."
        .. version.patch
  end

  local stats = require("lazy").stats()
  local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
  local footer = {
    "",
    version .. " started in " .. ms .. "ms",
    "loaded: "
    .. stats.loaded
    .. ", lazy-loaded: "
    .. stats.count - stats.loaded,
    "",
  }
  return footer
end

return {
  theme = "doom",
  preview = {
    file_width = nil,
    file_height = nil,
    command = "cat | bash "
    .. vim.fn.stdpath("config")
    .. "/lua/plugins/dashboardThemes/static/animated_lolcat.sh",
    file_path = nil,
  },
  config = {
    packages = { enable = false },
    shortcut = center(),
    center = center(),
    footer = footer(),
  },
  hide = {
    tabline = true,
    statusline = true,
  },
}
