-- ╭──────────────────────────────────────────────────────────╮
-- │                      Theme wrapper                       │
-- ╰──────────────────────────────────────────────────────────╯

local theme = "plugins.dashboardThemes."

local themes = {
    "default",
    "default",
    "default",
    "default",
    "default",
    "default",
    "default",
    "default",
    "fkunv",
    "rickroll"
}
local t = themes[math.random(#themes)]
math.randomseed(os.time())
return require(theme .. t .. '.' .. t)
