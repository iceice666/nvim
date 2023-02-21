local fkunv = [[
  and I'm happy to say that it's
  the exception rather than the rule and
  I'm also happy to very publicly point out
  that NVIDIA has been one of the worst
  trouble spot we've had with hardware manufacturers
  and that is really sad because that NVIDIA tries
  to sell chips a lot of chips into the Android Market
  and NVIDIA has been the single worst company we've ever dealt with

  so NVIDIA
  FUCK U

  [ Ref: https://www.youtube.com/watch?v=iYWzMvlj2RQ ]
  ]]

local db = require("plugins.dashboardThemes.template")

local footer = db.config.footer
for _, k in ipairs(vim.split(fkunv, "\n", { trimempty = true })) do
  footer[#footer + 1] = k
end

db.config.footer = footer

db.preview.file_height = 19
db.preview.file_width = 70
return db
