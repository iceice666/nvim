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


  local rickroll = [[
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
]]

  for _, k in ipairs(vim.split(rickroll, "\n", { trimempty = true })) do
    footer[#footer + 1] = k
  end
  return footer
end

local themeDir = vim.fn.stdpath("config") .. "/lua/plugins/dashboardThemes/rickroll/"

db.config.footer = footer()

db.preview = {
  file_width = 50,
  file_height = 26,
  file_path = themeDir .. "icon.txt",
  command = db.preview.command,
}
return db
