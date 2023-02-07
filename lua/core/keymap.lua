vim.g.mapleader = " "
local mapx = require 'mapx'.setup { whichkey = true }

mapx.group({ silent = true }, function()

  -- Quit
  mapx.nnoremap("<leader>Q", function()
    vim.cmd("NeoTreeClose")
    vim.cmd("UndotreeHide")
    vim.cmd("lua require 'dapui'.close()")

    vim.cmd("SaveSession")
    vim.cmd("qa!")
  end, "Quit Neovim")

  -- clear current lines
  mapx.nnoremap("d<space>", "ddO<esc>")

  -- Move selected sections
  mapx.vnoremap("<c-j>", ":m '>+1<cr>gv=gv")
  mapx.vnoremap("<c-k>", ":m '<-2<cr>gv=gv")
  -- redo
  mapx.nnoremap("U", "<cmd>later<cr>", "Redo")

  -- Select all
  mapx.nnoremap("<c-a>", "ggVG", "Select all")
  mapx.vnoremap("<c-a>", "ggVG", "Select all")

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

  mapx.inoremap("<home>", "<esc>^i")
  mapx.inoremap("<end>", "<esc>$a")


  mapx.inoremap("<c-h>", "<Left>")
  mapx.inoremap("<c-j>", "<Down>")
  mapx.inoremap("<c-k>", "<Up>")
  mapx.inoremap("<c-l>", "<Right>")

  -- File write
  mapx.nnoremap("<leader>w", "<cmd>w<cr>", "Save")

  -- Clear search
  mapx.nnoremap("<leader>/", "<cmd>nohls<cr><cmd>let @/ = ''<cr>", "Clear search")


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

  -- Lazygit
  mapx.nnoremap("<leader>lg", "<cmd>TermExec cmd='lazygit&&exit'<cr>", "Lazy")

end
)
return { mapx = mapx }
