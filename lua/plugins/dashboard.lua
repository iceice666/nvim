local db = require("dashboard")
local static = vim.fn.stdpath("config") .. "/lua/plugins/static/"

db.preview_command = 'cat | lolcat -F 0.2'
db.preview_file_path = static .. "welcome.txt"
db.preview_file_height = 6
db.preview_file_width = 60
