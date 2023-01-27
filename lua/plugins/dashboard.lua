require("dap").repl.close()

local colors = require("core.colors")
local hl = vim.api.nvim_set_hl
hl(0, "DashboardDesc", { fg = colors.bluegreen() })
hl(0, "DashboardKey", { fg = colors.gold() })

local db = {}
db.theme = 'doom'

local center = function()

  local buttons = {}
  local button = function(shortcut, icon, label, action, hl)
    shortcut = shortcut or nil
    icon = icon or nil
    label = label or nil
    action = action or nil
    hl = hl or "DashboardShotCut"

    if db.theme == 'hyper' then
      buttons[#buttons + 1] = {
        desc = icon .. " " .. label,
        action = action,
        key = shortcut,
        group = hl
      }
    elseif db.theme == 'doom' then
      buttons[#buttons + 1] = {
        desc = icon .. " " .. label .. string.rep(" ", 47 - #label),
        desc_hl = "DashboardDesc",
        action = action,
        key = shortcut,
        key_hl = "DashboardKey"
      }
    end
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
  version = "Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch

  local stats = require("lazy").stats()
  local loaded = stats.loaded
  local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
  local footer = {
    '',
    version,
    loaded .. " plugins in " .. ms .. "ms"
    , ''
  }

  for _, k in ipairs(require("static.quotes").quote) do
    footer[#footer + 1] = k
  end
  return footer
end



db.preview = {
  command = "cat | bash " .. vim.fn.stdpath("config") .. "/lua/static/animated_lolcat.sh",
  file_path = vim.fn.stdpath("config") .. "/lua/static/icon.txt",
  file_height = 11,
  file_width = 60,
}

db.config = {
  packages = { enable = false },
  shortcut = center(),
  center = center(),
  footer = footer()
}

db.hide = {
  statusline = true,
  tabline = true,
}


require("dashboard").setup(db)

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "",
  callback = function()
    vim.cmd("set showtabline=2")
  end,
})
