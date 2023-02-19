vim.g.mapleader = " "

local opt = vim.opt

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.number = true
--opt.relativenumber = true

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = true
opt.incsearch = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true

opt.showmode = false

opt.swapfile = false
opt.backup = false
opt.writebackup = false

opt.autoread = true
vim.bo.autoread = true

opt.signcolumn = "yes"
opt.list = true
-- opt.listchars:append "space:⋅"
-- opt.listchars:append "eol:↴"

vim.cmd("set formatoptions-=cro")

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

opt.mouse:append("a")

opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 300,
    })
  end,
})
