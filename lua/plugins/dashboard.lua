local db = require("dashboard")


db.header_pad = 0
-- header
db.preview_command = "cat | lolcat -F 0.2"
db.preview_file_path = vim.fn.stdpath("config") .. "/lua/static/icon.txt"

db.preview_file_width = 60
db.preview_file_height = 11


-- buttons
local km = require 'mapx'.setup { global = "force", }

local setkey = function(key, action)
  km.nnoremap(key, action, { silent = true, ft = "dashboard" })
end

local shortcuts = {}
local labels = {}
local button = function(shortcut, icon, label, action)
  shortcut = shortcut or nil
  icon = icon or nil
  label = label or nil
  action = action or nil

  shortcuts[#shortcuts + 1] = { key = shortcut, action = action }
  labels[#labels + 1] = icon .. "  " .. label
end

button("n", "", "New file", "DashboardNewFile")
button("f", "", "Find file", "Telescope find_files")
button("r", "", "Recent files", "Telescope oldfiles")
button("g", "", "Lazygit", "LazyGit")
button("l", "", "Lazy", "Lazy")
button("q", "", "Quit", "qa")

-- string padding
local _sl = 50
for i, k in ipairs(labels) do
  labels[i] = k .. string.rep(" ", _sl - #k)
end

local _btn = {}
for i, k in ipairs(labels) do
  _btn[#_btn + 1] = {
    desc = k,
    action = shortcuts[i].action,
    shortcut = shortcuts[i].key
  }
end
db.custom_center = _btn

-- shortcut
for _, k in ipairs(shortcuts) do
  setkey(
    k.key,
    function()
      vim.cmd(k.action)
    end
  )
end

db.footer_pad = 10

-- footer
local version = vim.version()
version = "Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch
local stats = require("lazy").stats()
local loaded = stats.loaded
local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

db.custom_footer = { version, loaded .. " plugins in " .. ms .. "ms" }
