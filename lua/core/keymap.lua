local mapx = vim.g.mapx

local feed_keys = function(keys, mode)
  if keys == nil then
    return
  end

  mode = mode or "n"
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), mode, false)
end

local pre_quit = function()
  pcall(vim.cmd, "NeoTreeClose")
  pcall(vim.cmd, "UndotreeHide")
  pcall(vim.cmd, "TroubleClose")
  pcall(vim.cmd, "lua require 'dapui'.close()")

  pcall(vim.cmd, "SessionSave")
end

mapx.group({ silent = true }, function()
  -- Quit
  mapx.nnoremap("<leader>Q", function()
    pre_quit()
    vim.cmd("qa!")
  end, "Quit Neovim")

  -- restart ( exit with code 1 )
  mapx.nnoremap("<leader>rr", function()
    pre_quit()
    vim.cmd("cq!")
  end, "Reload Neovim")

  -- write
  mapx.nnoremap("<leader>w", "<cmd>w<cr>", "Buf: Write")
  mapx.nnoremap("<leader>F", "<cmd>lua vim.lsp.buf.format()<cr>", "Buf: Format")
  mapx.nnoremap("<leader>W", "<cmd>lua vim.lsp.buf.format()<cr><cmd>w<cr>", "Buf: Format and write")

  -- Move selected sections
  -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua#L32
  mapx.vnoremap("<c-j>", ":m '>+1<cr>gv=gv", "Move down")
  mapx.vnoremap("<c-k>", ":m '<-2<cr>gv=gv", "Move up")

  -- redo
  mapx.nnoremap("U", "<C-R>", "Redo")

  -- Select all
  mapx.nnoremap("<c-a>", "ggVG", "Select all")
  mapx.vnoremap("<c-a>", "ggVG", "Select all")

  -- Cursor jumping

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
  mapx.nnoremap("<leader>/", "<cmd>nohlsearch<cr><cmd>diffupdate<cr><cmd>syntax sync fromstart<cr><c-l>")
  -- stylua: ignore end

  mapx.inoremap("<c-h>", "<Left>")
  mapx.inoremap("<c-j>", "<Down>")
  mapx.inoremap("<c-k>", "<Up>")
  mapx.inoremap("<c-l>", "<Right>")

  mapx.nnoremap("<leader><tab>", "<c-w>w")
  mapx.nnoremap("<leader><s-tab>", "<c-w>W")

  -- Open url
  -- https://www.google.com
  mapx.nnoremap(
    "<leader>B",
    '<Cmd>call jobstart(["hyprctl","dispatch","exec","--","firefox","--new-window", expand("<cfile>")], {"detach": v:true})<CR>',
    "Open url"
  )

  -- An expression mapping for dd that doesn't yank an empty line into your default register
  mapx.nnoremap("dd", function()
    if vim.api.nvim_get_current_line():match("^%s*$") then
      feed_keys('"_dd')
    else
      feed_keys("dd")
    end
  end)

  --An expression mapping for i that will indent properly on empty lines
  mapx.nnoremap("i", function()
    if #vim.fn.getline(".") == 0 then
      feed_keys('"_cc')
    else
      feed_keys("i")
    end
  end)

  --  in json-like structure, that will auto append a comma at the EOL when adding a new line
  mapx.nnoremap("o", function()
    local line = vim.api.nvim_get_current_line()

    if vim.bo.filetype == "json" and string.find(line, "[^,{[]$") then
      feed_keys("A,<CR>")
    else
      feed_keys("o")
    end
  end)

  --custom group
  mapx.nname("<leader>u", "Utils")
  mapx.nname("<leader>b", "Buffers")
  mapx.nname("<leader>f", "UFO Folds")
  mapx.nname("<leader>t", "Telescope")
  mapx.nname("<leader>tf", "Telescope: Find")
  mapx.nname("g", "Goto")
  mapx.nname("<leader>s", "Show info")
end)
