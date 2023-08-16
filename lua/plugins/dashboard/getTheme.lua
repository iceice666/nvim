-- ╭──────────────────────────────────────────────────────────╮
-- │                      Theme wrapper                       │
-- ╰──────────────────────────────────────────────────────────╯

local theme = "plugins.dashboard.themes."

local themes = {
  "default",
  "default",
  "default",
  "default",
  "default",
  "default",
  "fozhu",
  "fozhu",
  "fkunv",
  "rickroll",
}

math.randomseed(os.time())
local themeName = themes[math.random(#themes)]
local cfg = require(theme .. themeName)
local db = require("plugins.dashboard.template")
db.config.header = db.config.header(cfg.header)
db.config.footer = db.config.footer(cfg.footer)

return db
