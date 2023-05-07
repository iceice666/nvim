local mapx = vim.g.mapx

mapx.group({ silent = true }, function()
  -- Quit
  mapx.nnoremap("<leader>Q", function()
    pcall(vim.cmd, "NeoTreeClose")
    pcall(vim.cmd, "UndotreeHide")
    pcall(vim.cmd, "TroubleClose")
    pcall(vim.cmd, "lua require 'dapui'.close()")

    pcall(vim.cmd, "SaveSession")
    vim.cmd("qa!")
  end, "Quit Neovim")

  -- clear current lines
  mapx.nnoremap("d<space>", "<esc>ddO<esc>")

  -- Move selected sections
  -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua#L32
  mapx.nnoremap("<c-j>", "<cmd>m .+1<cr>==", "Move down")
  mapx.nnoremap("<c-k>", "<cmd>m .-2<cr>==", "Move up")
  mapx.inoremap("<c-j>", "<esc><cmd>m .+1<cr>==gi", "Move down")
  mapx.inoremap("<c-k>", "<esc><cmd>m .-2<cr>==gi", "Move up")
  mapx.vnoremap("<c-j>", ":m '>+1<cr>gv=gv", "Move down")
  mapx.vnoremap("<c-k>", ":m '<-2<cr>gv=gv", "Move up")

  -- redo
  mapx.nnoremap("U", "<cmd>later<cr>", "Redo")

  -- Select all
  mapx.nnoremap("<c-a>", "ggVG", "Select all")
  mapx.vnoremap("<c-a>", "ggVG", "Select all")

  -- better indenting
  -- mapx.vnoremap("<", "^i<bs><esc>")
  -- mapx.vnoremap(">", "^i<tab><esc>")

  -- Cursor jumping
  mapx.nnoremap("J", "10j")
  mapx.nnoremap("K", "10k")
  mapx.vnoremap("J", "10j")
  mapx.vnoremap("K", "10k")

  mapx.nnoremap("L", "$")
  mapx.nnoremap("H", "^")
  mapx.inoremap("<home>", "<esc>^i")
  mapx.inoremap("<end>", "<esc>$a")

  -- stylua: ignore start
  -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
  mapx.nnoremap("n", "'Nn'[v:searchforward]", "Next search result", { expr = true, })
  mapx.xnoremap("n", "'Nn'[v:searchforward]", "Next search result", { expr = true, })
  mapx.onoremap("n", "'Nn'[v:searchforward]", "Next search result", { expr = true, })
  mapx.nnoremap("N", "'nN'[v:searchforward]", "Prev search result", { expr = true, })
  mapx.xnoremap("N", "'nN'[v:searchforward]", "Prev search result", { expr = true, })
  mapx.onoremap("N", "'nN'[v:searchforward]", "Prev search result", { expr = true, })

  -- https://github.com/mhinz/vim-galore#saner-ctrl-l
  mapx.nnoremap("<leader>l", "<cmd>nohlsearch<cr><cmd>diffupdate<cr><cmd>syntax sync fromstart<cr><c-l>")
  -- stylua: ignore end

  mapx.inoremap("<c-h>", "<Left>")
  mapx.inoremap("<c-j>", "<Down>")
  mapx.inoremap("<c-k>", "<Up>")
  mapx.inoremap("<c-l>", "<Right>")

  mapx.nnoremap("<leader><tab>", "<c-w>w")
  mapx.nnoremap("<leader><s-tab>", "<c-w>W")

  -- File write
  mapx.nnoremap("<leader>w", "<cmd>w<cr>", "Write")

  -- Open url
  -- https://www.google.com
  mapx.nnoremap(
    "<leader>B",
    "<Cmd>call jobstart([\"hyprctl\",\"dispatch\",\"exec\",\"--\",\"firefox\",\"--new-window\", expand(\"<cfile>\")], {\"detach\": v:true})<CR>",
    "Open url"
  )

  -- Lazygit
  mapx.nnoremap("<leader>g", function()
    local path =
        require("neo-tree.sources.manager").get_state("filesystem").path
    if path == nil then
      vim.cmd("NeoTreeShow")
      vim.cmd("sleep 100m")
      vim.cmd("NeoTreeClose")
      path = require("neo-tree.sources.manager").get_state("filesystem").path
    end
    vim.cmd("TermExec cmd='cd " .. path .. " && lazygit&&exit'")
  end, "Lazy")

  --custom group
  mapx.nname("<leader>u", "Utils")
  mapx.nname("<leader>b", "Buffers")
  mapx.nname("<leader>f", "UFO Folds")
  mapx.nname("<leader>t", "Telescope")
  mapx.nname("<leader>tf", "Telescope: Find")
  mapx.nname("g", "Goto")
  mapx.nname("<leader>s", "Show info")
end)
