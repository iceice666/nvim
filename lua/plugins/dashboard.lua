local db = require("dashboard")


db.header_pad = 0
-- header
db.preview_command = "cat | lolcat -F 0.2"
db.preview_file_path = vim.fn.stdpath("config") .. "/lua/static/icon.txt"

db.preview_file_width = 60
db.preview_file_height = 11


-- buttons

local mapx = require("core.keymap").mapx
local buttons = {}
local button = function(shortcut, icon, label, action)
  shortcut = shortcut or nil
  icon = icon or nil
  label = label or nil
  action = action or nil

  buttons[#buttons + 1] = {
    desc = icon .. "  " .. label .. string.rep(" ", 47 - #label),
    action = action,
    shortcut = shortcut
  }

  mapx.nnoremap(shortcut, action, { silent = true, ft = "dashboard" })
  mapx.nnoremap(shortcut, action, { silent = true, ft = "dashboardpreview" })
  db.custom_center = buttons
end

button("R", "ﮦ", "Restore session", function() vim.cmd("RestoreSession"); end)
button("n", "ﱐ", "New file", function() vim.cmd("RestoreSession"); vim.cmd("DashboardNewFile"); end)
button("f", "", "Find file", function() vim.cmd("Telescope find_files"); end)
button("r", "󱋡", "Recent files", function() vim.cmd("Telescope oldfiles"); end)
button("L", "", "Lazy", function() vim.cmd("Lazy") end)
button("P", "", "Lazy profile", function() vim.cmd("Lazy profile") end)
button("q", "", "Quit", function() vim.cmd("qa") end)


db.footer_pad = 1

-- footer
local version = vim.version()
version = "Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch
local stats = require("lazy").stats()
local loaded = stats.loaded
local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)


local footer = { version, loaded .. " plugins in " .. ms .. "ms", '' }

for _, k in ipairs(require("static.quotes").quote) do
  footer[#footer + 1] = k
end

db.custom_footer = footer

-- start
if vim.bo.filetype == "lazy" then
  vim.cmd("q")
end

pcall(vim.cmd, "NeoTreeClose")

vim.cmd("Dashboard")
vim.cmd("echo ' '")
