vim.g.mapleader = " "
vim.g.maplocalleader = '\\'

local opt = vim.opt

-- TODO: Add option comments

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.number = true
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = true
opt.incsearch = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true -- Round indent
opt.expandtab = true  -- Use spaces instead of tabs
opt.smartindent = true
opt.autoindent = true
opt.ignorecase = true -- Ignore case
opt.smartcase = true

opt.showmode = false

opt.swapfile = false
opt.backup = false
opt.writebackup = false

opt.autoread = true
vim.bo.autoread = true

opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

opt.signcolumn = "yes"
opt.list = true
opt.formatoptions = "jqlnt"
opt.cursorline = true
opt.colorcolumn = "80"
opt.termguicolors = true
opt.cmdheight = 2
opt.whichwrap = "b,s,<,>,[,],h,l"
opt.wildmenu = true
opt.showtabline = 2
vim.o.shortmess = vim.o.shortmess .. "c"
opt.pumheight = 10
opt.background = "dark"
opt.hidden = true

if not vim.env.SSH_TTY then
  opt.clipboard = "unnamedplus"
end

opt.sessionoptions = {
  "buffers",
  "curdir",
  "folds",
  "help",
  "tabpages",
  "winsize",
  "winpos",
  "terminal",
  "localoptions",
}
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

opt.undofile = true
opt.undolevels = 10000

if vim.fn.has("win32") == 1 then
  vim.g.sqlite_clib_path = vim.fn.stdpath("config") .. "/assets/sqlite3.dll"
end

vim.cmd("set ff=unix")
