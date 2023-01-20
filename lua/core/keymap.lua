vim.g.mapleader = " "
local mapx = require 'mapx'.setup { whichkey = true }

mapx.group({ silent = true }, function()


  mapx.vnoremap("J", ":m '>+1<cr>gv=gv")
  mapx.vnoremap("K", ":m '<-2<cr>gv=gv")

  -- undo & redo
  mapx.nnoremap("U", "<cmd>later<cr>")

  -- Select all
  mapx.nnoremap("<c-a>", "gg<s-v>G")
  mapx.vnoremap("<c-a>", "gg<s-v>G")

  -- Window split
  mapx.nnoremap("Wl", "<cmd>set splitright<CR>:vsplit<CR>")
  mapx.nnoremap("Wh", "<cmd>set nosplitright<CR>:vsplit<CR>")
  mapx.nnoremap("Wk", "<cmd>set nosplitbelow<CR>:split<CR>")
  mapx.nnoremap("Wj", "<cmd>set splitbelow<CR>:split<CR>")

  -- Cursor jumping
  mapx.nnoremap("L", "$")
  mapx.nnoremap("H", "^")
  mapx.nnoremap("J", "9j")
  mapx.nnoremap("K", "9k")

  -- File write
  mapx.nnoremap("<leader>w", "<cmd>w<cr>")

  -- nohls
  mapx.nnoremap("<leader>/", "<cmd>nohls<cr>")

  -- Quit
  mapx.nnoremap("<leader>Q", "<cmd>qa<cr>")

  -- Clean cmdline
  mapx.nnoremap("<leader><leader>", "<cmd>echo ' '<cr>")

  -- ======================= PLUGINS MAPPINGS ===========================


  -- Undo tree
  mapx.nnoremap("<leader>u", "<cmd>UndotreeToggle<cr>")

  -- format
  mapx.nnoremap("<leader>f", "<cmd>lua vim.lsp.buf.format({ bufnr = bufnr })<cr>")

  -- LazyGit
  mapx.nnoremap("<leader>lg", "<cmd>LazyGit<cr>")
  mapx.nnoremap("<leader>L", "<cmd>Lazy<cr>")

end
)
return { mapx = mapx }
