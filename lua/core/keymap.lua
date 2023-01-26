vim.g.mapleader = " "
local mapx = require 'mapx'.setup { whichkey = true }

mapx.group({ silent = true }, function()


  mapx.vnoremap("<c-j>", ":m '>+1<cr>gv=gv")
  mapx.vnoremap("<c-k>", ":m '<-2<cr>gv=gv")

  -- undo & redo
  mapx.nnoremap("U", "<cmd>later<cr>", "Redo")

  -- Select all
  mapx.nnoremap("<c-a>", "gg<s-v>G", "Select all")
  mapx.vnoremap("<c-a>", "gg<s-v>G", "Select all")

  -- Window split
  mapx.nnoremap("Wl", "<cmd>set splitright<CR>:vsplit<CR>")
  mapx.nnoremap("Wh", "<cmd>set nosplitright<CR>:vsplit<CR>")
  mapx.nnoremap("Wk", "<cmd>set nosplitbelow<CR>:split<CR>")
  mapx.nnoremap("Wj", "<cmd>set splitbelow<CR>:split<CR>")

  -- Cursor jumping
  mapx.nnoremap("L", "$")
  mapx.nnoremap("H", "^")
  mapx.nnoremap("J", "10j")
  mapx.nnoremap("K", "10k")

  -- File write
  mapx.nnoremap("<leader>w", "<cmd>w<cr>", "Save")

  -- Clear search
  mapx.nnoremap("<leader>/", "<cmd>nohls<cr><cmd>let @/ = ''<cr>", "Clear search")

  -- Quit
  mapx.nnoremap("<leader>Q", "<cmd>qa!<cr>", "Quit Neovim")

  -- Paste
  mapx.inoremap("<C-v>", '<esc>"+pi', "Paste from clipboard")
  mapx.nnoremap("<leader><C-v>", '"+p', "Paste from clipboard")

  -- Open url
  mapx.nnoremap("<leader>B",
    '<Cmd>call jobstart(["microsoft-edge-stable","--new-window", expand("<cfile>")], {"detach": v:true})<CR>', "Open url")

  -- ======================= PLUGINS MAPPINGS ===========================
  -- Undo tree
  mapx.nnoremap("<leader>u", "<cmd>UndotreeToggle<cr>", "Undo tree")

  -- format
  mapx.nnoremap("<leader>f", "<cmd>lua vim.lsp.buf.format({ bufnr = bufnr })<cr>", "Buf: format")

  -- azyGit
  mapx.nnoremap("<leader>lg", "<cmd>TermExec cmd=lazygit&&exit<cr>", "Lazygit")
  mapx.nnoremap("<leader>L", "<cmd>Lazy<cr>", "Lazy")

end
)
return { mapx = mapx }
