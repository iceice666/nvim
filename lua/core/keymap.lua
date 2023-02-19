vim.g.mapleader = " "
local mapx = require 'mapx'.setup { whichkey = true }

mapx.group({ silent = true }, function()
  -- Quit
  mapx.nnoremap("<leader>Q", function()
    vim.cmd("NeoTreeClose")
    vim.cmd("UndotreeHide")
    vim.cmd("TroubleClose")
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

  -- indent line ( tab insert & remove )
  mapx.nnoremap("<leader><home>", "^i<tab><esc>")
  mapx.nnoremap("<leader><end>", "^i<bs><esc>")

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

  -- Buffer jumping
  mapx.nnoremap("<leader>h", "<c-w>h")
  mapx.nnoremap("<leader>j", "<c-w>j")
  mapx.nnoremap("<leader>k", "<c-w>k")
  mapx.nnoremap("<leader>l", "<c-w>l")

  mapx.nnoremap("<leaer><tab>", "<c-w>w")
  mapx.nnoremap("<leader><s-tab>", "<c-w>W")

  -- File write
  mapx.nnoremap("<leader>w", "<cmd>w<cr>", "Save")

  -- Clear search
  mapx.nnoremap("<leader>/", "<cmd>nohls<cr><cmd>let @/ = ''<cr>", "Clear search")

  -- Open url
  mapx.nnoremap("<leader>B",
    '<Cmd>call jobstart(["microsoft-edge-stable","--new-window", expand("<cfile>")], {"detach": v:true})<CR>',
    "Open url")

  -- ======================= PLUGINS MAPPINGS ===========================
  -- Undo tree
  mapx.nnoremap("<leader>u", "<cmd>UndotreeToggle<cr>", "Undo tree")

  -- format
  mapx.nnoremap("<leader>f", "<cmd>lua vim.lsp.buf.format({ bufnr = bufnr })<cr>", "Buf: format")

  -- Lazygit
  mapx.nnoremap("<leader>g", "<cmd>TermExec cmd='cd " .. vim.fn.getcwd() .. "&& lazygit&&exit'<cr>", "Lazy")
end
)
return { mapx = mapx }
