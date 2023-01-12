local dashboard = require("alpha.themes.dashboard")

require("alpha.term")
local configDir = vim.fn.stdpath("config")
local iconPath = configDir .. "/lua/static/icon.txt"


local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "Debug"
  b.opts.hl_shortcut = "DevIconC"
  return b
end

local terminal = {
  command = "cat " .. iconPath,
  width = 60,
  height = 11,

  opts = {
    redraw = true,
    window_config = {},
  },
  type = "terminal"
}

local version = vim.version()
version = "Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch

dashboard.section.buttons.val = {
  button("", "" .. version),
  button("f", "" .. " Find file", ":Telescope find_files <CR>"),
  button("n", "" .. " New file", ":enew <BAR> startinsert <CR>"),
  button("r", "" .. " Recent files", ":Telescope oldfiles <CR>"),
  button("g", "" .. " Find text", ":Telescope live_grep <CR>"),
  button("c", "" .. " Config", ":e $MYVIMRC <CR>"),
  button("l", "" .. " Lazy", ":Lazy<CR>"),
  button("q", "" .. " Quit", ":qa<CR>"),
}


vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

    --local now = os.date "%d-%m-%Y %H:%M:%S"

    local footer = " It's BETTER then v$c0dε, isn't it?"
    dashboard.section.footer.val = footer
    dashboard.section.footer.opts.hl = "DevIconBinaryGLTF"

    dashboard.section.buttons.val[1] = button("", "       " ..
      version .. "   " .. stats.loaded .. " plugins | " .. ms .. "ms")

    pcall(vim.cmd.AlphaRedraw)
  end,
})




dashboard.opts = {
  layout = {
    { type = "padding", val = 5 },
    dashboard.section.header,
    { type = "padding", val = 10 },
    dashboard.section.buttons,
    dashboard.section.footer,
  },
  opts = {
    margin = 5,
  },
}

if vim.o.filetype == "lazy" then
  -- close and re-open Lazy after showing alpha
  vim.notify("Missing plugins installed!", vim.log.levels.INFO, { title = "lazy.nvim" })
  vim.cmd.close()
  require("alpha").setup(dashboard.opts)
  require("lazy").show()
else
  require("alpha").setup(dashboard.opts)
end
