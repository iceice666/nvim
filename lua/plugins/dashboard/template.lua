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

  button("r", "󱋡 ", "Restore Session", "NeovimProjectLoadRecent")
  button("p", " ", "Open projects", "Telescope neovim-project discover")
  button("c", "󱎘 ", "Close dashboard", "enew ")
  button("m", "󰍦 ", "Messages", "Noice")
  button("l", " ", "Lazy profile", "Lazy profile")
  if vim.g.neovide ~= true then
    button("R", "󰑓 ", "Restart nvim", "cq")
  end
  button("q", "󰗼 ", "Quit", "qa")

  return buttons
end

local array_combine = function(table, text)
  table = table or {}
  text = text or {}

  if type(text) == "string" then
    text = vim.split(text, "\n", { trimempty = true })
  elseif type(text) ~= "table" then
    return table
  end

  for _, k in ipairs(text) do
    table[#table + 1] = k
  end

  return table
end

local header = function(text)
  local header = array_combine({}, text)

  return header
end

local footer = function(text)
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

  return array_combine(footer, text)
end

return {
  theme = "doom",
  config = {
    packages = { enable = false },
    shortcut = center(),
    center = center(),
    header = header,
    footer = footer,
  },
  hide = {
    tabline = true,
    statusline = true,
  },
}
