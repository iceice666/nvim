-- ╭──────────────────────────────────────────────────────────╮
-- │                      Theme wrapper                       │
-- ╰──────────────────────────────────────────────────────────╯

local theme = "plugins.dashboardThemes."

local themes = {
  "default",
  "default",
  "default",
  "fkunv",
  "rickroll"
}

math.randomseed(os.time())
local themeName = themes[math.random(#themes)]
local db = require(theme .. themeName .. '.' .. themeName)


if db.preview.file_path == nil then
  db.preview.file_path = vim.fn.stdpath("config") .. "/lua/plugins/dashboardThemes/" .. themeName .. "/icon.txt"
end

return db
