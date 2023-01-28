-- ╭──────────────────────────────────────────────────────────╮
-- │                      Theme wrapper                       │
-- ╰──────────────────────────────────────────────────────────╯

local theme = "plugins.dashboardThemes."

local themes = {
  -- "default",
  "fkunv"
}
local t = themes[math.random(#themes)]
math.randomseed(os.time())
return require(theme .. t .. '.' .. t)
