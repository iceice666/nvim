local db = require("plugins.dashboardThemes.default.default")

local footer = function()
  local version = vim.version()
  if version ~= nil then
    version = "Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch
  end

  local stats = require("lazy").stats()
  local loaded = stats.loaded
  local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
  local footer = {
    '',
    version,
    loaded .. " plugins in " .. ms .. "ms"
    , ''
  }


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

  (媽的垃圾nv 搞個顯卡直通搞到連tty都進不去 真服了妳個閉源驅動 還要搞一堆逆向)
  ]]

  for _, k in ipairs(vim.split(fkunv, "\n", { trimempty = true })) do
    footer[#footer + 1] = k
  end
  return footer
end

local themeDir = vim.fn.stdpath("config") .. "/lua/plugins/dashboardThemes/fkunv/"

db.config.footer = footer()

db.preview = {
  file_width = 70,
  file_height = 15,
  file_path = themeDir .. "icon.txt",
  command = "lolcat ",
}
return db
