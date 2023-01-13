vim.g.mapleader = " "
local mapx = require 'mapx'.setup {}

local opt = { silent = true }

-- undo & redo

mapx.nnoremap("U", ":later<cr>", opt)

-- Select all
mapx.nnoremap("<c-a>", "gg<s-v>G", opt)
mapx.vnoremap("<c-a>", "gg<s-v>G", opt)

-- Window split
mapx.nnoremap("Wl", ":set splitright<CR>:vsplit<CR>", opt)
mapx.nnoremap("Wh", ":set nosplitright<CR>:vsplit<CR>", opt)
mapx.nnoremap("Wk", ":set nosplitbelow<CR>:split<CR>", opt)
mapx.nnoremap("Wj", ":set splitbelow<CR>:split<CR>", opt)

-- Cursor jumping
mapx.nnoremap("L", "$", opt)
mapx.nnoremap("H", "^", opt)
mapx.nnoremap("J", "9j", opt)
mapx.nnoremap("K", "9k", opt)

-- File
mapx.nnoremap("<leader>w", ":w<cr>", opt)

-- nohls
mapx.nnoremap("<leader>/", ":nohls<cr>", opt)

-- Quit
mapx.nnoremap("<leader>Q", ":qa<cr>", opt)

-- Clean cmdline
mapx.nnoremap("<leader><leader>", ":echo ' '<cr>", opt)

-- ======================= PLUGINS MAPPINGS ===========================
-- Dashboard
mapx.nnoremap("<leader>d", ":Dashboard<cr>", opt)

-- File tree
mapx.nnoremap("<leader>e", ":NvimTreeToggle<cr>", opt)

-- Undo tree
mapx.nnoremap("<leader>u", ":UndotreeToggle<cr>", opt)

-- Alternate toggler
mapx.nnoremap("<leader>ta", ":ToggleAlternate<cr>", opt)

-- format
mapx.nnoremap("<leader>f", ":lua vim.lsp.buf.format({ bufnr = bufnr })<cr>", opt)

-- LazyGit
mapx.nnoremap("<leader>lg", ":LazyGit<cr>", opt)

-- bufferline
mapx.nnoremap("<leader>1", ":BufferLineGoToBuffer 1<cr>", opt)
mapx.nnoremap("<leader>2", ":BufferLineGoToBuffer 2<cr>", opt)
mapx.nnoremap("<leader>3", ":BufferLineGoToBuffer 3<cr>", opt)
mapx.nnoremap("<leader>4", ":BufferLineGoToBuffer 4<cr>", opt)
mapx.nnoremap("<leader>5", ":BufferLineGoToBuffer 5<cr>", opt)
mapx.nnoremap("<leader>6", ":BufferLineGoToBuffer 6<cr>", opt)
mapx.nnoremap("<leader>7", ":BufferLineGoToBuffer 7<cr>", opt)
mapx.nnoremap("<leader>8", ":BufferLineGoToBuffer 8<cr>", opt)
mapx.nnoremap("<leader>9", ":BufferLineGoToBuffer 9<cr>", opt)

-- buffer close
mapx.nnoremap({ "<leader>bc", "<leader>q" }, ":bdelete %<cr>", opt)
mapx.nnoremap("<leader>bp", ":BufferLinePickClose<cr>", opt)
mapx.nnoremap("<leader>bo", ":BufferLineCloseLeft<cr>:BufferLineCloseRight<cr>", opt)
