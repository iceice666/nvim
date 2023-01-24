local db = require("dashboard")


db.header_pad = 0
-- header
db.preview_command = "cat | lolcat -F 0.2"
db.preview_file_path = vim.fn.stdpath("config") .. "/lua/static/icon.txt"

db.preview_file_width = 60
db.preview_file_height = 11


-- buttons

local shortcuts = {}
local labels = {}
local button = function(shortcut, icon, label, action)
  shortcut = shortcut or nil
  icon = icon or nil
  label = label or nil
  action = action or nil

  shortcuts[#shortcuts + 1] = { key = shortcut, action = action }
  labels[#labels + 1] = icon .. "  " .. label .. string.rep(" ", 47 - #label)
end

button("n", "ﱐ", "New file", function() vim.cmd("DashboardNewFile") end)
button("f", "", "Find file", function() vim.cmd("Telescope find_files") end)
button("r", "󱋡", "Recent files", function() vim.cmd("Telescope oldfiles") end)
button("L", "", "Lazy", function() vim.cmd("Lazy") end)
button("P", "", "Lazy profile", function() vim.cmd("Lazy profile") end)
button("C", "", "Close dashboard", function() vim.cmd("DashboardNewFile"); vim.cmd("bd %"); end)
button("q", "", "Quit", function() vim.cmd("qa") end)
-- string padding

local _btn = {}
for i, k in ipairs(labels) do
  _btn[#_btn + 1] = {
    desc = k,
    action = shortcuts[i].action,
    shortcut = shortcuts[i].key
  }
end
db.custom_center = _btn



db.footer_pad = 10

-- footer
local version = vim.version()
version = "Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch
local stats = require("lazy").stats()
local loaded = stats.loaded
local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

db.custom_footer = { version, loaded .. " plugins in " .. ms .. "ms" }

-- keymaps
local mapx = require("core.keymap").mapx
for _, k in ipairs(shortcuts) do
  mapx.nnoremap(k.key, k.action, { silent = true, ft = "dashboard" })
  mapx.nnoremap(k.key, k.action, { silent = true, ft = "dashboardpreview" })
end


-- start
if vim.bo.filetype == "lazy" then
  vim.cmd("q")
end
if vim.bo.filetype == "neo-tree" then
  vim.cmd("NeoTreeClose")
end
vim.cmd("Dashboard")
vim.cmd("echo ' '")
