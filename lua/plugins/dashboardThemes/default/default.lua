local db = require("plugins.dashboardThemes.template")

local footer = db.config.footer
for _, k in ipairs(require("plugins.dashboardThemes.static.quotes").quote) do
  footer[#footer + 1] = k
end


db.preview.file_height = 8
db.preview.file_width = 60

db.config.footer = footer

return db
