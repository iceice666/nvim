local rickroll = [[
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
]]
local db = require("plugins.dashboardThemes.template")

local footer = db.config.footer
for _, k in ipairs(vim.split(rickroll, "\n", { trimempty = true })) do
  footer[#footer + 1] = k
end

db.config.footer = footer

db.preview.file_height = 23
db.preview.file_width = 50
return db
